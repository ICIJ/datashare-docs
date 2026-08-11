---
description: >-
  What the errors in your indexing logs mean, which ones are harmless, and what
  to do about the ones that are not.
---

# Troubleshooting indexing

Indexing logs are noisy by nature. Most of the volume comes from parsers complaining about imperfect files while extracting them perfectly well. This page sorts the signal from the noise.

## First, a triage method

Rather than reading the log top to bottom, count what is in it:

```bash
# How many of each log level
grep -ac " ERROR " datashare.log
grep -ac " WARN "  datashare.log

# Which loggers are shouting the most
grep -a " WARN \| ERROR " datashare.log \
  | sed -E 's/.*(WARN|ERROR) +([A-Za-z0-9_$]+).*/\1 \2/' \
  | sort | uniq -c | sort -rn | head -20
```

A handful of classes almost always account for 80% or more of the volume, and they are usually the benign ones. Once you know which, you can filter them out and read what is left.

The other half of triage is checking whether documents were actually lost:

```bash
curl -s 'http://elasticsearch:9200/my-project/_count' \
  -H 'Content-Type: application/json' \
  -d '{"query":{"term":{"type":"Document"}}}' | jq .count
```

An error that does not reduce that number is not costing you anything.

## Noise you can ignore

These are logged in large volumes and cost you no content.

| Message | What it means |
| ------- | ------------- |
| `Using fallback font LiberationSans for <font>` | The PDF does not embed a font, so PDFBox substitutes one. Text extraction is unaffected. Frequently 80% or more of all warnings. |
| `found wrong object number. expected [N] found [M]` | A slightly corrupt PDF cross-reference table, repaired automatically. |
| `No Unicode mapping for ...` | A glyph in a PDF has no character mapping. That glyph is missing from the text, the rest is fine. |
| `Paragraph has no PAPX. Creating new one.` | A legacy Word file with malformed structure. The text is still extracted. |
| `Couldn't find a defined charset; backing off to cp1252` | A very old Word file with no declared encoding. |
| `Unable to load picture from BLIP record` | An unreadable image inside an old Word file. The document text is unaffected. |
| `No content hash for embed "..."` | An embedded item with no readable bytes. Datashare falls back to a deterministic id built from its parent. |

If this noise makes your logs unreadable, raise the log level to `WARN` or `ERROR` with `--logLevel`, or filter it in your log shipper.

## Errors that mean something

### `Unable to parse embedded document`

```
ERROR EmbedParser - Unable to parse embedded document: "<name>" (<mime>) (in "<archive>")
```

Usually benign. The parent document is indexed normally, and the embedded item is indexed with an exception marker and little or no text. It happens constantly on archives full of source code, fonts, SVGs and broken images.

Look at the underlying cause. If it is `NoSuchFileException`, that is not a broken file, it is a **temporary directory problem**: the spool file Datashare wrote vanished before it was read, which usually means `/tmp` filled up. Move the temporary directory to a volume with room:

```bash
DS_JAVA_OPTS="-Djava.io.tmpdir=/data/tmp" datashare stage run ...
```

and keep that directory outside `--dataDir`.

### `The file could not be parsed`

```
ERROR Extractor - The file could not be parsed: "<path>"
```

A root-level failure: this file produced no content. Typical causes are multi-part or truncated archives (`.z01`, half-copied `.zip` and `.rar`), font metric files misdetected as documents, and formats Tika does not support.

Most of these are genuinely unparseable. Check a couple by hand before concluding, and remember the file is recorded in the report map, so a rerun retries it.

### OCR timed out

```
Caused by: org.apache.tika.exception.TikaException: TesseractOCRParser timeout
```

What it costs you depends on where the image was:

* **An image inside a container** (an attachment, an image embedded in a document): the failure is recorded on that embedded document, which is still indexed with no text. Its parent is unaffected.
* **A loose image file on disk**: OCR is the only source of text for it, and the failure propagates, so the file is not indexed at all. It is recorded in the report map and retried on the next run.

Two causes, in order of likelihood:

1. **CPU oversubscription.** Every Tesseract process is fanning out over all cores and none of them finishes in time. Check with `ps -eo comm,nlwp | grep tesseract`: if `NLWP` is above 1, set `OMP_THREAD_LIMIT=1`. See [Tuning](tuning.md#the-single-most-important-setting).
2. **A genuinely huge scan.** Raise `--ocrTimeout`, or index that file separately with OCR off.

### Corrupt or empty mail archive

```
TikaException: Invalid file header: \0\0\0\0, expected: !BDN
```

The file does not start with the Outlook magic bytes. It is empty, truncated or a placeholder. There is nothing to recover: check the file on disk with `ls -l` and `file`.

### Mail archive partially readable

```
com.pff.PSTException: Unable to find <N> is desc: true
```

The mailbox reader could not resolve an entry in the archive's internal index. Where it happens decides how bad it is:

* **On a folder, mid-walk**: that folder is abandoned early, but orphan recovery usually picks the messages up anyway, so little or nothing is lost. Compare the message counts logged for that file at the end of the parse.
* **At the root of the file**: the whole archive fails. Try converting it outside Datashare with `readpst -e -D -o /some/dir archive.pst` and indexing the resulting `.eml` files instead.

Modern Outlook archives (`.ost`, Outlook 2013 and later) also contain compressed attachment blocks that older readers mishandle. Recent Datashare versions recover the large majority of them, so **keep Datashare up to date if your corpus is mail-heavy**. A run will report how many attachments it recovered and how many it could not.

### Out of memory

```
java.lang.OutOfMemoryError: Required array length 2147483639 + 9 is too large
java.lang.OutOfMemoryError: Java heap space
```

Almost always a single document with an enormous amount of extracted text (a multi-gigabyte log or data file inside an archive). Fixes, in order:

1. Keep `--maxContentLength` at a sane value. 20 MB is the default and is plenty for a searchable document.
2. Raise the heap with `DS_JAVA_OPTS="-Xmx8g"`.
3. Move the offending files out of the tree, or point `--dataDir` at a subtree without them.

Add `-XX:+ExitOnOutOfMemoryError` so the process dies instead of thrashing, then restart it: with a report map, it resumes.

### Elasticsearch mapping errors

```
ElasticsearchException [mapper_parsing_exception] failed to parse field
[metadata.tika_metadata_dcterms_created] of type [date]
```

A document carries a date in a format Elasticsearch will not accept. Recent versions handle malformed dates by keeping the raw value instead of rejecting the document. If you see this, upgrade. If you cannot upgrade immediately, the affected documents are the ones with unusual creation dates, which tend to be very old files.

If the error appears at **index creation** instead (`Failed to parse mapping [_doc]`), your Elasticsearch is older than the mappings Datashare wants to install. Check the Elasticsearch version Datashare supports for your release.

## Symptoms

### The run finishes immediately and indexes nothing

The queue was empty. Almost always one of:

* `SCAN` was never run, or ran against the wrong `--dataDir`.
* `--queueName` differs between the SCAN command and the INDEX command. They must match: INDEX reads `<queueName>:index`.
* `--queueType` is `MEMORY` in one of the two commands, so they never shared a queue at all.

Check the queue directly:

```bash
redis-cli -h redis LLEN extract:queue:index
```

### Everything is re-indexed from scratch on every restart

You are running without `--reportName`. Without it, Datashare records no outcome per file and has nothing to skip. Add it, and use the same value every time for a given project.

### The same documents appear twice

Document ids are content hashes. Two ids for one file means the hashing configuration changed between runs: `--digestAlgorithm`, or `--digestProjectName`. Keep both stable for the lifetime of a project, or re-index the project from scratch.

Note that the same file at two different paths is **one** document with two paths, which is intended behaviour rather than a duplicate.

### A large mailbox or archive produced nothing, and rerunning does not retry it

Look for a parse timeout on that path. `--parseTimeout` covers one document **and its whole embedded tree**, so a large mailbox indexed with OCR on can exceed the 24 hour default. A timeout is recorded as a **terminal** status, which the resume logic deliberately skips: retrying it would spend the same day to fail the same way.

To index it, raise the timeout **and** get the file retried, either by using a fresh `--reportName` or by deleting its entry:

```bash
datashare stage run --stages SCAN,INDEX \
  --parseTimeout 72h \
  --reportName "report:my-project-retry" ...
```

Consider also splitting the file first, or indexing it with `--ocr false`, which is usually what pushed it past the timeout.

### The run makes no progress but the CPU is at 100%

A document is stuck in a parser. Find out which:

```bash
# find the actual JVM
pgrep -af "java.*datashare"

# ask it for a thread dump, which goes to the log (this does not kill it)
kill -3 <pid>
```

Look at the top frames of the busy threads. If Datashare is at a recent version this is rare, `--parseTimeout` (24h by default) eventually breaks the deadlock, and progress heartbeat lines in the log name the documents currently being processed. Lower `--parseTimeout` to something like `30m` if you would rather lose one document than a day.

### Indexing was interrupted and I do not know what is missing

See [find what is missing](scenarios.md#find-what-is-missing). The short version: re-run the same command with the same report map. Everything already done is skipped, so the cost is proportional to what actually remains.

### Documents are in Elasticsearch but users do not see them

That is not an indexing problem. Check that the project name you indexed into is the project users have access to (`--defaultProject` is the index name), and check the [permission model](../permission-model.md).

### Entities appear in the filters but not in the documents

A known display case documented in the [FAQ](../../usage/faq/common-errors/i-see-people-organizations-and-locations-in-the-filters-but-not-in-the-documents.md).

## Getting help

When reporting an indexing problem, the useful information is:

* the exact command you ran, with the options;
* `datashare --version`;
* the Elasticsearch version;
* the number of files, their types and the size of the corpus;
* the machine: cores, RAM, and whether Elasticsearch runs on it;
* the log lines around the failure, including the `Caused by:` lines.

See [Ask for help](../../ask-for-help.md).

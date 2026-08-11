---
description: >-
  Every option that changes how Datashare indexes: command-line flags,
  environment variables and what cannot be configured from the command line.
---

# Indexing options

## Where options come from

**A pipeline stage is configured by command-line flags, and by nothing else.**

That is worth stating plainly, because Datashare also has a settings file (`--settings`) and reads `DS_DOCKER_*` environment variables, and neither of them changes how a stage runs:

* every option has a built-in default, and the command line passes that default even when you do not type the flag, so it wins over anything the settings file says;
* a key in the settings file that is not a flag is **silently ignored** by `stage run`. There is no error and no warning.

Those two channels configure the **web application**, not a stage run. Use flags for indexing.

{% hint style="warning" %}
Verified on 21.17.0: a settings file containing `includePattern`, `excludePattern` and `maxDepth` changed nothing, all six files in the test directory were queued, and `DS_DOCKER_QUEUE_NAME` was ignored the same way. Behaviour around the settings file has changed between versions, so treat `datashare stage run --help` as the authority for the version you run.
{% endhint %}

Options are position-independent: `datashare --dataDir /data stage run --stages SCAN` and `datashare stage run --stages SCAN --dataDir /data` are the same command.

## Global options

These apply to every subcommand.

| Option | Default | What it does |
| ------ | ------- | ------------ |
| `-d, --dataDir` | `~/Datashare` | Directory the SCAN stage walks. In Docker this is the path inside the container. |
| `-P, --defaultProject` | `local-datashare` | Project name, which is also the Elasticsearch index name. |
| `--elasticsearchAddress` | `http://elasticsearch:9200` | Where documents are written. |
| `--redisAddress` | `redis://redis:6379` | Redis used for queues and the report map. |
| `--queueType` | `MEMORY` | `MEMORY`, `REDIS` or `AMQP`. Use `REDIS` for anything you want to resume or distribute. |
| `--queueName` | `extract:queue` | Base queue name. Each stage reads `<queueName>:<stage>`. |
| `--queueCapacity` | `1000000` | Maximum number of entries held in an in-memory queue. |
| `--busType` | `MEMORY` | Transport for internal events. Not the document queue, which is `--queueType`. |
| `--messageBusAddress` | `redis://redis:6379` | Address of the data bus when it is not in memory. |
| `--dataSourceUrl` | local SQLite file | JDBC URL of the database. Use PostgreSQL in server mode. |
| `-l, --language` | detected | Forces the language of every document instead of detecting it. See [Tuning](tuning.md#language). |
| `--charset` | JVM default | Output encoding for extracted text and metadata. |
| `--digestAlgorithm` | `SHA384` | Hash used to compute document ids. Changing it changes every id. |
| `--digestProjectName` | none | Includes the project name in the hash, so the same file in two projects gets two ids. |
| `-s, --settings` | launcher-dependent | Path to the properties file. It configures the web application, not a stage run. |
| `--logLevel` | `INFO` | `DEBUG`, `INFO`, `WARN` or `ERROR`. |

{% hint style="danger" %}
`--digestAlgorithm` and `--digestProjectName` must stay identical for the life of a project. Change either one and the same file indexed again produces a **new document id**, so you get duplicates instead of updates.
{% endhint %}

## `stage run` options

### Selecting work

| Option | Default | What it does |
| ------ | ------- | ------------ |
| `--stages` | required | Comma-separated stages, for example `SCAN,INDEX,NLP`. |
| `--reportName` | none | Name of the report map recording per-file outcomes. **Without it, nothing is recorded and nothing can be skipped on a rerun.** It is stored wherever `--queueType` points, so pair it with `REDIS` to make it survive the process. |
| `--searchQuery` | none | Restricts `ENQUEUEIDX` and `SCANIDX`. Datashare query syntax, or a raw Elasticsearch clause in JSON. |
| `--createIndex` | none | Creates an index with the given name before running. |
| `--followSymlinks` | `true` | Whether SCAN follows symbolic links. |

### Text extraction and OCR

| Option | Default | What it does |
| ------ | ------- | ------------ |
| `-o, --ocr` | `true` | Whether images are OCR'd at all. **This is on by default and it is the most expensive setting in Datashare.** |
| `--ocrLanguage` | Tesseract default (`eng`) | Language packs used by Tesseract. Combine several with `+`, for example `eng+fra+deu`, using 3-letter ISO 639-2 codes. |
| `--ocrStrategy` | `NO_OCR` | How PDFs are handled. See below. |
| `--ocrType` | `TESSERACT` | OCR engine, `TESSERACT` or `TESS4J`. |
| `--ocrTimeout` | `12h` | Wall-clock limit for a single OCR run. |
| `--parseTimeout` | `24h` | Wall-clock limit for parsing one document, including its embedded tree. `0` disables it. |
| `--maxContentLength` | `20000000` | Maximum extracted text kept per document. Accepts human-readable sizes like `20M`. Longer text is truncated, the document is still indexed. |
| `--maxEmbedDepth` | `20` | How deep Datashare descends into nested containers. Deeper embedded documents are recorded but not parsed. `0` disables the guard. |

**`--ocr` versus `--ocrStrategy`.** These control two different things and the distinction matters:

* `--ocr` decides whether images are passed to Tesseract at all. With `--ocr false`, nothing is OCR'd anywhere.
* `--ocrStrategy` decides what happens to **PDF pages**. The default `NO_OCR` never renders a page: Datashare extracts the PDF's text layer, and any image embedded in the page is extracted and OCR'd as a separate embedded document. For a scanned PDF, that means the text ends up on the embedded image rather than on the PDF itself. Setting `--ocrStrategy AUTO` renders whole pages and OCRs them, which is what you want for scanned or mixed-content PDFs, and puts the text on the document itself.

Values are `NO_OCR` (default), `AUTO`, `OCR_AND_TEXT_EXTRACTION` and `OCR_ONLY`. Any rendering strategy disables inline-image extraction, so it costs more CPU but produces the result users expect from a scanned document.

{% hint style="info" %}
Tesseract only reads languages that are installed on the machine. On Debian and Ubuntu, `sudo apt install tesseract-ocr-fra` adds French, and `tesseract --list-langs` shows what is available. Passing `--ocrLanguage` with a language that is not installed produces poor text and no clear error. See [add more languages](../../local-mode/add-more-languages.md).
{% endhint %}

### Throughput

| Option | Default | What it does |
| ------ | ------- | ------------ |
| `--parallelism` | number of CPU cores | Number of documents extracted concurrently. The one throughput knob that matters. |
| `--scrollSize` | `1000` | Batch size when a stage reads from Elasticsearch. |
| `--scrollSlices` | `1` | Number of parallel slices for `SCANIDX`. Raise it to speed up a big report-map import. |
| `--scroll` | `60000ms` | Elasticsearch scroll duration. |
| `--indexTimeout` | `30` | Minutes between "consumer has not terminated yet" log lines while INDEX waits for its workers. |
| `--parserParallelism` | `1` | Legacy option, kept for compatibility. Nothing reads it today, use `--parallelism`. |

See [Tuning](tuning.md) before changing these.

### Named entity recognition

| Option | Default | What it does |
| ------ | ------- | ------------ |
| `--nlpPipeline` | `CORENLP` | `CORENLP`, `OPENNLP`, `EMAIL` or `SPACY`. |
| `--nlpParallelism` | `1` | Number of Python NLP workers. Applies to the `SPACY` pipeline only. |
| `--batchSize` | `1024` | Documents per batch for the batched NLP stages. |
| `--maxTextLength` | `1024` | Maximum text length per NLP unit. |

### Artifacts

| Option | Default | What it does |
| ------ | ------- | ------------ |
| `--artifactDir` | none | Directory where embedded document payloads are cached. Required by the `ARTIFACT` stage. |
| `--artifacts` | none at INDEX, all types at ARTIFACT | Comma-separated artifact types: `raw`, `structure`, `page`. The INDEX stage only ever produces `raw`. |
| `--artifactsForce` | `false` | Reprocess artifacts even when the cache already covers them. |

## Environment variables

| Variable | Set by default | What it does |
| -------- | -------------- | ------------ |
| `DS_JAVA_OPTS` | empty | JVM options for Datashare, most importantly the heap (`-Xms`, `-Xmx`). |
| `ES_JAVA_OPTS` | empty | JVM options for Elasticsearch when Datashare starts it. |
| `OMP_THREAD_LIMIT` | `1` | Threads each Tesseract process may use. See [Tuning](tuning.md#the-single-most-important-setting). |
| `OMP_WAIT_POLICY` | `passive` | Makes idle OCR threads sleep rather than spin. |
| `DS_DOCKER_*` | none | Any Datashare option, upper-cased and underscored. `DS_DOCKER_OCR=false` sets `ocr`. |
| `DATASHARE_DATA_DIR` | `$HOME/Datashare` | Default `--dataDir` used by the `.deb` launcher. |
| `DATASHARE_HOME` | `$HOME/.local/share/datashare` | Where Datashare keeps its settings, plugins and extensions. |
| `DATASHARE_JAR` | `/usr/share/java/datashare.jar` | Which jar the launcher runs. |

{% hint style="danger" %}
`OMP_THREAD_LIMIT=1` is exported by the `datashare` launcher and by the Docker entrypoint. If you run the jar directly (`java -jar datashare-dist-*-all.jar`) or from a custom systemd unit that calls `java` yourself, **you have to export it yourself**. Without it, OCR-heavy indexing runs an order of magnitude slower and can silently drop documents.
{% endhint %}

Setting the heap:

```bash
DS_JAVA_OPTS="-Xms2g -Xmx8g" datashare stage run --stages SCAN,INDEX ...
```

In Docker Compose, pass it through the service environment:

```yaml
services:
  datashare:
    environment:
      - DS_JAVA_OPTS=-Xms2g -Xmx8g
      - OMP_THREAD_LIMIT=1
```

## What you cannot configure from the CLI

The extraction library carries more knobs than Datashare exposes: the size of the OCR pool, the mailbox folder fan-out, the embedded-text memory budget, glob patterns for the scanner, and a few others. **None of them can be set for a `stage run` invocation.** Only the flags documented above reach a stage.

Their built-in behaviour still applies, and it is described in [Tuning](tuning.md): the OCR pool and the mailbox fan-out are both sized to the core count, embedded text buffers about 64 MB per document before spilling to disk, and the scanner takes every file it finds.

If you need to index only part of a corpus, scope it with `--dataDir` or stage the files you want into their own directory. See [scenario 6](scenarios.md#scenario-6-index-only-part-of-a-corpus).

The temporary directory is the exception, because it is a JVM property rather than a Datashare option, so it goes in `DS_JAVA_OPTS`:

```bash
DS_JAVA_OPTS="-Djava.io.tmpdir=/data/tmp" datashare stage run --stages SCAN,INDEX ...
```

## Checking what a version supports

Options change between versions. The command line is the authority for the version you are running:

```bash
datashare --help
datashare stage run --help
datashare --version
```

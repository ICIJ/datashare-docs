---
description: >-
  The ARTIFACT stage caches the payload of embedded documents on disk, so
  previews and downloads do not re-parse their container.
---

# ARTIFACT

ARTIFACT pops document ids from its queue, re-opens each document's source file, and writes the payload of its embedded documents to a directory on disk, along with a manifest recording what was produced.

Without it, opening an attachment means re-parsing the mailbox or archive it lives in, every time. On large containers that is the difference between an instant preview and a long wait.

```bash
datashare stage run \
  --stages ENQUEUEIDX,ARTIFACT \
  --defaultProject my-project \
  --searchQuery 'extractionLevel:0' \
  --artifactDir /vault/artifacts \
  --elasticsearchAddress http://elasticsearch:9200 \
  --queueType REDIS \
  --redisAddress redis://redis:6379
```

## Input and output

| | |
| --- | --- |
| Reads | `<queueName>:artifact`, documents from Elasticsearch, and the source files from disk |
| Writes | artifact files and `manifest.json` under `--artifactDir`, per project |
| Distributable | **Yes.** Several machines can drain the same queue, provided they share the artifact directory |

## Options that affect it

| Option | Default | Effect |
| ------ | ------- | ------ |
| `--artifactDir` | none | **Required.** Root directory of the cache. The stage refuses to start without it. |
| `--artifacts` | all types | Comma-separated types to produce: `raw`, `structure`, `page`. |
| `--artifactsForce` | `false` | Reprocess documents whose manifest is already up to date. |
| `--parallelism` | **1** | Number of artifact workers. Note the default differs from INDEX, where it is the core count. |
| `-P, --defaultProject` | `local-datashare` | Decides both the index read and the subdirectory written. |

## Execution details

* **Enqueue root documents only.** Processing a root caches its whole embedded subtree as a side effect, so `--searchQuery 'extractionLevel:0'` is the right filter. Enqueuing every document instead means re-opening the same container once per embedded item.
* **`--parallelism` defaults to 1 here.** Set it explicitly when you want this stage to use the machine. It is a per-document parallelism, so it has the same "one container is one work unit" shape as INDEX.
* **The cache is skip-if-current.** A document whose manifest is up to date is skipped, which makes reruns cheap. `--artifactsForce true` reprocesses everything, including what is already cached.
* **`--parseTimeout` does not apply to this stage.** A document whose parse never returns holds its worker until the whole task times out. The stage warns at startup when you have set a non-default value, precisely so this is not a surprise.
* **Failures do not need `--artifactsForce` to retry.** A document that failed or could not be fetched gets no terminal manifest entry, so a plain rerun of the same command reprocesses exactly those. The stage logs the counts on exit so you know whether a rerun is worth it.
* **It reads source files from disk**, so it needs the same `--dataDir` layout as the INDEX run that produced the documents.

## Producing artifacts during indexing instead

The INDEX stage can write the `raw` payload as it parses, which avoids a second full pass over the corpus:

```bash
datashare stage run --stages SCAN,INDEX \
  --artifacts raw \
  --artifactDir /vault/artifacts \
  ...
```

INDEX only ever produces `raw`. Asking it for `structure` or `page` without also running the ARTIFACT stage logs a warning and produces nothing for those types. The trade-off is a slower, more disk-hungry indexing run against a second pass later.

## Disk usage

Artifacts are copies of embedded payloads, so a corpus dominated by mail attachments can produce an artifact directory of the same order of magnitude as the source. Put it on a volume with room, and expect it to grow with the corpus rather than with the index.

## See also

* [Scenario 10: backfills on an existing index](../../server-mode/indexing/scenarios.md#scenario-10-backfills-on-an-existing-index)
* [ENQUEUEIDX](enqueueidx.md), which feeds this stage.

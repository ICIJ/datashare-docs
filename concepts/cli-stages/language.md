---
description: >-
  The LANGUAGE stage re-detects the language of documents that are already
  indexed, and rewrites their language field in place.
---

# LANGUAGE

LANGUAGE pops document ids from its queue, reads each document's content back from Elasticsearch, runs the language detector over it again, and updates the `language` field when the new guess differs from the stored one.

It is a backfill stage, for corpora indexed by an older version whose detector was less accurate, or indexed before their scans were OCR'd. Documents indexed by a recent version already carry the language this stage would compute.

Available from Datashare 21.21.0.

```bash
datashare stage run \
  --stages ENQUEUEIDX,LANGUAGE \
  --defaultProject my-project \
  --elasticsearchAddress http://elasticsearch:9200 \
  --queueType REDIS \
  --redisAddress redis://redis:6379
```

## Input and output

| | |
| --- | --- |
| Reads | `<queueName>:language`, and documents from Elasticsearch |
| Writes | the `language` field back to Elasticsearch |
| Distributable | **Yes.** Several machines can drain the same queue |

## Options that affect it

| Option | Default | Effect |
| ------ | ------- | ------ |
| `-P, --defaultProject` | `local-datashare` | The index to read from and write to. |
| `--parallelism` | **1** | Number of detection workers. Note the default differs from INDEX, where it is the core count. |
| `--queueName` / `--queueType` | `extract:queue` / `MEMORY` | The queue it drains. |

It has no options of its own. Which documents get re-detected is decided upstream by [ENQUEUEIDX](enqueueidx.md), including its `--searchQuery`.

## Execution details

* **It detects on exactly what indexing detects on.** Content first, and the file name as a fallback when the content gives no answer, which is the same call the INDEX stage makes. So a re-run cannot downgrade a document that INDEX already got right.
* **Detection reads the first 10,000 characters** of the content. That is plenty for n-gram detection and bounds the cost on multi-MB documents.
* **A file name is only used when the content says nothing**, and only if it carries at least 15 letters, or is written in a script that identifies its language on its own. Below that, a name like `IMG_20240101` stays `UNKNOWN` instead of producing a confident wrong answer.
* **Nothing is re-parsed and no file is re-read.** The stage works from the indexed content, so it does not need `--dataDir` and never touches the source files.
* **Only changed languages are written.** A document whose guess matches its stored language is counted as unchanged and left alone.
* **It does not forward ids to the next stage.** Unlike CATEGORIZE, LANGUAGE is a terminal stage: put it last in your `--stages` list.
* **A missing document is skipped with a warning**, and a failure on one document is logged without stopping the run. Both keep their existing language.
* **A failed or skipped document is re-runnable as is.** Nothing was written for it, so running the same command again redoes exactly those. The stage logs the counts of updated, unchanged, skipped and failed documents on exit, so you know whether a re-run is worth it.
* **It is idempotent.** Re-detecting a document whose language is already correct writes nothing.
* **`--parallelism` defaults to 1 here.** Set it explicitly when you want this stage to use the machine.

{% hint style="info" %}
With the Temporal task manager, this stage has a 1 day activity timeout. Enqueue in batches if a single run over your index would take longer than that.
{% endhint %}

## Re-detecting only the documents that need it

Detection is cheap, but reading every document's content from Elasticsearch is not. Narrow the set with `--searchQuery` when you know which documents are suspect, for example the ones the old detector gave up on:

```bash
datashare stage run \
  --stages ENQUEUEIDX,LANGUAGE \
  --defaultProject my-project \
  --searchQuery 'language:UNKNOWN' \
  --elasticsearchAddress http://elasticsearch:9200 \
  --queueType REDIS \
  --redisAddress redis://redis:6379
```

## See also

* [ENQUEUEIDX](enqueueidx.md), which feeds this stage.
* [Scenario 10: backfills on an existing index](../../server-mode/indexing/scenarios.md#scenario-10-backfills-on-an-existing-index)

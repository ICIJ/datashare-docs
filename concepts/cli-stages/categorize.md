---
description: >-
  The CATEGORIZE stage fills the contentTypeCategory field of documents that are
  already indexed.
---

# CATEGORIZE

CATEGORIZE pops document ids from its queue, reads each document's content type from Elasticsearch, derives a coarse category from it, and updates the document. That category is what the file type filter in the interface uses.

It is a backfill stage: documents indexed by a recent version already carry the field.

```bash
datashare stage run \
  --stages ENQUEUEIDX,CATEGORIZE \
  --defaultProject my-project \
  --elasticsearchAddress http://elasticsearch:9200 \
  --queueType REDIS \
  --redisAddress redis://redis:6379
```

## Input and output

| | |
| --- | --- |
| Reads | `<queueName>:categorize`, and documents from Elasticsearch |
| Writes | the `contentTypeCategory` field back to Elasticsearch, and forwards each id to the next stage's queue |
| Distributable | **Yes.** Several machines can drain the same queue |

## Options that affect it

| Option | Default | Effect |
| ------ | ------- | ------ |
| `-P, --defaultProject` | `local-datashare` | The index to read from and write to. |
| `--queueName` / `--queueType` | `extract:queue` / `MEMORY` | The queue it drains. |

It has no options of its own. What gets categorized is decided upstream by [ENQUEUEIDX](enqueueidx.md), including its `--searchQuery`.

## Execution details

* **The loop is single-threaded**, one document at a time. Parallelism comes from running the stage in several processes.
* **The category is derived from the content type already stored in the index.** Nothing is re-parsed and no file is re-read, which makes this the cheapest stage in the pipeline.
* **A document with no content type gets the `OTHER` category** rather than being skipped.
* **It forwards ids to the next stage.** Unlike NLP, CATEGORIZE passes each entry on, so `ENQUEUEIDX,CATEGORIZE,NLP` runs both over the same set of documents in one command.
* **A missing document is skipped with a warning**, and a failure on one document is logged without stopping the loop.
* **It is idempotent.** Recomputing the category of a document that already has one writes the same value.

{% hint style="info" %}
With the Temporal task manager, this stage has a 10 minute activity timeout, which is short compared to the other stages. Enqueue in batches if you are backfilling a very large index on that setup.
{% endhint %}

## See also

* [ENQUEUEIDX](enqueueidx.md), which feeds this stage.
* [Scenario 10: backfills on an existing index](../../server-mode/indexing/scenarios.md#scenario-10-backfills-on-an-existing-index)

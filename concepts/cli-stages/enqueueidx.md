---
description: >-
  The ENQUEUEIDX stage pushes documents that are already indexed back onto a
  queue, so a later stage can process them.
---

# ENQUEUEIDX

ENQUEUEIDX scrolls an Elasticsearch index and pushes the id of every matching document onto the queue of the next stage. It is the entry point of every "do something to documents I already have" pipeline, and it is always used in front of another stage.

```bash
datashare stage run \
  --stages ENQUEUEIDX,NLP \
  --defaultProject my-project \
  --nlpPipeline CORENLP \
  --elasticsearchAddress http://elasticsearch:9200 \
  --queueType REDIS \
  --redisAddress redis://redis:6379
```

## Input and output

| | |
| --- | --- |
| Reads | the Elasticsearch index named after `--defaultProject` |
| Writes | the queue of the next stage, for example `extract:queue:nlp` or `extract:queue:artifact` |
| Distributable | **No.** It scrolls the index from end to end; a second copy enqueues everything twice |

## Options that affect it

| Option | Default | Effect |
| ------ | ------- | ------ |
| `-P, --defaultProject` | `local-datashare` | The index to read. |
| `--searchQuery` | none | Restricts what is enqueued. Datashare query syntax, or a raw Elasticsearch clause in JSON. |
| `--nlpPipeline` | `CORENLP` | Used by the default selection when the next stage is NLP, see below. |
| `--scrollSize` | `1000` | Documents per scroll page. |
| `--scroll` | `60000ms` | Elasticsearch scroll duration. |

## Execution details

* **What it selects depends on the stage that follows it.** With no `--searchQuery`:
  * in front of `NLP`, it selects the documents **not yet processed** by `--nlpPipeline`. This is what makes an interrupted NER run resumable: rerun the same command and it picks up where it stopped;
  * in front of any other stage, it selects every document in the index.
* **`--searchQuery` replaces that selection entirely.** With a query, the "not yet processed" filter no longer applies, so an `ENQUEUEIDX,NLP` run with a query will re-process documents the pipeline has already seen.
* **Two query syntaxes are accepted.** A value starting with `{` and ending with `}` is treated as a raw Elasticsearch clause and used as the `must` clause of a bool query, so pass the clause itself rather than a full `{"query": ...}` body. Anything else is parsed with the same syntax as the Datashare search bar.

  ```bash
  --searchQuery 'language:FRENCH'
  --searchQuery '{"term":{"contentType":"application/pdf"}}'
  ```
* **It enqueues ids, not content.** The document body is fetched again by the consuming stage, which is why this stage is cheap even on a very large index.
* **Results are sorted by language.** That is what lets the NLP stages group work by language and avoid reloading a model for every document.
* **Embedded documents are included** like any other document. To enqueue only the files that came from disk, filter on `extractionLevel:0`, which is what the ARTIFACT stage wants.

## Failure and restart

The stage keeps no state. If it is interrupted, rerun it: in front of NLP the "not yet processed" filter means it naturally enqueues only what remains, and elsewhere it re-enqueues everything, which costs a second pass but produces the same result.

## See also

* [NLP](nlp.md), [CATEGORIZE](categorize.md), [ARTIFACT](artifact.md) and [LANGUAGE](language.md), the stages usually placed after it.
* [Scenario 7: extract named entities after indexing](../../server-mode/indexing/scenarios.md#scenario-7-extract-named-entities-after-indexing)

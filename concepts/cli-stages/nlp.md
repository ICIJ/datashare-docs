---
description: >-
  The NLP stage extracts named entities from documents that are already
  indexed.
---

# NLP

NLP pops document ids from its queue, fetches each document's text from Elasticsearch, runs a named entity recognition pipeline over it, and writes the mentions it finds back to Elasticsearch as children of that document. It also marks the document with the pipeline that processed it.

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
| Reads | `<queueName>:nlp`, and document content from Elasticsearch |
| Writes | named entities into the same Elasticsearch index, and a pipeline marker on each document |
| Distributable | **Yes.** Several machines can drain the same queue |

## Options that affect it

| Option | Default | Effect |
| ------ | ------- | ------ |
| `--nlpPipeline` | `CORENLP` | `CORENLP`, `OPENNLP`, `EMAIL` or `SPACY`. |
| `-P, --defaultProject` | `local-datashare` | The index to read from and write to. |
| `--maxContentLength` | `20000000` | Chunk size in characters. Documents longer than this are processed in several passes. |
| `--queueName` / `--queueType` | `extract:queue` / `MEMORY` | The queue it drains. |

Note what is **not** here: `--parallelism` has no effect on this stage, and `--nlpParallelism` only sizes the Python worker pool used by the `SPACY` pipeline.

## Execution details

* **The loop is single-threaded.** One document is processed at a time, in one thread. Parallelism comes from running the stage in several processes or on several machines against the same queue, not from a flag.
* **Models are loaded per language.** The pipeline is initialised for the document's language and released afterwards, so a queue sorted by language (which is what [ENQUEUEIDX](enqueueidx.md) produces) avoids reloading a model on every document. CoreNLP models are the reason this stage wants more heap than an INDEX run.
* **Long documents are chunked.** A document longer than `--maxContentLength` characters is processed in successive chunks, and the pipeline marker is written with the last one. This is the same flag that caps the text kept at index time, so raising it for one stage affects the other.
* **The pipeline marker is what makes the stage idempotent.** A document processed by `CORENLP` is tagged as such, so an `ENQUEUEIDX,NLP` rerun skips it. Running a **different** pipeline over the same corpus processes every document again, which is intended: entities from different pipelines coexist.
* **A missing document is skipped with a warning.** Ids can outlive their document if the index was modified between the enqueue and the processing.
* **A failure on one document is logged and the loop continues.** There is no report map at this stage; a document whose extraction throws is simply left without entities and is not marked, so a later run tries again.
* **Termination**: when `ENQUEUEIDX` is listed in the same command, NLP keeps polling while it runs. Alone, it stops on its first empty poll.

## Choosing a pipeline

| Pipeline | Extracts | Cost |
| -------- | -------- | ---- |
| `CORENLP` | People, organizations, locations | The default, and the most expensive |
| `OPENNLP` | People, organizations, locations | Alternative engine, requires its extension |
| `EMAIL` | Email addresses only | Very cheap, useful on mail corpora |
| `SPACY` | People, organizations, locations | Runs in a Python worker, see [CREATENLPBATCHESFROMIDX](createnlpbatchesfromidx.md) |

## See also

* [ENQUEUEIDX](enqueueidx.md), which feeds this stage from an existing index.
* [Named entity extraction tuning](../../server-mode/indexing/tuning.md#named-entity-extraction)
* [What are NLP pipelines?](../../usage/faq/definitions/what-are-nlp-pipelines.md)

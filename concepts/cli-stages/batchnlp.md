---
description: >-
  BATCHNLP exists in the stage list but is not runnable from the command line.
---

# BATCHNLP

BATCHNLP is the name of the batched named entity recognition work, but **it has no command-line implementation**. Passing it to `--stages` does nothing except log:

```
no task class for stage BATCHNLP, skipping it
```

The command continues with the other stages you listed, so this fails quietly rather than loudly. If you expected entities and got none, this is one of the things to check.

## What runs the batch work instead

The batches are created by [CREATENLPBATCHESFROMIDX](createnlpbatchesfromidx.md), which submits one `batch-ner` **task** per batch to the task manager. Those tasks are executed by task workers:

```bash
# create the batches
datashare stage run --stages CREATENLPBATCHESFROMIDX \
  --defaultProject my-project --nlpPipeline SPACY \
  --elasticsearchAddress http://elasticsearch:9200 \
  --queueType REDIS --redisAddress redis://redis:6379

# execute them
datashare worker run --busType REDIS --redisAddress redis://redis:6379
```

Each task receives its batch of document ids, the pipeline to run and the maximum text length, initialises the model once for the batch's language, and writes the entities it finds to Elasticsearch. For the `SPACY` pipeline, the Python NLP worker consumes these tasks instead of the Java worker.

## Why the stage name still exists

The stage list is a shared vocabulary between the Java backend and the workers that plug into it, including workers written in other languages. `BATCHNLP` names the step those workers implement; it is not something the Java CLI dispatches itself.

## See also

* [CREATENLPBATCHESFROMIDX](createnlpbatchesfromidx.md), the stage that creates the batches.
* [NLP](nlp.md), the non-batched stage used by CoreNLP and OpenNLP.

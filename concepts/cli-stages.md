---
description: When running Datashare from the command-line, you can pick which "stage" to apply to analyse your documents.
---

# CLI stages

The CLI stages are primarly intented to be run for an instance of Datashare that uses non-embedded resources (ElasticSearch, database, key/value memory store). This allows you to distribute heaving tasks between servers.

## 1. SCAN

This is the first step to add documents to Datashare from the command-line. The SCAN stage allows you to queue all the files that need to be indexed (next step). Once this task is done, you can move to the next step. This stage cannot be distributed.

```bash
datashare --mode CLI \  
  # Select the SCAN stage
  --stage SCAN \
  # Where the document are located
  --dataDir /path/to/documents \
  # Store the queued files in Redis
  --dataBusType REDIS \
  # URI of Redis 
  --redisAddress redis://redis:6379
```

## 2. INDEX

The INDEX stage is probably the most important (and heavy!) one. It pulls documents to index from the queue create in the previous step, then use a combination of [Apache Tika](https://tika.apache.org) and [Tesseract](https://tesseract-ocr.github.io/) to extract text, metadata and OCR images. The result documents are stored in ElasticSearch. The queue used to store documents to index is a "blocking list", meaning that only one client can pull a concurent value at the time. This allows users to distribute this command on serveral servers.

```bash
datashare --mode CLI \
  # Select the INDEX stage
  --stage INDEX \
  # Where the document are located
  --dataDir /path/to/documents \
  # Store the queued files in Redis
  --dataBusType REDIS \
  # URI of Elasticsearch
  --elasticsearchAddress http://elasticsearch:9200 \
  # Enable OCR \
  --ocr true
  # URI of Redis 
  --redisAddress redis://redis:6379
```
## 3. NLP

Once a document is available for search (stored in ElasticSearch), you can use the NLP stage to extract named entities from the text. This process will not only create named entities mentions in ElasticSearch, it will mark every analyzed document with the corresponding NLP pipeline (CORENLP by default). In other words, the process is idempotent and can be paralelized as well on several servers.

```bash
datashare --mode CLI \
  # Select the NLP stage
  --stage NLP \
  # Use CORENLP to detect named entities
  --nlpp CORENLP \
  # URI of Elasticsearch
  --elasticsearchAddress http://elasticsearch:9200 
```


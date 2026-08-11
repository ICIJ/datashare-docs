---
description: >-
  A short summary of what makes Datashare fast or slow, and where the detailed
  guidance lives.
---

# Performance considerations

Extracting text from arbitrary file formats and running OCR over images is expensive work. Datashare uses [Apache Tika](https://tika.apache.org/) and [Tesseract OCR](https://tesseract-ocr.github.io/) to do it as efficiently as it can, but on a large corpus the settings you choose matter more than the machine you rent.

The detailed guidance now lives in [Tuning and performance](indexing/tuning.md). In short:

* **Match threads to cores.** Set `--parallelism` to the number of cores and make sure `OMP_THREAD_LIMIT=1` reaches Tesseract. Getting this wrong is routinely a 30x slowdown. [Read more](indexing/tuning.md#the-single-most-important-setting).
* **Decide about OCR.** It is on by default and it dominates the cost. Turn it off for born-digital corpora, and install the right Tesseract language packs when you keep it on. [Read more](indexing/tuning.md#ocr).
* **Split the stages and distribute INDEX.** With a shared Redis queue and a shared Elasticsearch, adding machines adds throughput almost linearly. [Read more](indexing/scenarios.md#scenario-5-distribute-indexing-across-several-machines).
* **Give Elasticsearch its own machine.** It becomes the bottleneck before your indexing workers do. [Read more](indexing/tuning.md#elasticsearch).
* **Size the heap deliberately** with `DS_JAVA_OPTS` and `ES_JAVA_OPTS`. [Read more](indexing/tuning.md#memory).
* **Treat mail archives as a special case.** One mailbox file is one queue entry, so a corpus of a few very large mailboxes leaves a big machine underused. [Read more](indexing/tuning.md#mail-heavy-corpora).
* **Tell Datashare the language** when your corpus is monolingual, with `--language` and `--ocrLanguage`. [Read more](indexing/tuning.md#language).

---
description: >-
  This page explains how to setup ASR (Automatic Speech Recognition), install
  the ASR plugin and transcribe audio and video documents on your computer.
---

# Transcribe audio and video

{% hint style="info" %}
The ASR plugin lets you **automatically transcribe audio and video documents into text** using speech recognition models. All the processing is done within Datashare — no data is sent to third parties.
{% endhint %}

## How it works

The ASR feature relies on three components working together:

* The **ASR plugin** (`datashare-plugin-asr`) — a frontend plugin that adds the transcription interface to Datashare (language selector, model selector, transcription pages)
* The **ASR extension** (`datashare-extension-asr`) — a backend Java extension that exposes the ASR API and submits transcription workflows to Temporal
* The **ASR workers** (`datashare-python`) — Python processes that perform the actual speech recognition (audio preprocessing, model inference, result indexing)

All three must be installed and running for transcription to work.

## Prerequisites

### Datashare version

We recommend using a **recent release** of Datashare (`>= 21.0.0`) to use this feature.

### Temporal

The ASR workers use [Temporal](https://temporal.io/) for task orchestration. A Temporal server must be running and accessible from both Datashare and the ASR workers. Start Datashare with:

```
--batchQueueType TEMPORAL --messageBusAddress temporal:7233
```

### Index your documents

Before transcribing, make sure your audio and video files have been [added to Datashare](../install-datashare-on-mac/add-documents-to-datashare-on-mac.md) and indexed.

### Supported formats

The ASR plugin supports the following audio and video formats:

| Audio | Video |
|-------|-------|
| AAC | MP4 |
| AIFF | MPEG |
| MP4 (audio) | MOV |
| MPEG (audio) | |
| OGG | |
| WAV | |

## Next steps

1. [Install the ASR plugin](install-asr-plugin.md)
2. [Transcribe documents](transcribe-documents.md)

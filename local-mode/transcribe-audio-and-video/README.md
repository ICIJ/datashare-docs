---
description: >-
  This page explains how to set up ASR, install the ASR plugin, and transcribe
  audio and video documents on your computer.
---

# Transcribe audio and video

{% hint style="info" %}
The ASR plugin automatically transcribes audio and video documents into text using speech recognition models. Processing stays within Datashare. No data is sent to third parties.
{% endhint %}

## How it works

The ASR feature relies on three components:

* The **ASR plugin** (`datashare-plugin-asr`) adds the transcription interface, including language and model selectors.
* The **ASR extension** (`datashare-extension-asr`) exposes the ASR API and submits transcription workflows to Temporal.
* The **ASR workers** (`datashare-python`) preprocess audio, run model inference, and index results.

All three components must be installed and running.

## Prerequisites

### Datashare version

Use Datashare version `21.0.0` or later.

### Temporal

The ASR workers use [Temporal](https://temporal.io/) for task orchestration. Run a Temporal server that Datashare and every worker can reach. Start Datashare with:

```
--batchQueueType TEMPORAL --messageBusAddress temporal:7233 --taskRoutingStrategy GROUP
```

### Index your documents

Before transcribing, add your audio and video files through the **Documents** task. Wait until indexing finishes.

### Supported formats

The ASR plugin supports the following audio and video formats:

| Audio        | Video |
| ------------ | ----- |
| AAC          | MP4   |
| AIFF         | MPEG  |
| MP4 (audio)  | MOV   |
| MPEG (audio) |       |
| OGG          |       |
| WAV          |       |

{% include "../../.gitbook/includes/asr-next-steps.md" %}

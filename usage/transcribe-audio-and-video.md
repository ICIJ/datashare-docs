---
description: This page explains how to transcribe audio and video documents and explore transcription results in Datashare.
---

# Transcribe audio and video

## Prerequisites

We recommend **using a recent release of Datashare (>= 21.0.0)** to use this feature.

The ASR feature requires three components: the **plugin** (frontend UI), the **extension** (backend API) and the **workers** (Python speech recognition), all connected through a **Temporal** server.

Before transcribing, make sure everything is installed:

* When using Datashare [on your computer](../local-mode/transcribe-audio-video/)
* When Datashare is running [on your server](../server-mode/transcribe-audio-video/)

## Start a transcription

### Transcribe a single document

1. Open an audio or video document in Datashare.
2. Below the media player, click the **Transcribe** panel.
3. Select the **language** spoken in the document.
4. Select a **model** (see [available models](transcribe-audio-and-video.md#available-models) below).
5. Click **Transcribe**.

### Transcribe multiple documents

1. In the sidebar, click **Transcriptions** then **New transcription**.
2. Select the documents to transcribe using the project selector, search bar, and filters.
3. Choose the language and model.
4. Review the selection summary and click **Transcribe**.

{% hint style="warning" %}
All documents in a batch transcription must be in the **same language**. Create separate tasks for each language if needed.
{% endhint %}

## Available models

| Model | Languages | Best for |
|-------|-----------|----------|
| **Parakeet** | 25+ languages (EN, FR, DE, ES, IT, PT, etc.) | General-purpose multilingual transcription |
| **Parakeet TRT** | Same as Parakeet | Faster inference on NVIDIA GPUs with TensorRT |
| **FireRedASR2** | Chinese (ZH) | Chinese language transcription |

The model selector automatically disables models that don't support the selected language.

## View transcription results

### Transcriptions page

In the sidebar, click **Transcriptions** to see all transcription tasks with their state, progress, language, model, and launch date.

Click on a task to see its details. For batch transcriptions, you can see the status of each individual document.

### Inside a document

Once a document has been transcribed, open it in Datashare. The transcription appears below the media player. You can:

* **Read** the transcription alongside the audio/video
* **Download** the transcription as a text file
* **Download with timestamps** for a timestamped version
* **Transcribe again** with a different model or language

## Supported formats

| Audio | Video |
|-------|-------|
| AAC | MP4 |
| AIFF | MPEG |
| MP4 (audio) | MOV |
| MPEG (audio) | |
| OGG | |
| WAV | |

Documents with unsupported content types are automatically skipped during batch transcription.

## Troubleshooting

### Transcriptions menu doesn't appear

The **plugin** is not loaded. Check that the plugin is installed in the `--pluginsDir` directory and restart Datashare.

### Empty language or model dropdowns

The **extension** is not loaded. Check that the extension JAR is in the `--extensionsDir` directory and restart Datashare.

### Transcription stuck or failing

The **workers** may not be running. Make sure all three ASR workers (IO, CPU, and inference) are running and connected to the same Temporal server as Datashare. Check the worker logs for error details.

### "Unknown language" errors

If documents have an unknown or undetected language, update their language metadata in Elasticsearch before transcribing, or select the correct language manually when creating the transcription task.

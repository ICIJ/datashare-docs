---
description: >-
  This page describes how to transcribe audio and video documents and view
  transcription results in Datashare.
---

# Transcribe documents

## Transcribe a single document

1. Open an audio or video document in Datashare.
2. Below the media player, you will see a **Transcribe** panel.
3. Select the **language** spoken in the document.
4. Select a **model**:
   * **Parakeet** — Nvidia's general-purpose multilingual speech recognition model
   * **Parakeet TRT** — TensorRT-optimized version of Parakeet, faster inference on compatible GPUs
   * **FireRedASR2** — Xiaomi's model, specialized for Chinese language transcription
5. Click **Transcribe**.

The transcription task will be launched. You can monitor its progress on the [Transcriptions page](transcribe-documents.md#view-transcription-results).

## Transcribe multiple documents

1. In the sidebar, click **Transcriptions** then **New transcription**.
2. **Step 1 — Documents**: Select the documents to transcribe using:
   * **Project** selector to choose the project
   * **Search bar** to filter by query
   * **Filters** (path, content type, creation date, language, etc.)
3. **Step 2 — Language**: Select the language spoken in the documents.

{% hint style="warning" %}
All documents in a batch transcription must be in the **same language**. If your documents contain multiple languages, create separate transcription tasks for each language.
{% endhint %}

4. **Step 3 — Model**: Select the speech recognition model to use.
5. Review the **selection summary** showing the number of audio and video documents that will be transcribed.
6. Click **Transcribe**.

### Batch transcribe from search results

You can also transcribe multiple documents directly from the search results:

1. Search for documents and apply filters as needed.
2. Select multiple documents using the checkboxes.
3. Click the **Transcribe** button that appears in the selection toolbar.
4. Choose the language and model, then confirm.

## Available models

| Model | Languages | Description |
|-------|-----------|-------------|
| Parakeet | 25+ languages (EN, FR, DE, ES, IT, PT, etc.) | General-purpose multilingual model. Good balance between speed and accuracy. |
| Parakeet TRT | Same as Parakeet | TensorRT-optimized version. Faster on compatible NVIDIA GPUs. |
| FireRedASR2 | Chinese (ZH) | Specialized for Chinese language transcription. |

{% hint style="info" %}
The model selector automatically disables models that don't support the selected language. For example, FireRedASR2 is only available when Chinese is selected.
{% endhint %}

## View transcription results

### Transcriptions page

In the sidebar, click **Transcriptions** to access the list of all transcription tasks. Each task shows:

* **State** — Running, success, or failure
* **Name** — Document name or batch timestamp
* **Progress** — Completion percentage
* **Language** and **Model** used
* **Project**, **User**, and **Launch date**

Click on a task to see its details, including individual document statuses for batch transcriptions.

### Document viewer

Once a document has been transcribed, open it in Datashare. The transcription text will appear below the media player. You can:

* **Read** the transcription alongside the audio/video
* **Download** the transcription as a text file
* **Download with timestamps** for a timestamped version
* **Transcribe again** with a different model or language

## Unsupported formats

Documents whose content type is not audio or video (such as PDFs, images, or text files) will not be transcribed. When creating a batch transcription, the selection summary will display a warning indicating how many documents will be skipped due to unsupported formats.

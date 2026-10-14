---
description: >-
  This page describes how to transcribe audio and video documents and view
  transcription results in Datashare.
---

# Transcribe documents

## Transcribe documents

### Transcribe a single document

1. Open an audio or video document in Datashare. Below the media player, click the **Transcribe** button.

<figure><img src="../../.gitbook/assets/asr-doc-transcribe-button.png" alt=""><figcaption><p>The Transcribe button appears below the media player</p></figcaption></figure>

2. Select the **language** spoken in the document and a **model**.

<figure><img src="../../.gitbook/assets/asr-doc-transcribe-panel.png" alt=""><figcaption><p>Select the language and model, then click Transcribe</p></figcaption></figure>

3. Click **Transcribe**. Once complete, the transcription appears below the media player with timestamps.

<figure><img src="../../.gitbook/assets/asr-doc-transcription-result.png" alt=""><figcaption><p>The transcription result with timestamps</p></figcaption></figure>

You can **download** the transcription as a text file, **download with timestamps**, or **transcribe again** with a different model or language.

### Transcribe from search results

You can transcribe several documents at once directly from the search results:

1. Search for documents and select them using the checkboxes.
2. Click the **three dots** menu in the selection toolbar and choose **Transcribe**.

<figure><img src="../../.gitbook/assets/asr-selection-menu.png" alt=""><figcaption><p>Select documents and click Transcribe from the toolbar menu</p></figcaption></figure>

3. Choose the language and model in the dialog, then click **Transcribe**.

<figure><img src="../../.gitbook/assets/asr-selection-modal.png" alt=""><figcaption><p>Choose language and model for the selected documents</p></figcaption></figure>

{% hint style="warning" %}
All documents in a batch transcription must be in the **same language**. If your documents contain multiple languages, create separate transcription tasks for each language.
{% endhint %}

### Transcribe via the form

For more control over document selection, use the transcription form:

1. In the sidebar, click **Transcriptions** then **New transcription**.
2. **Step 1 — Documents**: Select the documents to transcribe using filters (project, path, content type, language, etc.).

<figure><img src="../../.gitbook/assets/asr-form-filters.png" alt=""><figcaption><p>Filter documents by project, path and content type</p></figcaption></figure>

3. **Step 2 — Language**: Select the language spoken in the documents.
4. **Step 3 — Model**: Select the speech recognition model to use.
5. Review the selection summary and click **Transcribe**.

<figure><img src="../../.gitbook/assets/asr-form-language-model.png" alt=""><figcaption><p>Select language, model and review the search summary</p></figcaption></figure>

### Available models

| Model        | Languages                                    | Description                                                                  |
| ------------ | -------------------------------------------- | ---------------------------------------------------------------------------- |
| Parakeet     | 25+ languages (EN, FR, DE, ES, IT, PT, etc.) | General-purpose multilingual model. Good balance between speed and accuracy. |
| Parakeet TRT | Same as Parakeet                             | TensorRT-optimized version. Faster on compatible NVIDIA GPUs.                |
| FireRedASR2  | Chinese (ZH)                                 | Specialized for Chinese language transcription.                              |

{% hint style="info" %}
The model selector automatically disables models that don't support the selected language. For example, FireRedASR2 is only available when Chinese is selected.
{% endhint %}

### View transcription results

#### Transcriptions page

In the sidebar, click **Transcriptions** to access the list of all transcription tasks. Each task shows its state, progress, language, model, project, user and launch date.

<figure><img src="../../.gitbook/assets/asr-transcriptions-list.png" alt=""><figcaption><p>The transcriptions list with all tasks and their status</p></figcaption></figure>

Click on a task to see its details, including individual document statuses for batch transcriptions.

#### Document viewer

Once a document has been transcribed, open it in Datashare. The transcription text will appear below the media player. You can:

* **Read** the transcription alongside the audio/video
* **Download** the transcription as a text file
* **Download with timestamps** for a timestamped version
* **Transcribe again** with a different model or language

### Unsupported formats

Documents whose content type is not audio or video (such as PDFs, images, or text files) will not be transcribed. When creating a batch transcription, the selection summary will display a warning indicating how many documents will be skipped due to unsupported formats.

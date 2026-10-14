---
title: ASR feature overview
---

{% hint style="info" %}
The ASR plugin transcribes audio and video documents into text. Datashare, Temporal, and the ASR workers run on infrastructure you control.
{% endhint %}

## Components

The ASR feature requires three components:

* The **ASR plugin** (`datashare-plugin-asr`) adds the transcription interface.
* The **ASR extension** (`datashare-extension-asr`) exposes the ASR API and starts workflows.
* The **ASR workers** (`datashare-python`) process audio and index results.

All three components must be installed and running.

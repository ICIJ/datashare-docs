# Install ASR plugin

The ASR transcription feature requires three components: the **plugin** (frontend), the **extension** (backend) and the **workers** (Python). See the [overview](README.md#how-it-works) for details.

## 1. Install the plugin and extension

Install the ASR plugin and extension following [these instructions](../plugins-and-extensions.md).

* The **plugin** (`datashare-plugin-asr`) adds the transcription interface (language/model selectors, transcription pages).
* The **extension** (`datashare-extension-asr`) exposes the `/api/asr` endpoints and submits transcription workflows to Temporal.

Both are installed automatically when installing the ASR plugin from Datashare.

{% hint style="warning" %}
Make sure the extension JAR is loaded by Datashare. If the language and model dropdowns are empty, the extension is not loaded — check the `--extensionsDir` directory and restart Datashare.
{% endhint %}

Datashare must be started with Temporal as the batch queue backend so it can submit transcription workflows to the workers:

```
--batchQueueType TEMPORAL --messageBusAddress temporal:7233
```

Replace `temporal:7233` with the address of your Temporal server if it differs.

## 2. Install and start the ASR workers

The ASR workers are Python processes from `datashare-python` that perform the actual speech recognition. They connect to the same [Temporal](https://temporal.io/) server as Datashare.

Three workers are needed, each handling a different part of the transcription pipeline:

| Worker | Queue | Role |
|--------|-------|------|
| **IO worker** | `asr.io` | Searches documents in Elasticsearch and indexes results |
| **CPU worker** | `asr.cpu` | Preprocesses and postprocesses audio files |
| **Inference worker** | `asr.inference.cpu` | Runs the speech recognition model |

### Run locally (development)

#### Install dependencies

```bash
cd datashare-python/workers/asr-worker
uv sync --extra cpu --extra preprocessing --extra inference
```

| Extra | What it installs | Required for |
|-------|-----------------|--------------|
| `cpu` | PyTorch CPU build | All workers |
| `preprocessing` | caul | CPU worker |
| `inference` | caul + NeMo + model backends | Inference worker |

#### Start the workers

Run each worker in a separate terminal:

**IO worker:**

```bash
uv run datashare-python worker start \
  --dependencies asr.io \
  --queue asr.io \
  --activity asr.transcription.config \
  --activity asr.transcription.search-audios \
  --activity asr.transcription.index \
  --activity asr.transcription.aggregate-results
```

**CPU worker:**

```bash
uv run datashare-python worker start \
  --dependencies asr.cpu \
  --queue asr.cpu \
  --activity asr.transcription.preprocess \
  --activity asr.transcription.postprocess
```

**Inference worker:**

```bash
uv run datashare-python worker start \
  --dependencies asr.inference \
  --queue asr.inference.cpu \
  --activity asr.transcription.infer
```

### Run with Docker

You can also build and run the workers as Docker containers from `datashare-python/workers/asr-worker`.

The Dockerfile defines three build targets:

```bash
# IO worker
docker build --target io-worker -t asr-io-worker .
docker run --network datashare-network asr-io-worker

# CPU worker
docker build --target cpu-worker -t asr-cpu-worker .
docker run --network datashare-network asr-cpu-worker

# Inference worker (GPU)
docker build --target inference-gpu-worker -t asr-inference-worker .
docker run --gpus all --network datashare-network asr-inference-worker
```

{% hint style="info" %}
The Docker images include their own entrypoints that start the correct worker with the right activities and queue. The inference Docker target uses the `gpu` extra and the `asr.inference.gpu` queue by default.
{% endhint %}

Make sure the containers are on the same Docker network as Temporal and Elasticsearch (e.g. `datashare-network`).

## 3. Verify the installation

1. Start Datashare and open it in your browser.
2. Open the sidebar menu — you should see a **Transcriptions** entry.
3. Click **Transcriptions** > **New transcription** and verify that the language and model dropdowns are populated.

{% hint style="info" %}
If the **Transcriptions** menu doesn't appear, the **plugin** is not loaded. If the dropdowns are empty, the **extension** is not loaded. If transcriptions fail or stay stuck, check that the **workers** are running and connected to Temporal.
{% endhint %}

You can now [transcribe documents](transcribe-documents.md).

# Install ASR plugin

The ASR transcription feature requires the **plugin**, **extension**, and **workers**. See [.](./ "mention") for an overview.

### 1. Install the plugin and extension

Install the ASR plugin and extension following [plugins-and-extensions.md](../plugins-and-extensions.md "mention").

* The **plugin** (`datashare-plugin-asr`) adds the transcription interface (language/model selectors, transcription pages).
* The **extension** (`datashare-extension-asr`) exposes the `/api/asr` endpoints and submits transcription workflows to Temporal.

Both are installed automatically when installing the ASR plugin from Datashare.

{% hint style="warning" %}
Make sure the extension JAR is loaded by Datashare. If the language and model dropdowns are empty, the extension is not loaded — check the `--extensionsDir` directory and restart Datashare.
{% endhint %}

A running [Temporal](https://temporal.io/) server is **required**. The ASR workers rely on Temporal for workflow orchestration and cannot work with Redis or AMQP.

Datashare must be started with the following options to enable ASR:

```
--batchQueueType TEMPORAL --messageBusAddress temporal:7233 --taskRoutingStrategy GROUP
```

| Option                              | Description                                                                  |
| ----------------------------------- | ---------------------------------------------------------------------------- |
| `--batchQueueType TEMPORAL`         | Use Temporal as the task backend                                             |
| `--messageBusAddress temporal:7233` | Address of the Temporal server                                               |
| `--taskRoutingStrategy GROUP`       | Route ASR workflows to the `python` queue where the workflows worker listens |

Replace `temporal:7233` with the address of your Temporal server if it differs.

{% hint style="info" %}
The `--taskRoutingStrategy` option controls how Datashare assigns Temporal queues to tasks. Two strategies work with ASR:

* **`GROUP`** (recommended): routes all Python tasks to a single `python` queue. One workflows worker handles them.
* **`NAME`**: gives each task type its own queue, such as `asr.transcription`. This supports finer-grained scaling but needs one workflows worker per task type.

Start workers with a `--queue` value matching your chosen strategy. The examples below use `GROUP`.
{% endhint %}

### 2. Install and start the ASR workers

The ASR workers are Python processes from `datashare-python` that perform the actual speech recognition. They connect to the same [Temporal](https://temporal.io/) server as Datashare.

Four workers are needed:

| Worker               | Queue                                      | Role                                                    |
| -------------------- | ------------------------------------------ | ------------------------------------------------------- |
| **Workflows worker** | `python`                                   | Orchestrates the transcription workflow                 |
| **IO worker**        | `asr.io`                                   | Searches documents in Elasticsearch and indexes results |
| **CPU worker**       | `asr.cpu`                                  | Preprocesses and postprocesses audio files              |
| **Inference worker** | `asr.inference.cpu` or `asr.inference.gpu` | Runs the speech recognition model                       |

#### Run locally

**Install the workers**

The ASR workers require **Python 3.12** and [uv](https://docs.astral.sh/uv/).

```bash
uv tool install "datashare-asr-worker[cpu,preprocessing]" \
  --with "caul[nemo,parakeet-trt]" \
  --with-executables-from datashare-python \
  --python 3.12
```

For NVIDIA GPU inference, install the GPU build instead:

```bash
uv tool install "datashare-asr-worker[gpu,preprocessing]" \
  --with "caul[nemo,parakeet-trt]" \
  --with-executables-from datashare-python \
  --python 3.12
```

This installs `datashare-python` to start workers and `asr-worker` to list models.

| Extra or dependency       | What it installs        | Required for                   |
| ------------------------- | ----------------------- | ------------------------------ |
| `cpu`                     | PyTorch CPU build       | All workers without a GPU      |
| `gpu`                     | PyTorch CUDA build      | All workers with an NVIDIA GPU |
| `preprocessing`           | caul                    | CPU worker                     |
| `caul[nemo,parakeet-trt]` | NeMo and model backends | Inference worker               |

{% hint style="warning" %}
The `cpu` and `gpu` extras are **mutually exclusive**. Do not install both.
{% endhint %}

**Configure the environment**

The workers need to connect to the same Temporal server and Elasticsearch instance as Datashare. Set the following environment variables before starting the workers:

```bash
export DS_WORKER_TEMPORAL__HOST=<temporal-address>
export DS_WORKER_TEMPORAL__NAMESPACE=<temporal-namespace>
export DS_WORKER_ELASTICSEARCH__ADDRESS=<elasticsearch-address>
export DS_WORKER_PATHS__FILESYSTEM=/
export DS_WORKER_PATHS__ARTIFACTS=<path-to-datashare-artifacts>
export DS_WORKER_PATHS__WORKDIR=<path-to-workdir>
```

Replace the placeholder values with your own configuration. The Temporal and artifacts values **must match** your Datashare launch parameters.

| Variable                           | Must match            | Description                                      |
| ---------------------------------- | --------------------- | ------------------------------------------------ |
| `DS_WORKER_TEMPORAL__HOST`         | `--messageBusAddress` | Temporal server address                          |
| `DS_WORKER_TEMPORAL__NAMESPACE`    | —                     | Temporal namespace. Default: `datashare-default` |
| `DS_WORKER_ELASTICSEARCH__ADDRESS` | —                     | Elasticsearch address used by Datashare          |
| `DS_WORKER_PATHS__FILESYSTEM`      | —                     | Root path to access indexed documents            |
| `DS_WORKER_PATHS__ARTIFACTS`       | `--artifactDir`       | Shared artifacts directory with Datashare        |
| `DS_WORKER_PATHS__WORKDIR`         | —                     | Temporary working directory for the workers      |

{% hint style="info" %}
If you use GPU inference, also set `DS_WORKER_DEVICES__INFERENCE=cuda`. This sends inference tasks to the GPU queue. The default is `cpu`.
{% endhint %}

**Start the workers**

Run each worker in a separate terminal:

1. **Workflows worker:**

```bash
datashare-python worker start \
  --skip-config-discovery \
  --queue python \
  --workflow asr.transcription
```

2. **IO worker:**

```bash
datashare-python worker start \
  --dependencies asr.io \
  --queue asr.io \
  --activity asr.transcription.config \
  --activity asr.transcription.search-audios \
  --activity asr.transcription.index \
  --activity asr.transcription.aggregate-results
```

3. **CPU worker:**

```bash
datashare-python worker start \
  --dependencies asr.cpu \
  --queue asr.cpu \
  --activity asr.transcription.preprocess \
  --activity asr.transcription.postprocess
```

4. **Inference worker (CPU):**

```bash
datashare-python worker start \
  --dependencies asr.inference \
  --queue asr.inference.cpu \
  --activity asr.transcription.infer
```

5. **Inference worker (GPU):**

```bash
datashare-python worker start \
  --dependencies asr.inference \
  --queue asr.inference.gpu \
  --activity asr.transcription.infer
```

#### Run with Docker

Pre-built Docker images are available on [Docker Hub](https://hub.docker.com/u/icij). Each worker needs volume mounts to access documents and share data with Datashare.

All containers below use `--network host` for simplicity. They access Temporal, Elasticsearch, and Datashare on `localhost`. Adapt the network and addresses for other hosts or Docker networks.

{% hint style="warning" %}
The workflows worker image listens on a hardcoded queue that does not match `--taskRoutingStrategy GROUP`. Override its entrypoint as shown below.
{% endhint %}

```bash
# Workflows worker (entrypoint override required)
docker run -d --network host \
  -e DS_WORKER_TEMPORAL__HOST=<temporal-address> \
  -e DS_WORKER_DATASHARE__URL=<datashare-url> \
  -e DS_WORKER_ELASTICSEARCH__ADDRESS=<elasticsearch-address> \
  -e DS_WORKER_PATHS__FILESYSTEM=/host_fs \
  -e DS_WORKER_PATHS__ARTIFACTS=/artifacts \
  -e DS_WORKER_PATHS__WORKDIR=/workdir \
  -v <datashare-artifacts-dir>:/artifacts \
  -v <workdir>:/workdir \
  -v <datashare-data-dir>:/host_fs<datashare-data-dir>:ro \
  --entrypoint "" \
  icij/datashare-workflows-worker:0.15.13 \
  uv run --no-sync datashare-python worker start \
    --skip-config-discovery \
    --queue python \
    --workflow asr.transcription

# IO worker
docker run -d --network host \
  -e DS_WORKER_TEMPORAL__HOST=<temporal-address> \
  -e DS_WORKER_DATASHARE__URL=<datashare-url> \
  -e DS_WORKER_ELASTICSEARCH__ADDRESS=<elasticsearch-address> \
  -e DS_WORKER_PATHS__FILESYSTEM=/host_fs \
  -e DS_WORKER_PATHS__ARTIFACTS=/artifacts \
  -e DS_WORKER_PATHS__WORKDIR=/workdir \
  -v <datashare-artifacts-dir>:/artifacts \
  -v <workdir>:/workdir \
  -v <datashare-data-dir>:/host_fs<datashare-data-dir>:ro \
  icij/datashare-asr-transcription-io-worker:0.12.8

# CPU worker
docker run -d --network host \
  -e DS_WORKER_TEMPORAL__HOST=<temporal-address> \
  -e DS_WORKER_DATASHARE__URL=<datashare-url> \
  -e DS_WORKER_ELASTICSEARCH__ADDRESS=<elasticsearch-address> \
  -e DS_WORKER_PATHS__FILESYSTEM=/host_fs \
  -e DS_WORKER_PATHS__ARTIFACTS=/artifacts \
  -e DS_WORKER_PATHS__WORKDIR=/workdir \
  -v <datashare-artifacts-dir>:/artifacts \
  -v <workdir>:/workdir \
  -v <datashare-data-dir>:/host_fs<datashare-data-dir>:ro \
  icij/datashare-asr-transcription-cpu-worker:0.12.8

# Inference worker (GPU — requires NVIDIA GPU and nvidia-container-toolkit)
docker run -d --gpus all --network host \
  -e DS_WORKER_TEMPORAL__HOST=<temporal-address> \
  -e DS_WORKER_DATASHARE__URL=<datashare-url> \
  -e DS_WORKER_ELASTICSEARCH__ADDRESS=<elasticsearch-address> \
  -e DS_WORKER_PATHS__FILESYSTEM=/host_fs \
  -e DS_WORKER_PATHS__ARTIFACTS=/artifacts \
  -e DS_WORKER_PATHS__WORKDIR=/workdir \
  -v <datashare-artifacts-dir>:/artifacts \
  -v <workdir>:/workdir \
  -v <datashare-data-dir>:/host_fs<datashare-data-dir>:ro \
  icij/datashare-asr-transcription-inference-gpu-worker:0.12.8
```

| Placeholder                 | Description                                                | Example                    |
| --------------------------- | ---------------------------------------------------------- | -------------------------- |
| `<temporal-address>`        | Temporal server address. Must match `--messageBusAddress`. | `localhost:7233`           |
| `<datashare-url>`           | Datashare API URL                                          | `http://localhost:8080`    |
| `<elasticsearch-address>`   | Elasticsearch URL                                          | `http://localhost:9200`    |
| `<datashare-artifacts-dir>` | Shared artifacts directory. Must match `--artifactDir`.    | `/srv/datashare/artifacts` |
| `<workdir>`                 | Temporary working directory for workers                    | `/srv/datashare/workdir`   |
| `<datashare-data-dir>`      | Directory containing indexed documents                     | `/home/user/Datashare`     |

{% hint style="info" %}
When using GPU inference, pass `-e DS_WORKER_DEVICES__INFERENCE=cuda` to the **IO worker** container. This sends inference tasks to the GPU queue.
{% endhint %}

{% hint style="info" %}
The data directory mounts read-only at `/host_fs<datashare-data-dir>` inside each container. This path must match the indexed-document location in Datashare. For example, workers access documents in `/home/user/Datashare/Data` at `/host_fs/home/user/Datashare/Data`.
{% endhint %}

### 3. Verify the installation

1. Start Datashare and open it in your browser.
2. Open the sidebar menu — you should see a **Transcriptions** entry.
3. Click **Transcriptions** > **New transcription** and verify that the language and model dropdowns are populated.

{% hint style="info" %}
If the **Transcriptions** menu doesn't appear, the **plugin** is not loaded. If the dropdowns are empty, the **extension** is not loaded. If transcriptions fail or stay stuck, check that the **workers** are running and connected to Temporal.
{% endhint %}

You can now [transcribe-documents.md](transcribe-documents.md "mention").

---
description: Datashare runs using different modes with their own features.
---

# Running modes

| Mode          | Category | Description                                                                                                                      |
| ------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `LOCAL`       | Web      | To run Datashare on a single computer for a single user.                                                                         |
| `SERVER`      | Web      | To run Datashare on a server for multiple users.                                                                                 |
| `CLI`         | CLI      | To index documents and analyze them directly [in the command-line](../server-mode/add-documents-from-the-cli.md).                |
| `TASK_RUNNER` | Daemon   | To execute async tasks ([batch searches](../usage/batch-search-documents.md), batch downloads, scan, index, NER extraction, ...) |

## Web modes

There are two modes:

In **local mode** and **embedded mode**, Datashare provides a self-contained software application that users can install and run on their own local machines. The software allows users to search into their documents within their own local environments, without relying on external servers or cloud infrastructure. This mode offers enhanced data privacy and control, as the datasets and analysis remain entirely within the user's own infrastructure.

In **server mode**, Datashare operates as a centralized server-based system. Users can access to the platform through a web interface, and the documents are stored and processed on Datashare's servers. This mode offers the advantage of easy accessibility from anywhere with an internet connection, as users can log in to the platform remotely. It also facilitate seamless collaboration among users, as all the documents and analysis are centralized.

### Comparaison between modes

The running modes offer advantages and limitations. This matrix summarizes the differences:

|                 | `local` | `server` |
| --------------- | ------- | -------- |
| Multi-users     | ❌       | ✅        |
| Multi-projects  | ✅       | ✅        |
| Access-control  | ❌       | ✅        |
| Indexing UI     | ✅       | ❌        |
| Plugins UI      | ✅       | ❌        |
| Extension UI    | ✅       | ❌        |
| HTTP API        | ✅       | ✅        |
| API Key         | ✅       | ✅        |
| Single JVM      | ✅       | ❌        |
| Tasks execution | ✅       | ❌        |

_When running Datashare in local mode, users can choose to use embedded services (like ElasticSearch, SQLITE, in-memory key/value store) on the same JVM than Datashare. This variant of the local mode is called "embedded mode" and allows user to run Datashare without having to setup any additional software. The embedded mode is used by default._

## CLI mode

In **cli mode**, Datashare starts without a web server and allows user to perform tasks over their documents. This mode can be used in conjunction with both local and server modes, while allowing users to distribute heavy tasks between several servers.

If you want to learn more about which tasks you can execute in this mode, checkout the [stages documentation](cli-stages.md).

## Daemon modes

Those modes are intended to be used for action that requires to "wait" for pendings tasks.

In **batch download mode**, the daemon waits for a user to request a batch download of documents. When a request is received, the daemon starts a task to download the document matching the user search, and bundle them into a zip file.

In **batch search mode**, the daemon waits for a user to request a batch search of documents. To create a batch search, users must go through the dedicated form on Datashare where they can upload a list of search terms (in CSV format). The daemon will then start a task to search all matching documents and store every occurrences in the database.

## How to change modes

Datashare is shipped as a single executable, with all modes available. As previously mentioned, the default mode is the embedded mode. Yet when starting Datashare in command line, you can explicitly specify the running mode. For instance on Ubuntu/Debian:

```sh
datashare \
  # Switch to SERVER mode
  --mode SERVER \
  # Dummy session filter to creates ephemeral users
  --authFilter org.icij.datashare.session.YesCookieAuthFilter \
  # Name of the default project for every user
  --defaultProject local-datashare \
  # URI of Elasticsearch
  --elasticsearchAddress http://elasticsearch:9200 \
  # URI of Redis 
  --redisAddress redis://redis:6379 \
  # store user sessions in Redis.
  --sessionStoreType REDIS
```

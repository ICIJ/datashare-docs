---
description: Datashare runs using two different mode with their own specifities.
---

# Running modes

In **local mode**, Datashare provides a self-contained software application that users can install and run on their own local machines. The software allows users to search into their documents within their own local environments, without relying on external servers or cloud infrastructure. This mode offers enhanced data privacy and control, as the datasets and analysis remain entirely within the user's own infrastructure.

In **server mode**, Datashare operates as a centralized server-based system. Users can access to the platform through a web interface, and the documents are stored and processed on Datashare's servers. This mode offers the advantage of easy accessibility from anywhere with an internet connection, as users can log in to the platform remotely. It also facilitate seamless collaboration among users, as all the documents and analysis are centralized.

In **cli mode**, Datashare starts without a web server and allow user to perform task over their documents. This mode can be used in conjunction both with local and server modes, while allowing users to distribute heaving task between several servers.

## Comparaison between modes

The running modes offer advantages and limitations. This matrix summarizes the differences:

|  | `local` | `server` | `cli`
| --- | --- | --- |
| Multi-users | ❌ | ✅ | ❌ |
| Multi-projects | ❌ | ✅ | ❌ |
| Access-control | ❌ | ✅ | ❌ |
| Indexing UI | ✅ | ❌ | ❌ |
| Plugins UI | ✅ | ❌ | ❌ |
| Extension UI | ✅ | ❌ | ❌ |
| HTTP API | ✅ | ✅ | ❌ |
| API Key | ✅ | ✅ | ❌ |
| Single JVM | ✅ | ❌ | ❌ |
| Tasks execution | ✅ | ❌ | ✅ |

When running Datashare in local mode, users can choose to use embedded services (like ElasticSearch, SQLITE, in-memory key/value store) on the same JVM than Datashare. This variant of the local mode is called "embedded mode" and allows user to run Datashare without having to setup any additional software. The embedded mode is used by default.

## How to switch between running modes

Datashare is shipped as a single executable, with both modes available. As previously mentioned, the default mpode is the embedded mode. Yet when starting Datashare in command line, you can explicitely specify the running mode. For instance on Ubuntu/Debian:

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

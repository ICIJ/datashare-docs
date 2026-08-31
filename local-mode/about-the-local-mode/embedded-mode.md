# Embedded mode

In embedded mode, Datashare bundles all the services it needs (database, search engine, message bus) directly inside the application. You don't need to install or configure these services separately — everything starts automatically when you launch Datashare.

## How it works

Under the hood, Datashare embeds the following services:

| Service | Technology | Notes |
|---|---|---|
| Message bus | [Qpid](https://qpid.apache.org/) | Runs inside Datashare |
| Task queues | Java memory queues | Runs inside Datashare |
| Database | SQLite | Can be stored in memory or in a file |
| Search engine | Elasticsearch | Runs as a **separate process** (see below) |

### About Elasticsearch

Since Elasticsearch 8, it can no longer run inside Datashare directly. Starting from **Datashare 21**, Elasticsearch is launched as a separate process alongside Datashare.

This means two Java processes run on your machine: one for Datashare, one for Elasticsearch. You may need to adjust how much memory each process is allowed to use, depending on the size of your documents and the resources available on your machine.

To do so, use the following environment variables:

| Variable | Controls |
|---|---|
| `DS_JAVA_OPTS` | Memory allocated to Datashare |
| `ES_JAVA_OPTS` | Memory allocated to Elasticsearch |

For example, to give 2 GB to Elasticsearch and 1 GB to Datashare:

```shell
ES_JAVA_OPTS="-Xmx2g" DS_JAVA_OPTS="-Xmx1g" datashare <args>
```

As a rule of thumb, Elasticsearch typically needs more memory than Datashare (about twice as much).

## Where is Elasticsearch installed?

When you first launch Datashare, it automatically downloads and installs Elasticsearch in a platform-specific location:

| Platform | Path |
|---|---|
| Linux | `$HOME/.local/share/datashare/elasticsearch` |
| macOS | `$HOME/Library/Datashare/elasticsearch` |
| Windows | `%APPDATA%\Datashare\elasticsearch` |

On startup, Datashare launches Elasticsearch and waits for it to be ready. During this time, you may see log messages like:

```
INFO IndexWaiterFilter - Ping failed. Waiting for indexer to be up
```

This is normal. Once Elasticsearch is ready, you will see:

```
INFO IndexWaiterFilter - Ping indexer succeeded
```

## Troubleshooting

If Datashare or Elasticsearch fails to start, follow these steps:

1. **Run Elasticsearch on its own.** Go to the installation path listed above and start the `bin/elasticsearch` script manually to check if it runs properly.
2. **Run Datashare without Elasticsearch.** Launch Datashare without the `--elasticsearchPath` option so that it does not try to start Elasticsearch itself.
3. **Run both together.** If steps 1 and 2 succeed, close everything and launch Datashare normally.
4. **Check for Elasticsearch errors.** A common one is `exit 137`, which means Elasticsearch did not have enough memory to start.
5. **Adjust memory settings.** Try different values for `ES_JAVA_OPTS` and `DS_JAVA_OPTS` (see [above](#about-elasticsearch)).

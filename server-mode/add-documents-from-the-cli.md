---
description: >-
  The shortest path from an empty project to searchable documents on a server
  install.
---

# Add documents from the CLI

**This document assumes that you have installed Datashare** [**in server mode within Docker**](install-with-docker.md)**.**

In server [mode](../concepts/running-modes.md), Datashare has no web interface to add documents. Documents are added from the command line.

Here is the shortest command that scans a directory and indexes its files:

```bash
docker compose exec datashare /entrypoint.sh \
  stage run \
  --stages SCAN,INDEX \
  --defaultProject secret-project \
  --elasticsearchAddress http://elasticsearch:9200 \
  --dataDir /home/datashare/Datashare/
```

What is happening:

* Datashare runs the SCAN and INDEX [stages](../concepts/cli-stages/README.md) together, SCAN filling a queue with the files it finds and INDEX draining it.
* Files are read from `/home/datashare/Datashare/`, which is a directory mounted from the host machine, so this is the path **inside the container**.
* Extracted documents are written to the `secret-project` index in Elasticsearch.

Once the command exits, your documents are searchable.

{% hint style="warning" %}
That command is fine for a first try on a small directory. For a real corpus, add at least `--reportName` (so the run can resume) and `--queueType REDIS` (so the queue survives the process), and decide whether you want OCR. All of that is covered in [Indexing](indexing/).
{% endhint %}

## Next steps

* [Indexing](indexing/): the full guide to indexing on a server.
  * [Scenarios](indexing/scenarios.md): incremental updates, resuming, distributing across machines, mail archives.
  * [Options](indexing/options.md): every command-line flag, environment variable and settings key.
  * [Tuning](indexing/tuning.md): parallelism, OCR, memory and Elasticsearch.
  * [Troubleshooting](indexing/troubleshooting.md): what the errors mean.
* [Add entities from the CLI](add-entities-from-the-cli.md): extract people, organizations and locations from documents you have indexed.

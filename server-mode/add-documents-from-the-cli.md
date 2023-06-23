# Add documents from the CLI

**This document assumes you have installed Datashare** [**in server mode within Docker**](install-with-docker.md)**.**

In server [mode](../concepts/running-modes.md), it's important to understand that Datashare does not provide an interface to add documents. As there is no build-in roles and permission in Datashare's data model, we have no way to differenciate user to offer admin additional tools.

This is likelly to be changed in the near future, but in the meantime, you can still add documents to Datashare using the command-line interface.

Here is a simple command to scan a directory and index its files:

```bash
docker compose exec datashare_web /entrypoint.sh \
  --mode CLI \
  --stage SCAN,INDEX \
  --defaultProject secret-project \
  --elasticsearchAddress http://elasticsearch:9200 \
  --dataDir /home/datashare/Datashare/
```

What's happening here:

* Datashare starts in "CLI" [mode](../concepts/running-modes.md)
* We ask to process both SCAN and INDEX [stages](../concepts/cli-stages.md) at the same time
* The SCAN stage feeds a queue in memory with file to add
* The INDEX stage pulls files from the queue to add them to ElasticSearch
* We tell Datashare to use the `elasticsearch` service
* Files to add are located in `/home/datashare/Datashare/` which is a directory mounted from the host machine

Alternativly, you can do this in two separated phases, as long as you tell Datashare to store the queue in a shared resource. Here, we use the redis:

```bash
docker compose exec datashare_web /entrypoint.sh \
  --mode CLI \
  --stage SCAN \
  --queueType REDIS \
  --queueName "datashare:queue" \
  --redisAddress redis://redis:6379 \
  --defaultProject secret-project \
  --elasticsearchAddress http://elasticsearch:9200 \
  --dataDir /home/datashare/Datashare/
```

Once the opperation is done, we can easily check the content of queue created by Datashare in redis. In this example we only display the 20 first files in the `datashare:queue`:

```bash
docker compose exec redis redis-cli lrange datashare:queue 0 20
```

The INDEX [stage](../concepts/cli-stages.md) can now be executed in the same container:

```bash
docker compose exec datashare_web /entrypoint.sh \
  --mode CLI \
  --stage INDEX \
  --queueType REDIS \
  --queueName "datashare:queue" \
  --redisAddress redis://redis:6379 \
  --defaultProject secret-project \
  --elasticsearchAddress http://elasticsearch:9200 \
  --dataDir /home/datashare/Datashare/
```

Once the indexing is done, Datashare will exit gracefully and your document will already be visible on Datashare.

Sometimes you will face the case where you have an existing index and you want to index additional documents inside your working directory without processing every document again. It can be done in two steps :

* Scan the existing ElasticSearch index and gather document paths to store it inside a report queue
* Scan and index (with OCR) the documents in the directory, thanks to the previous report queue, it will skip the paths inside of it

```bash
docker compose exec datashare_web /entrypoint.sh \
  --mode CLI \
  --stage SCANIDX \
  --queueType REDIS \
  --reportName "report:queue" \
  --redisAddress redis://redis:6379 \
  --defaultProject secret-project \
  --elasticsearchAddress http://elasticsearch:9200 \
  --dataDir /home/datashare/Datashare/
```

```bash
docker compose exec datashare_web /entrypoint.sh \
  --mode CLI \
  --stage SCAN,INDEX \
  --ocr true \
  --queueType REDIS \
  --queueName "datashare:queue" \
  --reportName "report:queue" \
  --redisAddress redis://redis:6379 \
  --defaultProject secret-project \
  --elasticsearchAddress http://elasticsearch:9200 \
  --dataDir /home/datashare/Datashare/
```

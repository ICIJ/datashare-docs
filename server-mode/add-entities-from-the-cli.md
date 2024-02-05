# Add entities from the CLI

**This document assumes you have installed Datashare [in server mode within Docker](/server-mode/install-with-docker.md) and already [added documents to Datasharte](/server-mode/add-documents-from-the-cli.md).**

In server [mode](/concepts/running-modes.md), it's important to understand that Datashare does not provide an interface to add documents. As there is no build-in roles and permission in Datashare's data model, 
we have no way to differentiate user to offer admin additional tools.

This is likely to be changed in the near future, but in the meantime, you can extract 
named entities using the command-line interface.

Datashare as the ability to detect email addresses, name of people, organizations and locations.
This process use a Natural Language Processing pipeline called CORENLP. Once your
documents have been indexed in Datashare, you can perform the named entities extraction
in the same fashion as the previous CLI's [stages](/concepts/cli-stages.md):

```bash
docker compose exec datashare_web /entrypoint.sh \
  --mode CLI \
  --stage NLP \
  --defaultProject secret-project \
  --elasticsearchAddress http://elasticsearch:9200 \
  --nlpParallelism 2 \
  --nlpp CORENLP
```

What's happening here:

* Datashare starts in "CLI" [mode](/concepts/running-modes.md)
* We ask to process the NLP [stage](/concepts/cli-stages.md)
* We tell Datashare to use the `elasticsearch` service
* Datashare will pull documents from ElasticSearch directly 
* Up to 2 documents will be analyzed in parallel
* Datashare will use the CORENLP pipeline

Datashare will use the output queue from the previous `INDEX` stage (by default `extract:queue:nlp` in Redis) that contains all the document ids to be analyzed.

The first time you run this command you will have to wait a little bit because
Datashare need to download CORENLP's models which can be big.

You can also use chain the 3 stages altogether: 

```bash
docker compose exec datashare_web /entrypoint.sh \
  --mode CLI \
  --stage SCAN,INDEX,NLP \
  --defaultProject secret-project \
  --elasticsearchAddress http://elasticsearch:9200 \
  --nlpParallelism 2 \
  --nlpp CORENLP \
  --dataDir /home/datashare/Datashare/
```

As for the previous [stages](/concepts/cli-stages.md) you may want to restore the output queue from the `INDEX` stage. You can do:

```bash
docker compose exec datashare_web /entrypoint.sh \
  --mode CLI \
  --stage ENQUEUEIDX,NLP \
  --defaultProject secret-project \
  --elasticsearchAddress http://elasticsearch:9200 \
  --nlpParallelism 2 \
  --nlpp CORENLP
```

The added `ENQUEUEIDX` stage will read Elasticsearch index, find all documents that have not already been analyzed by the CORENLP NER pipeline, and put the ids of those documents into the `extract:queue:nlp` queue.
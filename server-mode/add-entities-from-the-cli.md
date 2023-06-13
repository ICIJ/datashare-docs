# Add entities from the CLI

**This document assumes you have installed Datashare [in server mode within Docker](/server-mode/install-with-docker.md) and already [added documents to Datasharte](/server-mode/add-documents-from-the-cli.md).**

In server [mode](/concepts/running-modes.md), it's important to understand that Datashare does not provide an interface to add documents. As there is no build-in roles and permission in Datashare's data model, 
we have no way to differenciate user to offer admin additional tools.

This is likelly to be changed in the near future, but in the meantime, you can extract 
named entities using the command-line interface.

Datashare as the ability to detect email addresses, name of people, organizations and locations.
This process use an Natural Language Processing pipeline called CORENLP. Once your
documents are available in Datashare, you can perform the named entities extraction
in the same fashion than the previous CLI's [stages](/concepts/cli-stages.md):

```bash
docker compose exec datashare_web /entrypoint.sh \
  --mode CLI \
  --stage NLP \
  --defaultProject secret-project \
  --elasticsearchAddress http://elasticsearch:9200 \
  --nlpParallelism 2 \
  --nlpp CORENLP \
  --resume
```

What's happening here:

* Datashare starts in "CLI" [mode](/concepts/running-modes.md)
* We ask to process the NLP [stage](/concepts/cli-stages.md)
* We tell Datashare to use the `elasticsearch` service
* Datashare will pull documents from ElasticSearch directly 
* Up to 2 documents will be analyzed in parallel
* Datashare will use the CORENLP pipeline

The first time you run this command you will have to wait a little bit because
Datashare need to download CORENLP's models which can be big.
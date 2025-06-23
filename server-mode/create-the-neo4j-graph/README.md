---
description: >-
  This page explains how to setup Neo4j, install the Neo4j plugin and create a
  graph on your server
---

# Neo4j

## Prerequisites

### Get Neo4j up and running

Follow the instructions of the [dedicated FAQ page](../../usage/faq/general/how-to-run-neo4j.md) to get Neo4j up and running.

We recommend using a **recent release** of Datashare (`>= 14.0.0`) to use this feature, click on the '**All platforms and versions'** button when downloading to access versions if necessary.

### Add entities

If it's not done yet add entities to your project [using the Datashare CLI](../add-entities-from-the-cli.md).

**If your project contains email documents, make sure to run the `EMAIL` pipeline** together with regular NLP pipeline. To do so add set the follow `nlpp` flag to `--nlpp CORENLP,EMAIL`.

## Next step

You can now [run Datashare with the Neo4j plugin](run-datashare-with-the-neo4j-plugin.md).

---
description: This page explains how to setup neo4j, install the neo4j plugin and create a graph on your server
---

# Create the neo4j graph

## Prerequisites

### Get neo4j up and running

Follow the instructions of the [dedicated FAQ page](..%2F..%2Fusage%2Ffaq%2Fgeneral%2Fhow-to-run-neo4j.md) to get neo4j up and running.

### Add entities
 
If it's not done yet add entities to your project [using the Datashare CLI](../add-entities-from-the-cli.md).

**If your project contains email documents, make sure to run the `EMAIL` pipeline** together with regular NLP pipeline.
To do so add set the follow `nlpp` flag to `--nlpp CORENLP,EMAIL`. 

## Next step

**You can now [run Datashare with the neo4j plugin](run-datashare-with-the-neo4j-plugin.md) !**
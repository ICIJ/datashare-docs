---
description: >-
  This page describes how to create and maintain your Neo4j graph up to date
  with your server's Datashare projects
---

# Create and update Neo4j graph

## Run the Neo4j extension CLI

The Neo4j related features are added to the DatashareCLI through the extension mechanism. In order to run the extended CLI, the Java `CLASSPATH` must be extended with the path of the `datashare-extension-neo4j` jar. By default, this jar is located in `/home/.local/share/datashare/extensions`, so the CLI will be run as following:

```bash
docker compose exec \
  # if you are not using the default extensions directory  
  # you have to specify it extending the CLASSPATH variable ex:
  # -e CLASSPATH=/home/datashare/extensions/* \ 
  datashare_web /entrypoint.sh \
  --mode CLI \
  --ext neo4j \
  ... 
```

## Create the graph

In order to create the graph, run the `--fullImport` command for your project:

```bash
docker compose exec \
  datashare_web /entrypoint.sh \
  --mode CLI \
  --ext neo4j \
  --full-import \
  --project secret-project
```

The CLI will display the import task progress and log import related information.

## Update the graph

When new documents or entities are added or modified inside Datashare, you will need to update the Neo4j graph to reflect these changes.

To update the graph, you can just re-run the full export:

```bash
docker compose exec \
  datashare_web /entrypoint.sh \
  --mode CLI \
  --ext neo4j \
  --full-import \
  --project secret-project
```

The update will **always add missing nodes and relationships, update existing ones if they were modified, but will never delete graph nodes or relationships**.

To detect whether a graph update is needed, go to the '**Projects'** page and open your project:

<figure><img src="../../.gitbook/assets/Screenshot 2025-06-06 at 11.07.30.png" alt="Screenshot of Datashare&#x27;s All projects page with the name of one project highlighted"><figcaption><p>Open your project</p></figcaption></figure>

Compare the number of documents and entities found in Datashare in '**Projects**' > '**Your project**' > '**Insights**'...

<figure><img src="../../.gitbook/assets/Screenshot 2025-06-06 at 11.08.53.png" alt="Screenshot of Datashare&#x27;s project page on the Insights tab with statistics highlighted"><figcaption><p>Statistics of one project</p></figcaption></figure>

...with the numbers found in your project in the '**Graph' tab**. Run an update in case of mismatch:

<figure><img src="../../.gitbook/assets/Screenshot 2025-06-06 at 11.10.57.png" alt="Screenshot of Datashare&#x27;s project page on the Graph tab with statistics highlighted"><figcaption></figcaption></figure>

The update will **always add missing nodes and relationships, update existing ones if they were modified, but will never delete graph nodes or relationships**.

You can now [explore your graph](../../usage/explore-the-neo4j-graph.md#exploring-your-graph) using your favorite visualization tool.

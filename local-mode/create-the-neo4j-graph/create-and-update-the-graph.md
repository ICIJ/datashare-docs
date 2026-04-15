---
description: >-
  This page describes how to create and maintain your neo4j graph up to date
  with your computer's Datashare projects
---

# Create and update Neo4j graph

## Create the graph

1. Go to '**All projects'** and click on your **project's name**:

<figure><img src="../../.gitbook/assets/local-mode/create-the-neo4j-graph/create-and-update-the-graph/01-all-projects-page-name-one-project.png" alt="Screenshot of Datashare&#x27;s &#x27;All projects&#x27; page with the name of one project highlighted"><figcaption></figcaption></figure>

2. Go to the **Graph tab** and in the first step '**Import**', click on the '**Import'** button:

<figure><img src="../../.gitbook/assets/local-mode/create-the-neo4j-graph/create-and-update-the-graph/02-project-page-graph-tab-import-button.png" alt="Screenshot of Datashare&#x27;s project page on the Graph tab with the &#x27;Import&#x27; button highlighted on the first step of the form"><figcaption></figcaption></figure>

You will then see a **new import task running**.

When the graph creation is complete, '**Graph statistics'** will reflect the number of documents and entities nodes found in the graph:

<figure><img src="../../.gitbook/assets/local-mode/create-the-neo4j-graph/create-and-update-the-graph/03-project-page-graph-tab-graph-statistics.png" alt="Screenshot of Datashare&#x27;s project page on the Graph tab with the Graph statistics highligted"><figcaption></figcaption></figure>

## Update the graph

If new documents or entities are added or modified in Datashare, you will need to update the Neo4j graph to reflect these changes.

Go to '**All projects**' > one **project's page** > the '**Graph**' tab. In the first step, click on the '**Update graph'** button:

<figure><img src="../../.gitbook/assets/local-mode/create-the-neo4j-graph/create-and-update-the-graph/04-project-page-graph-tab-update-button.png" alt="Screenshot of Datashare&#x27;s project page on the Graph tab with &#x27;Update&#x27; button on the first step of the form highlighted"><figcaption></figcaption></figure>

To detect whether a graph update is needed, go to the '**Projects'** page and open your project:

<figure><img src="../../.gitbook/assets/shared/01-all-projects-page-name-one-project.png" alt="Screenshot of Datashare&#x27;s All projects page with the name of one project highlighted"><figcaption><p>Open your project</p></figcaption></figure>

Compare the number of documents and entities found in Datashare in '**Projects**' > '**Your project**' > '**Insights**'...

<figure><img src="../../.gitbook/assets/shared/02-project-page-insights-tab-statistics.png" alt="Screenshot of Datashare&#x27;s project page on the Insights tab with statistics highlighted"><figcaption><p>Statistics of one project</p></figcaption></figure>

...with the numbers found in your project in the '**Graph' tab**. Run an update in case of mismatch:

<figure><img src="../../.gitbook/assets/shared/03-project-page-graph-tab-statistics.png" alt="Screenshot of Datashare&#x27;s project page on the Graph tab with statistics highlighted"><figcaption></figcaption></figure>

The update will **always add missing nodes and relationships, update existing ones if they were modified, but will never delete graph nodes or relationships**.

You can now [explore your graph](../../usage/explore-the-neo4j-graph.md#exploring-your-graph) using your favorite visualization tool.

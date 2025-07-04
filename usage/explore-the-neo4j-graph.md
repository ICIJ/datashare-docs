---
description: This page explains how to leverage Neo4j to explore your Datashare projects.
---

# Create a Neo4j graph and explore it

## Prerequisites

We recommend **using a recent release of Datashare (>= 14.0.0)** to use this feature. To download a specific version, click on 'All platforms and versions' [here](https://datashare.icij.org/).

If you are not familiar with graph and Neo4j, take a look at the following resources:

* [Get started with Neo4j](https://neo4j.com/docs/getting-started/)
* Find out [what is a graph database?](https://neo4j.com/docs/getting-started/get-started-with-neo4j/graph-database/)
* Learn [Neo4j fundamentals](https://graphacademy.neo4j.com/courses/neo4j-fundamentals/)
* Check out [how to use Neo4j for investigative journalism](https://www.youtube.com/watch?v=NIzx3kVUAJk\&list=PL9Hl4pk2FsvVbW2t5P1DgRifG0_kuNCu_)

## The documents and entities graph

[Neo4j](https://neo4j.com/) is a graph database technology which lets you represent your data as a graph.&#x20;

Inside Datashare, **Neo4j lets you connect entities between them through documents in which they appear**.

After creating a graph from your Datashare project, you will be able to explore this graph and visualize these kinds of relationships between you project entities:

<figure><img src="../.gitbook/assets/neo4j/graph.png" alt="Screenshot of a graph showing circles in different colors with arrows between them"><figcaption></figcaption></figure>

In the above graph, we can see 3 e-mail document nodes in orange, 3 e-mail address nodes in red, 1 person node in green and 1 location node in yellow. Reading the relationship types on the arrows, we can deduce the following information from the graph:

* `shapp@caiso.com` emailed `20participants@caiso.com`, the sent email has an ID starting with `f4db344...`
* One person named `vincent` is mentioned inside this email, as well as the `california` location
* Finally, the e-mail also mentions the `dle@caiso.com` e-mail address which is also mentioned in 2 other e-mail documents (with ID starting with `11df197...` and `033b4a2...`)

### Graph nodes

The Neo4j graph is composed of `:Document` nodes representing Datashare documents and `:NamedEntity` nodes representing entities mentioned in these documents.

The `:NamedEntity` nodes are additionally annotated with their entity types: `:NamedEntity:PERSON`, `:NamedEntity:ORGANIZATION`, `:NamedEntity:LOCATION`, `:NamedEntity:EMAIL`...

### Graph relationships

In most cases, an entity `:APPEARS_IN` a document, which means that it was detected in the document content. In the particular case of e-mail documents and `EMAIL` addresses, it is most of the time possible to identify richer relationships from the e-mail metadata, such as who sent (`:SENT` relationship) and who received (`:RECEIVED` relationship) the e-mail.

When an `:EMAIL` address entity is neither `:SENT` or `:RECEIVED`, like it is the case in the above graph for `dle@caiso.com`, it means that the address was mentioned in the e-mail document body.

When a document is embedded inside another document (as an e-mail attachment for instance), the child document is connected to its parent through the `:HAS_PARENT` relationship.

## Create your Datashare project's graph

The creation of a Neo4j graph inside Datashare is supported through a plugin. To use the plugin to create a graph, follow these instructions:

* When using Datashare [on your computer](../local-mode/create-the-neo4j-graph/)
* When Datashare is running [on your server](../server-mode/create-the-neo4j-graph/)

After the graph is created, open the menu, go to the '**Projects**' page, select **your project** and go to the **Graph** tab.&#x20;

You should be able to visualize a new Neo4j widget displaying the number of documents and entities found inside the graph:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-07 at 07.02.56.png" alt="Screenshot of Datashare&#x27;s project page on the &#x27;Graph&#x27; tab with the &#x27;Graph statistics&#x27; highlighted"><figcaption></figcaption></figure>

## Access your project's graph

Depending on your access to the Neo4j database behind Datashare, you might need to export the Neo4j graph and import it locally to access it from [visualization tools](explore-the-neo4j-graph.md#explore-and-visualize-entity-links).

Exporting and importing the graph into your own database is also useful when you want to perform write operations on your graph without any consequences on Datashare.

### With read access to Datashare's Neo4j database

If you have read access to the Neo4j database (it should be the case if you are running Datashare on your computer), you will be able to plug [visualization tools](explore-the-neo4j-graph.md#explore-and-visualize-entity-links) to it and start exploring.

### Without read access to Datashare's Neo4j database

If you can't have read access to the database, you will need to export it and import it into your own Neo4j instance (running on your laptop for instance).

#### Ask for a DB dump

If it's possible, ask you system administrator for a DB dump obtained using the [neo4j-admin database dump command](https://neo4j.com/docs/operations-manual/current/backup-restore/offline-backup/).

#### Export your graph from Datashare

In case you don't have access to the DB and can't be provided with a dump, you can export the graph from inside. Be aware that limits might be applied on the size of the exported graph.

To export the graph, open the menu, click '**Projects**' > '**All projects**' > select your project > open the **Graph** tab. At step 2 called 'Format', select the '**Cypher shell**' export format and at the end of the form, click the '**Export**' button:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-07 at 07.06.47.png" alt="Screenshot of Datashare&#x27;s project page on the &#x27;Graph&#x27; tab with the form to export a graph open and its second step called &#x27;Format&#x27; highlighted"><figcaption></figcaption></figure>

In case you want to restrict the size of the exported graph, you can restrict the export to a subset of documents and their entities using, at step 3, the '**Filters**' '**Paths**' and '**File types'**.

**DB import**

Depending on [how you run Neo4j on your laptop](faq/general/how-to-run-neo4j.md), use one of the following ways to import your graph into your DB:

**Docker**

*   Identify your Neo4j instance container ID:

    ```bash
    docker ps | grep neo4j # Should display your running neo4j container ID
    ```
*   Copy your the graph dump inside your Neo4j container import directory:

    ```bash
    docker cp \
        <export-path> \
        <neo4j-container-id>:/var/lib/neo4j/imports/datashare-graph.dump
    ```
*   Import the dumped file using the [cypher-shell](https://neo4j.com/docs/operations-manual/current/tools/cypher-shell/) command:

    ```bash
    docker exec -it <neo4j-container-id> /bin/bash
    ./bin/cypher-shell -f imports/datashare-graph.dump 
    ```

**Neo4j Desktop import**

* Open '**Cypher shell'**:

<figure><img src="../.gitbook/assets/neo4j/desktop-shell.png" alt="Screenshot of a window with the title &#x27;Graph DBMS&#x27; with the three dot dropdown open and the entry &#x27;Terminal&#x27; highlighted"><figcaption><p>desktop-shell</p></figcaption></figure>

*   Copy your the graph dump inside your neo4j instance import directory:

    ```bash
    cp <export-path> imports
    ```
*   Import the dumped file using the [cypher-shell](https://neo4j.com/docs/operations-manual/current/tools/cypher-shell/) command:

    ```bash
    ./bin/cypher-shell -f imports/datashare-graph.dump 
    ```

You will now be able to explore the graph imported in your own Neo4j instance.

## Explore and visualize entity links

Once your graph is created and you can access it (see [this section ](explore-the-neo4j-graph.md#importing-a-graph-into-your-own-neo4j-instance)if you can't access the Datashare's Neo4j instance), you will be able to use your favorite tool to extract meaningful information from it.

### Connect to your database

Once you [access your Neo4j database](explore-the-neo4j-graph.md#access-your-projects-graph), you can use different tools to visualize and explore it. You can start by connecting the [Neo4j Desktop](https://neo4j.com/docs/desktop-manual/current/visual-tour/) to your DB.

### Visualize and explore with Neo4j Bloom

[Neo4j Bloom](https://neo4j.com/product/bloom/) is a simple and powerful tool developed by Neo4j to quickly visualize and query graphs, **if you run Neo4j Enterprise Edition**. Bloom lets you navigate and explore the graph through a user interface similar to the one below:

<figure><img src="../.gitbook/assets/neo4j/bloom-viz.png" alt="Screenshot of a window showing a graph with many points grouped in 1 big and 1 small circles"><figcaption><p>bloom-viz</p></figcaption></figure>

Neo4j Bloom is accessible from inside Neo4j Desktop app.

Find out more information about how to use Neo4j Bloom to explore your graph with:

* Bloom's [User Guide](https://neo4j.com/docs/bloom-user-guide/current/about-bloom/)
* Bloom's [Quick Start](https://neo4j.com/docs/bloom-user-guide/current/bloom-quick-start/)
* [This series of videos](https://www.youtube.com/playlist?list=PL9Hl4pk2FsvWqH11v_WXVNIgb4iHjqHgs) about graph exploration with Bloom

### Query the graph with Neo4j Browser

The [Neo4j Browser](https://neo4j.com/developer/neo4j-browser/) lets you run [Cypher](https://neo4j.com/developer/cypher/) queries on your graph to explore it and retrieve information from it. Cypher is like SQL for graphs, running Cypher queries inside the Neo4j browser lets you explore the results as shown below:

<figure><img src="../.gitbook/assets/neo4j/neo4j-browser.png" alt="Screeenshot of a Neo4j Browser with blue and orange circle with arrows between some of them"><figcaption><p>browser-viz</p></figcaption></figure>

The Neo4j Browser is available for both Enterprise and Community distributions. You can access it:

* Inside the Neo4j Desktop app when running Neo4j from the [Desktop app](faq/general/how-to-run-neo4j.md#run-neo4j-desktop)
* At [http://localhost:7474/browser/](http://localhost:7474/browser/) when running Neo4j [inside Docker](faq/general/how-to-run-neo4j.md#run-neo4j-inside-docker)

### Visualize and explore with Linkurious Enterprise Explorer

[Linkurious](https://linkurious.com/linkurious-enterprise-explorer/) is a proprietary software which, similarly to Neo4j Bloom, lets you visualize and query your graph through a powerful UI.

Find out more information about Linkurious:

* [Linkurious User Manual](https://doc.linkurious.com/user-manual/latest/)
* [configure Linkurious with neo4j](https://doc.linkurious.com/admin-manual/latest/configure-neo4j/)
* [run Linkurious inside Docker](https://doc.linkurious.com/admin-manual/latest/start/#docker-linux)

### Visualize with Gephi

[Gephi](https://gephi.org/) is a simple open-source visualization software. It is possible to export graphs from Datashare into the [GraphML File Format](http://graphml.graphdrawing.org/) and import them into Gephi.

Find out more information about:

* How to [export your graph in the GraphML format](explore-the-neo4j-graph.md)
* Gephi [features](https://gephi.org/features/)
* How to [get started](https://gephi.org/users/quick-start/) with Gephi

## Export your graph in the GraphML format

To export the graph in the [GraphML file format](http://graphml.graphdrawing.org/), open the menu, click '**Projects**' > '**All projects**' > select your project > open the **Graph** tab. At step 2 called 'Format', select the '**Graph ML**' export format and at the end of the form, click the '**Export**' button:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-07 at 07.13.16.png" alt="Screenshot of Datashare&#x27;s project page on the &#x27;Graph&#x27; tab with the form to export a graph open at its second step called &#x27;Format&#x27; and the &#x27;GraphML&#x27; radiobutton selected and highlighted"><figcaption></figcaption></figure>

In case you want to restrict the size of the exported graph, you can restrict the export to a subset of documents and their entities using, at step 3, the '**Filters**' '**Paths**' and '**File types'**.

You will now be able to [visualize the graph using Gephi](explore-the-neo4j-graph.md#visualize-with-gephi) by opening the exported GraphML file in it.

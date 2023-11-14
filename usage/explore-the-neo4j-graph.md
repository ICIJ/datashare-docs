---
description: TODO
---

# Explore your project using [neo4j](https://neo4j.com/) 

## The documents and entities graph

[neo4j](https://neo4j.com/) is a graph database technology which lets you represent  your data as a graph.
Inside Datashare, neo4j lets you connect entities between them through documents in which they appear.

After creating a graph from your Datashare project, you will be able to explore it and visualize these kinds of relationships between you project entities:   

![](../.gitbook/assets/neo4j/graph.png)

In the above graph, we can see 3 email document nodes in orange, 3 email address nodes in red, 1 person node in green and 1 location node in yellow.
Reading from types of relationships on the arrows, we can deduce the following information from the graph:
- `shapp@caiso.com` emailed `20participants@caiso.com`, the sent email has an id starting with `f4db344...`
- one person named `vincent` is mentioned inside this email, as well as the `california` location
- finally, the email also mentions the `dle@caiso.com` email address which is also mentioned in 2 other email documents (with id starting with `11df197...` and `	033b4a2...`)


### Graph nodes

The neo4j graph is composed of `:Document` nodes representing a Datashare document and `:NamedEntity` nodes representing entities mentioned in these documents. 

The `:NamedEntity` nodes are additionally annotated with their entity types: `:NamedEntity:PERSON`, `:NamedEntity:ORGANIZATION`, `:NamedEntity:LOCATION`, `:NamedEntity:EMAIL`...    


### Graph relationships

In most case entities `:APPEARS_IN` documents, which means that they were detected in the document content.
In the particular case of email documents and `EMAIL` addresses its most of the time possible to identify richer relationships such as who sent (`:SENT` relationship) the email and who received it (`:RECEIVED` relationship).

When an `:EMAIL` address entity is neither `:SENT` or `:RECEIVED`, like it is the case here for `dle@caiso.com`, it means that the address was mentioned in the email document body. 

When a document is embedded inside another document (as an email attachment for instance), the child document is connected to its parent through the `:HAS_PARENT` relationship.


## Creating your project's graph

The creation of a neo4j graph inside Datashare is supported through a plugin.
To use the plugin to create a graph, follow these instructions:
- [when using Datashare on your computer](../local-mode/create-the-neo4j-graph/README.md)
- [when Datashare is running on your server](../server-mode/create-the-neo4j-graph/README.md)

After the graph is created, navigate to the '**Projects'** page and select your project.
You should be able to visualize a new neo4j widget displaying the number of document and entities found inside the graph:
![graph-widget](../.gitbook/assets/neo4j/neo4j-widget.png)


## Exploring your graph

Once your graph is created and that you can access it (see [this section ](#importing-a-graph-into-your-own-neo4j-instance) if you can't access the Datashare's neo4j instance), you will be able to use your favorite tool to extract meaningful information from it.   


### Visualize and explore with Neo4j Bloom

[Neo4j Bloom](https://neo4j.com/product/bloom/) is a simple and powerful tool developed by neo4j to quickly visualize and query graphs, **If you run Neo4j Enterprise Edition**.
Bloom lets you navigate and exploration the graph trough a simple a user interface similar to the one below:

![bloom-viz](../.gitbook/assets/neo4j/bloom-viz.png)

Find out more information about to use Neo4j Bloom to explore your graph with:
- Bloom's [User Guide](https://neo4j.com/docs/bloom-user-guide/current/about-bloom/)
- Bloom's [Quick Start](https://neo4j.com/docs/bloom-user-guide/current/bloom-quick-start/)
- [this series of videos](https://www.youtube.com/playlist?list=PL9Hl4pk2FsvWqH11v_WXVNIgb4iHjqHgs) about graph exploration with Bloom


### Query the graph with Neo4j Browser

The [Neo4j Browser](https://neo4j.com/developer/neo4j-browser/) lets you run [Cypher](https://neo4j.com/developer/cypher/) queries on your graph to explore it and retrieve information from it.
Cypher is like SQL for graphs, running Cypher queries inside the neo4j browser lets you explore the results as shown below:

![browser-viz](../.gitbook/assets/neo4j/neo4j-browser.png)

The Neo4j Browser is available for both Enterprise and Community distributions. You can access it:
- inside the Neo4j Desktop app when running neo4j from the [Desktop app](faq/general/how-to-run-neo4j.md#run-neo4j-desktop)
- at [http://localhost:7474/browser/](http://localhost:7474/browser/) when running neo4j [inside Docker](faq/general/how-to-run-neo4j.md#run-neo4j-inside-docker) 


### Visualize and explore with Linkurious Enterprise Explorer

[Linkurious](https://linkurious.com/linkurious-enterprise-explorer/) is a proprietary software which similarly to Neo4j Bloom lets you visualize and query your graph through a powerful UI.

Find out more information about Linkurious:
- [Linkurious User Manual](https://doc.linkurious.com/user-manual/latest/)
- [configure Linkurious with neo4j](https://doc.linkurious.com/admin-manual/latest/configure-neo4j/)
- [run Linkurious inside Docker](https://doc.linkurious.com/admin-manual/latest/start/#docker-linux)

### Visualize with Gephi

[Gephi](https://gephi.org/) is a simple open-source visualization software.
It is possible to export graphs from Datashare into the [GraphML File Format](http://graphml.graphdrawing.org/) and import them into Gephi.

Find out more information about:
- how to [export your graph in the GraphML format]()
- Gephi [features](https://gephi.org/features/)
- how to [get started](https://gephi.org/users/quick-start/) with Gephi


## Importing a graph into your own neo4j instance

When using Datashare without direct access to the neo4j database, it can be useful to export the graph to re-import in into your own neo4j instance.

To import the graph in your own noe4j database you will need to [run your own neo4j instance](faq/general/how-to-run-neo4j.md).

When your instance is up and running, navigate to Datashare's '**Projects'** page, select your project, select the '**Cypher shell'** export format and click the '**Export graph'** button:

![graph-dump](../.gitbook/assets/neo4j/neo4j-widget-neo4-dump.png)

In case you want to restrict the size of the exported graph, you can restrict the export to a subset of documents and their entities using the '**File types'** and '**Project directory**' filters.

You will now be able to import the dumped file into your own neo4j. 
 
### Docker import
- identify your neo4j instance container ID:
    ```bash
    docker ps | grep neo4j # Should display your running neo4j container ID
    ```
- copy your the graph dump inside your neo4j container import directory:
    ```bash 
    docker cp \
        <datashare-path> \
        <neo4j-container-id>:/var/lib/neo4j/imports/datashare-graph.dump
    ```
- import the dumped file using the [cypher-shell](https://neo4j.com/docs/operations-manual/current/tools/cypher-shell/) command: 
    ```bash 
    docker exec -it <neo4j-container-id> /bin/bash
    ./bin/cypher-shell -f imports/datashare-graph.dump 
    ```

### Neo4j Desktop import
- open '**Cypher shell'**:
    ![desktop-shell](../.gitbook/assets/neo4j/desktop-shell.png)
  
- copy your the graph dump inside your neo4j instance import directory:
    ```bash 
    cp <datashare-path> imports
    ```

- import the dumped file using the [cypher-shell](https://neo4j.com/docs/operations-manual/current/tools/cypher-shell/) command: 
    ```bash
    ./bin/cypher-shell -f imports/datashare-graph.dump 
    ```

You will now be able to [explore the graph](#exploring-your-graph) imported in your own neo4j instance. 

## Export your graph in the GraphML format

To export the graph in the [GraphML file format](http://graphml.graphdrawing.org/), navigate to the '**Projects'**, select your project, choose the '**Graph ML'** export format and click the '**Export graph'** button:

![graph-ml-dump](../.gitbook/assets/neo4j/neo4j-widget-neo4-dump.png)

In case you want to restrict the size of the exported graph, you can restrict the export to a subset of documents and their entities using the '**File types'** and '**Project directory**' filters.

You will now be able to [visualize the graph using Gephi](#visualize-with-gephi) by opening the exported GraphML file in it.


## Additional resources

### Learn about graphs and neo4j
- [Get started with neo4j](https://neo4j.com/docs/getting-started/)
- Find out [what is a graph database?](https://neo4j.com/docs/getting-started/get-started-with-neo4j/graph-database/)
- Learn [neo4j fundamentals](https://graphacademy.neo4j.com/courses/neo4j-fundamentals/)
- Check out [how to use neo4j for investigative journalism](https://www.youtube.com/watch?v=NIzx3kVUAJk&list=PL9Hl4pk2FsvVbW2t5P1DgRifG0_kuNCu_)

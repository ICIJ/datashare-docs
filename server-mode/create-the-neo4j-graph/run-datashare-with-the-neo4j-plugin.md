# Run Datashare with the neo4j plugin and extension

## Install the neo4j plugin

Install the neo4j plugin using the Datashare CLI so that users can access it from the frontend:
```bash
docker compose exec datashare_web /entrypoint.sh \
  --mode CLI \
  --pluginInstall datashare-plugin-neo4j-graph-widget 
```

Installing the plugin will also install the `datashare-extension-neo4j` backend extension inside `/home/datashare/extensions`.
This location can be changed providing the `--extensionsDir` parameter. 

## Configure the neo4j extension

Update the `docker-compose.yml` to reflect your [neo4j docker service settings](../../usage/faq/general/how-to-run-neo4j.md#run-neo4j-inside-docker). 

{% code fullWidth="true" %}
```yaml
...
services:
    datashare_web:
      ...
      environment:
        - DS_DOCKER_NEO4J_HOST=neo4j
        - DS_DOCKER_NEO4J_PORT=7687
```
{% endcode %}

If your choose a different neo4j user or set a password for your neo4j user make sure to also set `DS_DOCKER_NEO4J_USER` and `DS_DOCKER_NEO4J_PASSWORD`.

**When running `Neo4j Community Edition`, set the `DS_DOCKER_NEO4J_SINGLE_PROJECT` value**. 
In community edition, the neo4j DBMS is restricted to a single database.
Since Datashare supports multiple projects, you must set the `DS_DOCKER_NEO4J_SINGLE_PROJECT` with the name of the project which will use neo4j plugin.
**Other projects won't be able to use the neo4j plugin**.


## Next step

**You can now [create the graph](create-and-update-the-graph.md) !**

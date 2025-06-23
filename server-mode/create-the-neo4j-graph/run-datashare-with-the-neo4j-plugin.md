# Install Neo4j plugin

## Install the Neo4j plugin

Install the Neo4j plugin using the Datashare CLI so that users can access it from the frontend:

```bash
docker compose exec datashare_web /entrypoint.sh \
  --mode CLI \
  --pluginInstall datashare-plugin-neo4j-graph-widget 
```

Installing the plugin installs the `datashare-plugin-neo4j-graph-widget` plugin inside `/home/datashare/plugings` and will also install the `datashare-extension-neo4j` backend extension inside `/home/datashare/extensions`. These locations can be changed by updating the `docker-compose.yml`.

## Configure the Neo4j extension

Update the `docker-compose.yml` to reflect your [Neo4j docker service settings](../../usage/faq/general/how-to-run-neo4j.md#run-neo4j-inside-docker).

{% code fullWidth="true" %}
```yaml
...
services:
    datashare_web:
      ...
      environment:
        - DS_DOCKER_NEO4J_HOST=neo4j
        - DS_DOCKER_NEO4J_PORT=7687
        - DS_DOCKER_NEO4J_SINGLE_PROJECT=secret-project  # This is for community edition only
```
{% endcode %}

If your choose a different Neo4j user or set a password for your Neo4j user make sure to also set `DS_DOCKER_NEO4J_USER` and `DS_DOCKER_NEO4J_PASSWORD`.

**When running `Neo4j Community Edition`, set the `DS_DOCKER_NEO4J_SINGLE_PROJECT` value**. In community edition, the Neo4j DBMS is restricted to a single database. Since Datashare supports multiple projects, you must set the `DS_DOCKER_NEO4J_SINGLE_PROJECT` with the name of the project which will use Neo4j plugin. **Other projects won't be able to use the Neo4j plugin**.

## Restart Datasahre

After installing the plugin a restart might be needed for the plugin to display:

```
docker compose restart datashare_web
```

## Next step

You can now [create the graph](create-and-update-the-graph.md).

---
description: This page explains how to run a neo4j instance inside docker. For any additional information please refer to the [neo4j documentation](https://neo4j.com/docs/getting-started/)
---

# Running [neo4j](https://neo4j.com/docs/)

## Run neo4j inside docker

&#x20;1. enrich the `service` section of the `docker-compose.yml` of the [install with Docker](../../../local-mode/install-with-docker.md) page, with the following neo4j service: 

{% code fullWidth="true" %}
```yaml
...
services:
    neo4j:
      image: neo4j:5-community
      environment:
        NEO4J_AUTH: none
        NEO4J_PLUGINS: '["apoc"]'
      ports:
        - 7474:7474
        - 7687:7687
      volumes:
        - neo4j_conf:/var/lib/neo4j/conf
        - neo4j_data:/var/lib/neo4j/data
```
{% endcode %}

&#x20;2. enrich the `volumes` section of the `docker-compose.yml` of the [install with Docker](../../../local-mode/install-with-docker.md) page, with the following neo4j volume:
{% code fullWidth="true" %}
```yaml
volumes:
  ...
  neo4j-data:
    driver: local
  neo4j_conf:
    driver: local
```
{% endcode %}

&#x20;3. Start the `neo4j` service using:

{% code fullWidth="true" %}
```bash
docker compose up -d neo4j
``` 
{% endcode %}

## Run Neo4j Desktop

1. install with  [Neo4j Desktop](https://neo4j.com/docs/desktop-manual/current/), follow installation instructions found [here](https://neo4j.com/docs/desktop-manual/current/installation/)
2. [create a new local DBMS](https://neo4j.com/docs/desktop-manual/current/operations/create-dbms/) and save your password for later
3. if the installer notifies you of any ports modification, check the [DBMS settings](https://neo4j.com/docs/desktop-manual/current/visual-tour/#dbms) and save the `server.bolt.listen_address` for later  

## Additional options
Additional options to install neo4j are [listed here](https://neo4j.com/docs/operations-manual/current/installation/).
---
description: This page explain how to start Datashare within a Docker in server mode.
---

# Install with Docker

### Prerequisites

Datashare platform is designed to function effectively by utilizing a combination of various services. To streamline the development and deployment workflows, Datashare relies on the use of Docker containers. Docker provides a lightweight and efficient way to package and distribute software applications, making it easier to manage dependencies and ensure consistency across different environments.

[**Read more about how to install Docker on your system.**](https://docs.docker.com/engine/install/)

### Starting Datashare with multiple containers&#x20;

Within Datashare, Docker Compose can play a significant role in enabling the setup of separated and persistent services for essential components. By utilizing Docker Compose, you can define and manage multiple containers as part of a unified service. This allows for seamless orchestration and deployment of interconnected services, each serving a specific purpose within the Datashare ecosystem.

Specifically, Docker Compose allows you to configure and launch separate containers for PostgreSQL, Elasticsearch, and Redis. These containers can be set up in a way that ensures their data is persistently stored, meaning that any information or changes made to the database, search index, or key-value store will be retained even if the containers are restarted or redeployed.

This separation of services using Docker Compose provides several advantages. It enhances modularity, scalability, and maintainability within the Datashare platform. It allows for independent management and scaling of each service, facilitating efficient resource utilization and enabling seamless upgrades or replacements of individual components as needed.

To start Datashare in server mode with [Docker Compose](https://docs.docker.com/compose/), you can use the following **docker-compose.yml** file:

{% code fullWidth="true" %}
```yaml
version: "3.7"
services:

  # This is the main Datashare service that serves the web interface. 
  # Here it is configured with a "dummy" authentication backend which 
  # creates epehemeral user sessions.
  datashare_web:
    image: icij/datashare:11.1.9
    hostname: datashare
    ports:
      - 8080:8080
    environment:
      - DS_DOCKER_MOUNTED_DATA_DIR=${HOME}/Datashare
    volumes:
      - type: bind
        source: ${HOME}/Datashare
        target: /home/datashare/Datashare
    depends_on:
      postgresql:
        condition: service_healthy
      redis:
        condition: service_healthy
      elasticsearch:
        condition: service_healthy
    command: >-
      --mode SERVER
      --dataDir /home/datashare/Datashare
      --pluginsDir /home/datashare/plugins
      --extensionsDir /home/datashare/extensions
      --authFilter org.icij.datashare.session.YesCookieAuthFilter
      --busType REDIS
      --batchQueueType REDIS
      --dataSourceUrl jdbc:postgresql://postgresql/datashare?user=datashare\&password=password 
      --defaultProject secret-project
      --elasticsearchAddress http://elasticsearch:9200      
      --messageBusAddress redis://redis:6379
      --queueType REDIS
      --redisAddress redis://redis:6379  
      --rootHost http://localhost:8080
      --sessionStoreType REDIS
      --sessionTtlSeconds 43200
      --tcpListenPort 8080

  # We use a service to create the "secret-project". In theory you only need 
  # to run it the first time you start Datashare. 
  datashare_create_project:
    image: icij/datashare:11.1.9
    restart: no
    depends_on:
      elasticsearch:
        condition: service_healthy
    command: >-
      --defaultProject secret-project 
      --mode CLI 
      --stage INDEX 
      --elasticsearchAddress http://elasticsearch:9200

  # This service starts a deamon that wait for new batch searches 
  # so it can run them (and save them in the database).
  datashare_batch_searches:
    image: icij/datashare:11.1.9
    depends_on:
      - datashare_web
    command: >-
      --mode TASK_RUNNER
      --batchQueueType REDIS
      --batchThrottleMilliseconds 500
      --busType REDIS
      --dataSourceUrl jdbc:postgresql://postgresql/datashare?user=datashare\&password=password
      --defaultProject secret-project 
      --elasticsearchAddress http://elasticsearch:9200  
      --queueType REDIS
      --redisAddress redis://redis:6379
      --scrollSize 100  
      
  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:7.9.1
    restart: on-failure
    volumes:
      - type: volume
        source: elasticsearch-data
        target: /usr/share/elasticsearch/data
        read_only: false
    environment:
      - "http.host=0.0.0.0"
      - "transport.host=0.0.0.0"
      - "cluster.name=datashare"
      - "discovery.type=single-node"
      - "discovery.zen.minimum_master_nodes=1"
      - "xpack.license.self_generated.type=basic"
      - "http.cors.enabled=true"
      - "http.cors.allow-origin=*"
      - "http.cors.allow-methods=OPTIONS, HEAD, GET, POST, PUT, DELETE"
    healthcheck:
      test: ["CMD-SHELL", "curl --silent --fail elasticsearch:9200/_cluster/health || exit 1"]

  postgresql:
    image: postgres:12-alpine
    environment:
      - POSTGRES_USER=datashare
      - POSTGRES_PASSWORD=password
      - POSTGRES_DB=datashare
      # This is needed by the heathcheck command
      # @see https://stackoverflow.com/a/60194261
      - PGUSER=datashare
    volumes:
      - type: volume
        source: postgresql-data
        target: /var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready", "-U", "datashare", "-d", "datashare"]
  
  redis:
    image: redis:4.0.1-alpine
    restart: on-failure
    volumes:
      - type: volume
        source: redis-data
        target: /data
    healthcheck:
      test: ["CMD-SHELL", "redis-cli", "--raw", "incr", "ping"]

volumes:
  datashare-batchdownload-dir:
  elasticsearch-data:
  postgresql-data:
  redis-data:
```
{% endcode %}

Open a terminal or command prompt and navigate to the directory where you saved the `docker-compose.yml` file. Then run the following command to start the Datashare service:

```
docker-compose up -d
```

_The `-d` flag runs the containers in detached mode, allowing them to run in the background._

Docker Compose will pull the necessary Docker images (if not already present) and start the containers defined in the YAML file. Datashare will take a few seconds to start. You can check the progression of this opperation with:

```
docker-compose logs -f datashare_web
```

Once the containers are up and running, you can access the Datashare service by opening a web browser and entering `http://localhost:8080`. This assumes that the default port mapping of `8080:8080` is used for the Datashare container in the YAML file.

To stop the Datashare service and remove the containers, you can run the following command in the same directory where the `docker-compose.yml` file is located:

```
docker-compose down
```

This will stop and remove the containers, freeing up system resources.

### Add documents to Datashare

If you reach that point, Datashare is up and running but you will discover very quickly
that no documents is available in the search results. Next step: **[Add documents from the CLI](/server-mode/add-documents-from-the-cli.md)**.

### Extract named entities

Datashare as the ability to detect email addresses, name of people, organizations and locations.
You must perform the named entities extraction in the same fashion than the previous commands. Final step: **[Add named entities from the CLI](/server-mode/add-entities-from-the-cli.md)**.
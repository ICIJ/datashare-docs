---
description: This page will help you set up and install Datashare within a Docker.
---

# Install with Docker

### Prerequisites <a href="#prerequisites" id="prerequisites"></a>

Datashare platform is designed to function effectively by utilizing a combination of various services. To streamline the development and deployment workflows, Datashare relies on the use of Docker containers. Docker provides a lightweight and efficient way to package and distribute software applications, making it easier to manage dependencies and ensure consistency across different environments.

[**Read more about how to install Docker on your system**](https://docs.docker.com/engine/install/)

### Starting Datashare with a single container

To start Datashare within a [Docker](https://www.docker.com/) container, you can use this command:

```bash
docker run --mount src=$HOME/Datashare,target=/home/datashare/data,type=bind -p 8080:8080 icij/datashare:11.1.9 --mode EMBEDDED
```

_Make sure the `Datashare` folder exists in your homedir or this command will fail. This is an example about how to use Datashare with Docker, data will not be persisted._

### Starting Datashare with multiple containers

Within Datashare, Docker Compose can play a significant role in enabling the setup of separated and persistent services for essential components such as the database (PostgreSQL), the search index (Elasticsearch), and the key-value store (Redis).

By utilizing Docker Compose, you can define and manage multiple containers as part of a unified service. This allows for seamless orchestration and deployment of interconnected services, each serving a specific purpose within the Datashare ecosystem.

Specifically, Docker Compose allows you to configure and launch separate containers for PostgreSQL, Elasticsearch, and Redis. These containers can be set up in a way that ensures their data is persistently stored, meaning that any information or changes made to the database, search index, or key-value store, will be retained even if the containers are restarted or redeployed.

This separation of services using Docker Compose provides several advantages. It enhances modularity, scalability, and maintainability within the Datashare platform. It allows for independent management and scaling of each service, facilitating efficient resource utilization and enabling seamless upgrades or replacements of individual components as needed.

To start Datashare with [Docker Compose](https://docs.docker.com/compose/), you can use the following **docker-compose.yml** file:

{% code fullWidth="true" %}
```yaml
version: "3.7"
services:

  datashare:
    image: icij/datashare:18.1.3
    hostname: datashare
    ports:
      - 8080:8080
    environment:
      - DS_DOCKER_MOUNTED_DATA_DIR=/home/datashare/data
    volumes:
      - type: bind
        source: ${HOME}/Datashare
        target: /home/datashare/data
      - type: volume
        source: datashare-models
        target: /home/datashare/dist
    command: >-
      --dataSourceUrl jdbc:postgresql://postgresql/datashare?user=datashare\&password=password 
      --mode LOCAL
      --tcpListenPort 8080
    depends_on:
      - postgresql
      - redis
      - elasticsearch

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

  redis:
    image: redis:4.0.1-alpine
    restart: on-failure

  postgresql:
    image: postgres:12-alpine
    environment:
      - POSTGRES_USER=datashare
      - POSTGRES_PASSWORD=password
      - POSTGRES_DB=datashare
    volumes:
      - type: volume
        source: postgresql-data
        target: /var/lib/postgresql/data

volumes:
  datashare-models:
  elasticsearch-data:
  postgresql-data:
```
{% endcode %}

Open a terminal or command prompt and navigate to the directory where you saved the `docker-compose.yml` file. Then run the following command to start the Datashare service:

```
docker-compose up -d
```

_The `-d` flag runs the containers in detached mode, allowing them to run in the background._

Docker Compose will pull the necessary Docker images (if not already present) and start the containers defined in the YAML file. Datashare will take a few seconds to start. You can check the progression of this operation with:

```
docker-compose logs -f datashare
```

Once the containers are up and running, you can access the Datashare service by opening a web browser and entering `http://localhost:8080`. This assumes that the default port mapping of `8080:8080` is used for the Datashare container in the YAML file.

**That's it! You should now have the Datashare service up and running, accessible through your web browser. Remember that the containers will continue to run until you explicitly stop them.**

To stop the Datashare service and remove the containers, you can run the following command in the same directory where the `docker-compose.yml` file is located:

```
docker-compose down
```

This will stop and remove the containers, freeing up system resources.

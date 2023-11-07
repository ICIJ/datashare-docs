# About the server mode

In **server mode**, Datashare operates as a centralized server-based system. Users can access to the platform through a web interface, and the documents are stored and processed on Datashare's servers. This mode offers the advantage of easy accessibility from anywhere with an internet connection, as users can log in to the platform remotely. It also facilitate seamless collaboration among users, as all the documents and analysis are centralized.

# Server configuration

Datashare is launched with `--mode SERVER` and you have to provide:

- the external elasticsearch index address `elasticsearchAddress`
- a Redis store address `redisAddress`
- a Redis data bus address `messageBusAddress`
- a database [JDBC URL](https://docs.oracle.com/cd/E57185_01/ESTUG/apbs02s04s01.html) `dataSourceUrl`
- the host of datashare (for batch search results URL generation) `rootHost`
- an authentication mechanism and its parameters

Example:

```
docker run -ti ICIJ/datashare:version --mode SERVER \
    --redisAddress redis://my.redis-server.org:6379 \
    --elasticsearchAddress https://my.elastic-server.org:9200 \
    --messageBusAddress my.redis-server.org \
    --dataSourceUrl jdbc:postgresql://db-server/ds-database?user=ds-user&password=ds-password \
    --rootHost https://my.datashare-server.org
    # ... +auth parameters (see authentication providers section)

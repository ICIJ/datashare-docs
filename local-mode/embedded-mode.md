# Embedded mode

Embedded mode has been created to embed all services in the Java Runtime Environment (JRE):

- Databus is launched with an embedded instance of [Qpid](https://qpid.apache.org/) (it is written in Java)
- Blocking queues are Java memory blocking queues
- Database is SQLite and can be in memory or in a file
- Elasticsearch **was** running in the JVM: since the version 8 it is not possible because the plugins datashare needed (parent-join, common-analysis, painless, reindex) are not published anymore on the maven repositories.

Thus from datashare 21, elasticsearch is started as a datashare sub-process in another JVM. This process is itself embedding another JVM. So there are 3 of them. You will eventually need to tweak those JVM to make the service run flawlessly according to you need (index data, usage and host hardware). To do so you can use the Elasticsearch and Datashare Java options by their environment variables, respectively `ES_JAVA_OPTS` and `DS_JAVA_OPTS`.

For example you can adjust the [maximum heap size](https://docs.oracle.com/en/java/javase/17/docs/specs/man/java.html#extra-options-for-java) (Xmx) option:

```shell
ES_JAVA_OPTS="-Xmx2g" DS_JAVA_OPTS="-Xmx1g" datashare <args>
```

This will allow the elasticsearch JVM to take up to 2GB and 1GB for the datashare one.

## Anatomy of embedded mode

The installers are installing an elasticsearch shell startup script. This script will detect if the datashare corresponding elasticsearch version is present on the localhost filesystem. If not, it will download the zip from Elasticsearch [official release](https://www.elastic.co/downloads/) site and unpack it:

- on `$HOME/.local/share/datashare/elasticsearch` for linux
- on `${HOME}/Library/Datashare/elasticsearch` for MacOS
- on `$APPDATA\Datashare\elasticsearch` for Windows

When datashare is started, it will launch `bin/elasticsearch` from the Elasticsearch installation path and wait for it to be up. You will see logs like:

```
2026-02-23 16:33:31,230 [pool-3-thread-1] INFO  IndexWaiterFilter - Ping failed. Waiting for indexer to be up java.net.ConnectException: Connection refused
```

Until Datashare finally reaches the index:

```
2026-02-23 16:33:54,622 [pool-3-thread-1] INFO  IndexWaiterFilter - Ping indexer succeeded
```

## Debugging

If you have trouble to make datashare and elasticsearch run, you can check the following options:

- make Elasticsearch run alone. You can go to the above installation location and start elasticsearch script to see if it is running properly
- when it runs, you can launch datashare without `--elasticsearchPath` to avoid datashare to launch elasticsearch
- if it is OK, then close elasticsearch and datashare and launch datashare normally
- look for elasticsearch errors (for example `exit 137` is a common failure caused by Elasticsearch detecting that it has not enough memory to start)
- try with different size for `Xmx`. Usually, elasticsearch needs more memory than datashare (you can try with twice as much for example)

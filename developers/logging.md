---
description: >-
  This page explain how to change the logging configuration when working on
  Datashare backend in Java.
---

# Logging

### Architecture

Datashare is using [slf4j](https://www.slf4j.org/) logging facade with [logback](https://logback.qos.ch/) as implementation.

As Datashare is also integrating other components (ElasticSearch or AWS S3SDK for example) that are using [log4j](https://logging.apache.org/log4j) it comes with a [log4j-to-slf4j adapter](https://logging.apache.org/log4j/2.x/log4j-to-slf4j/index.html) for gathering all the logs and controlling logging levels at the same place.

The logging facilities (logback, log4j, slf4j) are all using the same mecanisms :

1. the default : they are loading a logging configuration file from the Java classpath
2. or they can use JVM properies to load an alternative properties file
3. or they can set the logging configuration by API in the java code

### Configuration

Datashare is using the default : it is loading log files from the Java classpath. In the entry module `datashare-app` there are [two logback files](https://github.com/ICIJ/datashare/tree/master/datashare-app/src/main/resources) that are bundled with the datashare jar :

* logback.xml : it logs with info level on the standard output and rolling files `datashare.${date}.log` (default)
* logback-prod.xml: it logs with a [GelfLogbackAppender](https://logging.paluch.biz/apidocs/biz/paluch/logging/gelf/logback/GelfLogbackAppender.html) in UDP/[Gelf](https://docs.graylog.org/docs/gelf) on the 5140 port with syslog local7 facility on a host contained by a `${datashare.loghost}` variable (JVM property)

For example, using the prod logback value would give the following parameters to provide to the JVM :

```
-Ddatashare.loghost=udp:<your_loghost> -Dlogback.configurationFile=logback-prod.
```

### Debugging

For debugging and configuration tweaks, as Datashare launching scripts are loading NLP models with classpath, if you put a custom `logback.xml` in the `dist` folder (where the directories `models/corenlp`... are) it should be loaded by Datashare.

For example, you can change the line:

```
<root level="info" additivity="false">
```

by

```
<root level="debug" additivity="false">
```

It will log all java modules with the debug level (hope you have enough room on your disk).

If you want to enable S3 HTTP requests debug, you can replace the line:

```
<logger name="com.amazonaws.request" level="warn" />
```

by

```
<logger name="com.amazonaws.request" level="debug" />
```

Or you can build your custom logback configuration and make it load by Datashare, see the [logback documentation](https://logback.qos.ch/manual/configuration.html)

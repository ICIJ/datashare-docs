# 7. Use Guava IoC as Service selector

Date: 2018-08-01

## Status

Accepted

## Context

We need to make run Datashare in local mode on small configs, and also to make it run on AWS server clusters.

So we could use : 
* for database : sqlite in localmode, postgresql in server mode
* for databus : memory databus in local mode and redis in server mode
* for index : embedded Elasticsearch in local mode and distinct cluster in server mode

That means that we will have different implementations for the services.

## Decision

We will use [dependency injection pattern](https://en.wikipedia.org/wiki/Dependency_injection) to choose the concrete implementation for datashare services.
As springframework is quite heavy with large XML configuration description files, we will use [Guava](https://guava.dev/).

## Consequences

The Application context will be defined at launch with Guava depending on the executable arguments (run mode).

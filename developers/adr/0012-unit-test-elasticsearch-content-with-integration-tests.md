# 12. Unit Test Elasticsearch content with integration tests

Date: 2018-03-14

## Status

Accepted

## Context

When doing TDD with datashare front, we can
* mock elasticsearch and assert actual queries are equals to expected ones
* use a real elasticsearch server and provision small datasets for each test context

## Decision

We will create a [DSL](https://www.jetbrains.com/mps/concepts/domain-specific-languages/) to ingest data into elasticsearch in order to avoid coupling with Elasticseach JSON API.
The [small library](https://github.com/ICIJ/datashare-client/commits/2e3c43284b96e8eee5295842387b451aeee8346d/tests/unit/es_utils.js) will provide a simple API to create small and testable datasets (Documnents, NamedEntities, Tags...).
It will also allow the developers to create index, reset the state for tests tear down.

## Consequences

For datashare tests involving elasticsearch, developers will use this small DSL (if ES API change tests will fail).
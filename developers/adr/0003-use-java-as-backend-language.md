# 3. Use java as backend language

Date: 2017-01-01

## Status

Accepted

## Context

Main NLP pipelines are using java as implementing language : 
* CoreNLP
* OpenNLP
* IxaPipe
* GateNLP

ICIJ had an existing library called extract that was also implemented in Java.

Furthermore, Elasticsearch is implemented in Java.

## Decision

Java will be used as backend language to integrate with NLP and Elasticsearch.

## Consequences

The datashare team will need Java skilled developers.
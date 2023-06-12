# 16. Introduce Persistence system for datashare

Date: 2019-04-16

## Status

Accepted

## Context

To help journalists having a grasp on a document corpus, datashare does 3 things :

* extract metadata from files
* extract text content from files (with OCR for images) and index it
* find named entities from the text content

For now (December 2018) datashare has no persistence. It’s only using elasticsearch to persist data from the files on the filesystem.

It is an issue for three reasons :

* as mentioned on the elasticsearch website : “Elasticsearch is commonly used in addition to another database. A database system with stronger focus on constraints, correctness and robustness”
* Tika with OCR is a heavy process (it can take 5mn for one file), and named entity extraction is also quite heavy. That is why we need to cache the data somewhere, and cannot take the raw files as data source, extracting metadata and content on demand.
* the next evolution of datashare will need to store persistent data from the user (annotations, document properties, notes, tags, user preferences…).

## Decision

After a spike session (post name datashare-persistence-architecture) we've decided to use postgresql for server mode and sqlite for local mode.

We will not implement an ORM like [Hibernate](https://hibernate.org/) for simplicity reason.
Instead, we will use Jooq layer to build SQL requests in Java.

[Jooq](https://www.jooq.org/) allows writing SQL queries in Java with SQL syntactic validation.

## Consequences

The backend build will have to generate the Jooq code when database schema changes.
We will make integration tests for both databases (SqLite and Postgresql) to be sure that the SQL requests works for both databases.
We will use [parametrized tests](https://github.com/junit-team/junit4/wiki/parameterized-tests) for this purpose.
# 14. Create batch search daemon

Date: 2019-10-01

## Status

Accepted

## Context

Journalists want to search for lists of queries at once, and get the results later.
That feature was possible with the previous ICIJ search tool (based on SolR).

## Decision

To avoid loading the backend web server, the batch searches are going to be run by another daemon process.
We will use the database to store batch search details and results.

## Consequences

That means that the backend server should send data to the search daemon. And the state of the search should be available by the front to allow user monitoring.

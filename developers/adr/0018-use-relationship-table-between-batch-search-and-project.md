# 18. Use relationship table between Batch Search and Project

Date: 2022-03-25

## Status

Accepted

## Context

Multi project search has been previously implemented.
Consequently, performing batch searches on multiple projects should be possible.


## Decision

In terms of data persistance and database we decided to modify the `BATCH_SEARCH` table by removing the `PRJ_ID` column.
Additionally we will create a relationship table linking user history ids and project ids in order to guarantee an N:M relationship.
The new table BATCH_SEARCH_PROJECT will have the following constraints :
- UNIQUE constraint between the user history id and project id to avoid unnecessary duplicates.
- FOREIGN KEY on the user history to make sure that existing elements are bound. We will not add a FOREIGN KEY on the project id because we don't store the project ids in the database.

![batch_search_project_relationship](https://user-images.githubusercontent.com/35509100/160410624-74022a6a-e5a7-4ec8-a091-e0c1f1f4dc33.png)

## Consequences

The backend functions related to database operations will be modified

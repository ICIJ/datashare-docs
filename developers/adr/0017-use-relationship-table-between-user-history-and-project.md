# 17. Use relationship table between User History and Project

Date: 2022-03-14

## Status

Accepted

## Context

Multi project search has been previously implemented.
Consequently, saving search involving multiple projects should be possible.


## Decision

In terms of data persistance and database we decided to modify the `USER_HISTORY` table by removing the `PRJ_ID` column.
Additionally we will create a relationship table linking user history ids and project ids in order to guarantee an N:M relationship.
The new table USER_HISTORY_PROJECT will have the following constraints :
- UNIQUE constraint between the user history id and project id to avoid unnecessary duplicates.
- FOREIGN KEY on the user history to make sure that existing elements are bound. We will not add a FOREIGN KEY on the project id because we don't store the project ids in the database.

![db_schema](https://user-images.githubusercontent.com/35509100/159693299-65872739-985a-47f1-8333-d0805abf56f4.png)

## Consequences

The backend will have to make multiple queries to insert or delete user history events, transactional queries will be used

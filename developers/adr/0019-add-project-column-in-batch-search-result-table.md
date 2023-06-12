# 19. Add Project column in Batch Search Result table

Date: 2022-05-03

## Status

Accepted

## Context

Multi project batch search has been previously implemented.
Consequently, filtering batch search results by project should be possible.
Furthermore, the project is needed for each result to access to the document with the document standalone component.

## Decision

In terms of data persistance and database we decided to modify the `BATCH_SEARCH_RESULT` table by adding the `PRJ_ID` column.
This field can be NULL in order to guarantee backward compatibility with existing data. 

## Consequences

The backend functions related to database operations will be modified
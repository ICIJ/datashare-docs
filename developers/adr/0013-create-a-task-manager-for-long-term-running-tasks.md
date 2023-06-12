# 13. Create a task manager for long term running tasks

Date: 2018-01-18

## Status

Accepted

## Context

Scanning and indexing new files can take a lot of time. When executing those tasks the datashare UI should execute them asynchronously (in background) and provide progress status.

## Decision

Datashare backend will implement a task manager with a REST API.

Datashare frontend will poll the status updated in HTTP.

## Consequences

Backend will need to execute tasks in independent threads.
Frontend will handle the polling start and stop for each task.
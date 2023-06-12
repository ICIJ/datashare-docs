# 15. Create batch download daemon

Date: 2021-06-30

## Status

Accepted

## Context

Journalists want to download search results as an archive.
This archive can be encrypted.

## Decision

We will use zip archive format.
We will use zip password protection for encryption.

As for batch search, to avoid overloading backend HTTP server, we will run the batch download task in another daemon process.
To avoid a heavy implementation with database and a specific resource end point Java class (as batch searches), we will use the existing TaskManager.

We will make a Redis version of the task manager to transmit the state of the batch download tasks. 

## Consequences

We need to implement a remote task execution mechanism.
The backend server remains the master of configuration parameters. That means specific batch parameters should be sent to the batch download daemon (e.g. is it encrypted or not?).
We tried to integrate with [Redisson remote task execution service](https://github.com/redisson/redisson/wiki/9.-Distributed-services) but failed for now.
In the future we could conciliate the batch search and batch download processing.
---
title: ASR prerequisites
---

## Datashare version

Use Datashare version `21.0.0` or later.

## Temporal

The ASR workers use [Temporal](https://temporal.io/) for task orchestration. Run a Temporal server that Datashare and every worker can reach. Start Datashare with:

```
--batchQueueType TEMPORAL --messageBusAddress temporal:7233
```

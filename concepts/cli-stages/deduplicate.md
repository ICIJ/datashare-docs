---
description: >-
  The DEDUPLICATE stage filters paths that appear more than once in the queue
  during a run.
---

# DEDUPLICATE

DEDUPLICATE sits between two stages. It drains its input queue, forwards each path to the next stage, and drops any path it has already seen during this run.

```bash
datashare stage run \
  --stages SCAN,DEDUPLICATE,INDEX \
  --defaultProject my-project \
  --dataDir /path/to/documents \
  --elasticsearchAddress http://elasticsearch:9200 \
  --queueType REDIS \
  --redisAddress redis://redis:6379
```

## Input and output

| | |
| --- | --- |
| Reads | `<queueName>:deduplicate` |
| Writes | the queue of the next stage, by default `extract:queue:index` |
| Distributable | **No.** Each copy keeps its own memory of what it has seen, so two copies do not deduplicate against each other |

## Options that affect it

| Option | Default | Effect |
| ------ | ------- | ------ |
| `--queueName` | `extract:queue` | Base name of the queues it reads and writes. |
| `--queueType` | `MEMORY` | Queue backend. |

It has no options of its own.

## Execution details

* **It deduplicates paths, not content.** Two copies of the same file at two different paths both go through, and both are indexed. That is not a problem: document ids are content hashes, so they end up as one document with two paths.
* **Its memory of seen paths is per run and in memory.** It is a set of paths held by the process, so it grows with the number of distinct files in the run and disappears when the process exits. On a corpus of tens of millions of files, this is worth keeping in mind.
* **It is a filter, not a gate.** It forwards entries as it reads them, so the stage after it starts working immediately rather than waiting for the whole queue to be filtered.
* **It counts what it dropped**, logging `removed N duplicate paths in inputQueue ...` when it finishes.

## When it is worth adding

Most runs do not need it. It earns its place when the same path can legitimately reach the queue twice:

* a `SCAN` that was interrupted and restarted, so part of the tree was enqueued twice;
* two `--dataDir` runs whose directories overlap;
* a queue that was not cleared between runs.

The alternative in the first case is the INDEX report map, which skips the duplicate at extraction time rather than at queue time. DEDUPLICATE is cheaper because the path never reaches an extraction thread, but it only knows about the current run.

## See also

* [SCAN](scan.md) upstream, [INDEX](index.md) downstream.
* [INDEX's report map](index.md#the-report-map), which handles duplicates across runs.

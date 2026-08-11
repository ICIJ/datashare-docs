---
description: The SCAN stage walks a directory and queues every file it finds.
---

# SCAN

The entry point of the pipeline. SCAN walks `--dataDir` and pushes the **path** of every file it finds onto the queue of the next stage. It reads no content and touches neither Elasticsearch nor the database.

```bash
datashare stage run \
  --stages SCAN \
  --dataDir /path/to/documents \
  --queueType REDIS \
  --redisAddress redis://redis:6379
```

## Input and output

| | |
| --- | --- |
| Reads | the filesystem, under `--dataDir` |
| Writes | `<queueName>:<next stage>`, by default `extract:queue:index` |
| Distributable | **No.** Run it on exactly one machine |

## Options that affect it

| Option | Default | Effect |
| ------ | ------- | ------ |
| `-d, --dataDir` | `~/Datashare` | The directory to walk. In Docker, the path inside the container. |
| `--followSymlinks` | `true` | Follow symbolic links and queue their targets. |
| `--queueName` | `extract:queue` | Base name of the queue written to. |
| `--queueType` | `MEMORY` | `REDIS` to make the queue outlive the process and be readable by other machines. |
| `--queueCapacity` | `1000000` | Size of an in-memory queue. Ignored with Redis. |

That is the whole list. The scanner has no option to filter by name, type or depth: what you point `--dataDir` at is what gets queued.

## Execution details

* **The walk is single-threaded and I/O bound.** `--parallelism` has no effect on it. On network storage it is usually the slowest non-indexing part of a run, and it is the reason SCAN and INDEX are worth splitting on a large corpus.
* **It queues paths, not content.** A file that is moved or deleted between the scan and the extraction fails at the INDEX stage, not here.
* **Everything is scanned**, including hidden files and operating-system leftovers such as `.DS_Store` and `Thumbs.db`. To index a subset, point `--dataDir` at a subdirectory or stage the files you want into their own directory. See [scenario 6](../../server-mode/indexing/scenarios.md#scenario-6-index-only-part-of-a-corpus).
* **Selecting a directory does not reach inside containers.** A ZIP outside your `--dataDir` is not opened, so the PDFs inside it are missed too.
* **Symlinks are followed by default.** With `--followSymlinks false` they are skipped entirely rather than indexed as files. A symlink loop is detected by the walker, logged, and does not stop the scan.
* **Unreadable files and directories are logged and skipped.** A permission error on one subtree does not abort the walk.
* **A full queue blocks the scan.** With an in-memory queue, when `--queueCapacity` is reached the scanner waits for a slot, logs a warning, and keeps retrying. Raise `--queueCapacity`, or use a Redis queue, if you see those warnings.

## Failure and restart

SCAN keeps no record of what it has already queued: the report map belongs to [INDEX](index.md). Restarting a scan re-walks the whole tree and re-enqueues everything.

That is harmless in the common case, because INDEX skips paths its report map already records as done. If you would rather not queue the same path twice at all, insert [DEDUPLICATE](deduplicate.md) between the two stages.

Running SCAN twice **in parallel** simply enqueues everything twice. It is a producer, not a consumer, so there is no work-splitting to gain.

## Monitoring

The scan logs `Entering directory: "..."` at INFO level as it descends, and the number of queued paths when it finishes. To see what it produced before spending CPU on extraction:

```bash
redis-cli -h redis LLEN extract:queue:index
redis-cli -h redis LRANGE extract:queue:index 0 20
```

## See also

* [INDEX](index.md), the stage that consumes what SCAN produces.
* [SCANIDX](scanidx.md), to avoid reprocessing files that are already indexed.
* [Indexing scenarios](../../server-mode/indexing/scenarios.md) for complete workflows.

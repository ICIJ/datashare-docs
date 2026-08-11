---
description: >-
  Copy-paste recipes for the indexing situations you will actually meet on a
  server: first pass, incremental updates, resume, distribution and backfills.
---

# Indexing scenarios

Every command below is written twice where it matters: once for a Docker Compose deployment, once for a package install (`.deb`, or the jar behind the `datashare` launcher). Pick the one that matches your setup and adapt the service name, the project name and the paths.

{% hint style="info" %}
In Docker, `docker compose exec datashare /entrypoint.sh ...` starts a second process **inside your running web container**, competing with it for CPU. For anything longer than a few minutes, prefer `docker compose run --rm datashare ...`, which starts a dedicated throwaway container. Add `-d` to detach it, or run it under `screen`, `tmux` or a systemd unit so that closing your SSH session does not kill the indexing.
{% endhint %}

## Scenario 1: a first pass on a new corpus

You have files on the server and an empty project. Start with a **subset**, check the result, then run the whole thing.

```bash
datashare stage run \
  --stages SCAN,INDEX \
  --defaultProject my-project \
  --dataDir /data/documents/sample \
  --elasticsearchAddress http://elasticsearch:9200 \
  --reportName "report:my-project" \
  --queueType REDIS \
  --redisAddress redis://redis:6379 \
  --ocr false
```

In Docker Compose:

```bash
docker compose run --rm datashare stage run \
  --stages SCAN,INDEX \
  --defaultProject my-project \
  --dataDir /home/datashare/data/sample \
  --elasticsearchAddress http://elasticsearch:9200 \
  --reportName "report:my-project" \
  --queueType REDIS \
  --redisAddress redis://redis:6379 \
  --ocr false
```

What each part does:

* `--stages SCAN,INDEX` runs both stages in the same command. SCAN keeps filling the queue while INDEX drains it, so the two overlap.
* `--dataDir` is the directory Datashare walks. In Docker this is the path **inside the container**, so it must be under the volume you mounted.
* `--reportName` records the outcome of every file, which makes the run resumable. Use one name per project.
* `--queueType REDIS` puts the queue in Redis instead of memory, so the run survives the process and can be inspected and distributed.
* `--ocr false` turns OCR off for this first pass. Turn it on once you know whether your corpus needs it.

Then check what you got:

```bash
# How many documents (the index also holds named entities, hence the filter)
curl -s 'http://elasticsearch:9200/my-project/_count' \
  -H 'Content-Type: application/json' \
  -d '{"query":{"term":{"type":"Document"}}}' | jq .count

# Which file types came out of it
curl -s 'http://elasticsearch:9200/my-project/_search?size=0' \
  -H 'Content-Type: application/json' -d '{
    "aggs": {"types": {"terms": {"field": "contentType", "size": 20}}}
  }' | jq '.aggregations.types.buckets'
```

If the count is far higher than your file count, that is normal: archives and mailboxes expand into many documents. If a document type you expected is missing, look at [Troubleshooting](troubleshooting.md).

When you are happy with the settings, run the same command against the full `--dataDir`.

## Scenario 2: scan first, index later

Splitting the two stages lets you see exactly what will be processed before spending any CPU on it, and it is the prerequisite for distributing the work.

Scan only:

```bash
datashare stage run \
  --stages SCAN \
  --defaultProject my-project \
  --dataDir /data/documents \
  --queueType REDIS \
  --redisAddress redis://redis:6379
```

The SCAN stage writes to the queue of the **next** stage, so with the default queue name the paths land in `extract:queue:index`. Inspect it:

```bash
redis-cli -h redis LLEN extract:queue:index
redis-cli -h redis LRANGE extract:queue:index 0 20
```

Index when you are ready, from the same or from another machine:

```bash
datashare stage run \
  --stages INDEX \
  --defaultProject my-project \
  --dataDir /data/documents \
  --elasticsearchAddress http://elasticsearch:9200 \
  --reportName "report:my-project" \
  --queueType REDIS \
  --redisAddress redis://redis:6379
```

{% hint style="warning" %}
Queue names are derived as `<queueName>:<stage>`. If you pass `--queueName my-queue` to SCAN, you must pass the same `--queueName my-queue` to INDEX, which will read from `my-queue:index`. A mismatch produces an INDEX run that finds an empty queue and exits immediately having done nothing.
{% endhint %}

An INDEX stage run **on its own** stops the first time it finds the queue empty. That is what you want when SCAN has already finished. It also means you should not start INDEX alone while SCAN is still running from another terminal: use one command with both stages for that, or keep INDEX running under a supervisor that restarts it.

If a path can end up in the queue twice, for example because an earlier scan was interrupted and restarted, insert the `DEDUPLICATE` stage between the two:

```bash
datashare stage run \
  --stages SCAN,DEDUPLICATE,INDEX \
  --defaultProject my-project \
  --dataDir /data/documents \
  --elasticsearchAddress http://elasticsearch:9200 \
  --reportName "report:my-project" \
  --queueType REDIS \
  --redisAddress redis://redis:6379
```

It filters duplicate **paths** within the run. Duplicate content is already handled without it: document ids are content hashes, so the same file indexed twice is one document.

## Scenario 3: add new files without reprocessing the old ones

Your corpus grew. You want the new files indexed and the old ones left alone.

The report map is what makes this cheap. The `SCANIDX` stage reads the paths already present in the index and marks them as done in the report map. The `INDEX` stage then skips every path recorded there.

**Step 1**, populate the report map from the index:

```bash
datashare stage run \
  --stages SCANIDX \
  --defaultProject my-project \
  --elasticsearchAddress http://elasticsearch:9200 \
  --reportName "report:my-project" \
  --queueType REDIS \
  --redisAddress redis://redis:6379
```

**Step 2**, scan and index the whole directory again, with the same report name:

```bash
datashare stage run \
  --stages SCAN,INDEX \
  --defaultProject my-project \
  --dataDir /data/documents \
  --elasticsearchAddress http://elasticsearch:9200 \
  --reportName "report:my-project" \
  --queueType REDIS \
  --redisAddress redis://redis:6379
```

SCAN enqueues everything, including the old files, but INDEX skips any path with a recorded success, so only the new files are actually extracted. Enqueuing a path is cheap, extracting it is not.

If you kept the report map from your **previous** indexing run, you can skip step 1 entirely: the map already holds every successful path.

## Scenario 4: resume an interrupted run

Indexing a large corpus takes days, and something will interrupt it: a reboot, an out-of-memory kill, a `Ctrl+C`.

If you ran with `--queueType REDIS` and `--reportName`, resuming is just running the same command again:

* the queue still holds every path that was never popped;
* the report map holds every path that completed, so those are skipped.

Three details worth knowing:

* **Only successes and permanently poisoned files are skipped.** A file recorded as a plain failure (Elasticsearch was briefly unreachable, a worker got interrupted) is retried on the next run. A file recorded as a parse timeout or as a fatal error is not, because retrying it would spend the same hours or crash the same way. To force a retry of those, use a fresh report name.
* **Files in flight at the moment of the interruption are lost.** They were removed from the queue and never recorded. There are as many of them as you had parser threads. See [find what is missing](#find-what-is-missing).
* **A restart inside a very large container file restarts that file from the beginning.** The report map records whole files, not positions inside them. If a 40 GB mailbox was 90% done, that 90% is re-extracted. Documents already written are simply overwritten with the same ids, so this costs time, not correctness.

## Scenario 5: distribute indexing across several machines

The `INDEX` stage pulls from a shared blocking queue, so several machines can drain the same queue at the same time with no coordination and no risk of double work.

The requirements are a **shared Redis** and a **shared Elasticsearch**, both reachable from every worker, plus **the same files at the same path** on every worker (a shared NFS mount, or an identical copy).

On one machine, scan:

```bash
datashare stage run --stages SCAN \
  --defaultProject my-project \
  --dataDir /data/documents \
  --queueType REDIS --redisAddress redis://shared-redis:6379
```

On each worker machine, run the same INDEX command:

```bash
datashare stage run --stages INDEX \
  --defaultProject my-project \
  --dataDir /data/documents \
  --elasticsearchAddress http://shared-es:9200 \
  --reportName "report:my-project" \
  --queueType REDIS --redisAddress redis://shared-redis:6379 \
  --parallelism 16
```

Notes:

* **SCAN cannot be distributed.** Run it on exactly one machine. Running it twice just enqueues everything twice.
* **INDEX and NLP are idempotent.** A document indexed twice produces the same id and the same content, so an overlap between workers is harmless.
* All workers must use the same `--defaultProject`, `--queueName` and `--digestAlgorithm`, otherwise they will not agree on document ids or on which queue to read.
* Elasticsearch becomes the bottleneck before the workers do, past a handful of machines. See [Tuning](tuning.md#elasticsearch).

## Scenario 6: index only part of a corpus

**`--dataDir` is the only filter Datashare gives you.** Point it at a subdirectory and nothing outside it is touched:

```bash
datashare stage run \
  --stages SCAN,INDEX \
  --defaultProject my-project \
  --dataDir /data/documents/accounting \
  --elasticsearchAddress http://elasticsearch:9200 \
  --reportName "report:my-project" \
  --queueType REDIS --redisAddress redis://redis:6379
```

Run it once per directory you want, keeping the same project and report map, and the results accumulate in one index.

There is **no option to filter by file type or name**, and the scanner takes everything it finds, including hidden files and operating-system leftovers such as `.DS_Store` and `Thumbs.db`.

To index a selection that does not match a directory boundary, build the selection on disk and point `--dataDir` at it. Symbolic links work, because `--followSymlinks` defaults to `true`:

```bash
mkdir -p /data/selection
find /data/documents -name '*.pdf' -exec ln -s {} /data/selection/ \;

datashare stage run --stages SCAN,INDEX \
  --defaultProject my-project \
  --dataDir /data/selection \
  --elasticsearchAddress http://elasticsearch:9200
```

{% hint style="info" %}
The path stored in the index is the one Datashare walked, so with the approach above documents are recorded under `/data/selection/...` rather than their original location. Copy or hard-link instead of symlinking if the original path matters to you.
{% endhint %}

{% hint style="warning" %}
Filtering by directory does not reach inside containers. Excluding a ZIP excludes everything in it, and selecting only PDFs misses every PDF that lives **inside** an archive or a mailbox, because the container itself was never selected and so was never opened.
{% endhint %}

## Scenario 7: extract named entities after indexing

Named entity recognition is a separate stage over documents that are already in the index, so you can run it days later, on another machine, or on a subset.

For documents that have never been processed by the given pipeline:

```bash
datashare stage run \
  --stages ENQUEUEIDX,NLP \
  --defaultProject my-project \
  --nlpPipeline CORENLP \
  --elasticsearchAddress http://elasticsearch:9200 \
  --queueType REDIS --redisAddress redis://redis:6379
```

`ENQUEUEIDX` scrolls the index for documents not yet tagged with that pipeline and enqueues their ids. `NLP` drains the queue, extracts entities and tags each document with the pipeline that processed it. That tagging makes the whole thing idempotent and resumable: rerun the command and it picks up where it stopped.

To restrict the run, pass a query with `--searchQuery`. Two forms are accepted: the same query syntax as the Datashare search bar, or a raw Elasticsearch query clause in JSON.

```bash
# Datashare query syntax
datashare stage run --stages ENQUEUEIDX,NLP \
  --defaultProject my-project \
  --searchQuery 'language:FRENCH' \
  --nlpPipeline CORENLP \
  --elasticsearchAddress http://elasticsearch:9200 \
  --queueType REDIS --redisAddress redis://redis:6379

# Raw Elasticsearch clause: the JSON is used as the "must" clause of a bool
# query, so pass the clause itself, not a full {"query": ...} body
datashare stage run --stages ENQUEUEIDX,NLP \
  --defaultProject my-project \
  --searchQuery '{"term":{"language":"FRENCH"}}' \
  --nlpPipeline CORENLP \
  --elasticsearchAddress http://elasticsearch:9200 \
  --queueType REDIS --redisAddress redis://redis:6379
```

Available pipelines are `CORENLP` (the default, best coverage), `OPENNLP`, `EMAIL` (extracts email addresses only, and it is very cheap) and `SPACY` (requires the Python worker extension).

NER holds language models in memory. Give the process more heap than an INDEX run, and see [Tuning](tuning.md#named-entity-extraction) for the parallelism settings.

### Batched extraction with the Python worker

The `SPACY` pipeline processes documents in batches rather than one at a time, so it uses a different stage. `CREATENLPBATCHESFROMIDX` scrolls the index, groups documents by language, and submits one extraction task per batch:

```bash
datashare stage run \
  --stages CREATENLPBATCHESFROMIDX \
  --defaultProject my-project \
  --nlpPipeline SPACY \
  --batchSize 1024 \
  --elasticsearchAddress http://elasticsearch:9200 \
  --queueType REDIS --redisAddress redis://redis:6379
```

The batches are **tasks**, not queue entries, so a worker has to execute them. Start one alongside, pointed at the same Redis:

```bash
datashare worker run --busType REDIS --redisAddress redis://redis:6379
```

The stage command returns as soon as the batches are submitted, so follow the tasks rather than the command to know when the work is done. `BATCHNLP` appears in the stage list but has no command-line implementation: passing it to `--stages` logs `no task class for stage BATCHNLP, skipping it`.

Use this only with a batch-capable pipeline. For `CORENLP` and `OPENNLP`, `ENQUEUEIDX,NLP` above is the right form, and the two are mutually exclusive: `NLP` and `CREATENLPBATCHESFROMIDX` in the same `--stages` is rejected.

## Scenario 8: mail archives (PST, OST, MBOX)

Mailboxes are the corpus type most likely to surprise you.

* One mailbox file is **one queue entry**. Recent versions walk its folders in parallel and OCR its attachments in parallel, but a mailbox with everything in one giant folder still behaves like a single work unit. See [Tuning](tuning.md#mail-heavy-corpora).
* One mailbox produces **hundreds of thousands of documents**: one per message, one per attachment.
* Attachments are frequently scanned images, so a mail corpus is usually an OCR corpus, whether you planned for it or not.
* If you have the disk space, splitting large mailboxes into individual messages before indexing gives you more parallelism, a resumable unit that is small, and better failure isolation:

```bash
# -e writes one .eml file per message, -D includes deleted items
readpst -e -D -o /data/documents/mailboxes-split archive.pst
```

Expect the split output to take roughly as much disk space as the original mailbox.

Index them with a generous parse timeout and a report map, and expect the run to be long. The timeout matters: it covers one mailbox **and everything inside it**, the default is 24 hours, and a file that hits it is recorded as a terminal failure that later runs will not retry.

```bash
datashare stage run \
  --stages SCAN,INDEX \
  --defaultProject my-project \
  --dataDir /data/documents/mailboxes \
  --elasticsearchAddress http://elasticsearch:9200 \
  --reportName "report:my-project" \
  --queueType REDIS --redisAddress redis://redis:6379 \
  --ocrLanguage eng+fra \
  --parseTimeout 48h
```

## Scenario 9: re-index a project from scratch

Sometimes the cleanest fix is to start over: you changed the OCR settings, or the digest algorithm, or you want to drop a corpus entirely.

```bash
# Removes the Elasticsearch index, the queues, the report map, the artifacts
# and the project's database rows. There is no undo.
datashare project delete my-project --yes
datashare project create my-project --label 'My Project'
```

Then run scenario 1 again. If you only want to drop the queue and the report map without touching the index:

```bash
redis-cli -h redis DEL extract:queue:index
redis-cli -h redis DEL report:my-project
```

## Scenario 10: backfills on an existing index

Two stages exist to enrich documents that are already indexed.

**Content type categories.** Documents indexed by an older version of Datashare may lack the `contentTypeCategory` field used by the file type filter:

```bash
datashare stage run --stages ENQUEUEIDX,CATEGORIZE \
  --defaultProject my-project \
  --elasticsearchAddress http://elasticsearch:9200 \
  --queueType REDIS --redisAddress redis://redis:6379
```

**Artifacts.** The `ARTIFACT` stage caches the payload of embedded documents on disk, so that previewing or downloading an attachment does not require re-opening and re-parsing its container. On a corpus of large mailboxes this is the difference between an instant preview and a two-minute wait:

```bash
datashare stage run --stages ENQUEUEIDX,ARTIFACT \
  --defaultProject my-project \
  --searchQuery 'extractionLevel:0' \
  --artifactDir /data/artifacts \
  --elasticsearchAddress http://elasticsearch:9200 \
  --queueType REDIS --redisAddress redis://redis:6379
```

The query selects root documents only, because each root's whole embedded tree is cached as a side effect of processing it. `--artifactDir` is mandatory for this stage. Artifacts are cached, so a second run skips what a manifest already covers unless you pass `--artifactsForce true`.

You can also produce the raw payload during indexing instead, by adding `--artifacts raw --artifactDir /data/artifacts` to your `SCAN,INDEX` command. That avoids a second full pass, at the cost of a slower and more disk-hungry INDEX stage.

## Find what is missing

After a long run with interruptions, compare what is on disk to what is in the index.

Count files on disk, then count root documents in the index:

```bash
find /data/documents -type f | wc -l

curl -s 'http://elasticsearch:9200/my-project/_count' \
  -H 'Content-Type: application/json' \
  -d '{"query":{"bool":{"must":[
        {"term":{"type":"Document"}},
        {"term":{"extractionLevel":0}}]}}}' | jq .count
```

Root documents (`extractionLevel: 0`) are the files that came from disk. Everything above that level is an embedded document: an attachment, an archive entry, an image inside a document.

The two numbers will not match exactly (files Datashare skipped, files that failed), but a large gap means something went wrong. The report map is a Redis hash keyed by path, so you can count and sample what it recorded:

```bash
redis-cli -h redis HLEN report:my-project
redis-cli -h redis HRANDFIELD report:my-project 10 WITHVALUES
```

Its values are serialized, so the log stays the readable source for failure details:

```bash
grep -a "could not be parsed\|Error while consuming file" datashare.log | sort -u
```

The safest reconciliation is to re-run the same `SCAN,INDEX` command with the same report map. Everything already successful is skipped, so the cost is proportional to what is actually missing, and retryable failures get another chance.

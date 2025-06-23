---
description: >-
  Datashare Playground delivers a collection of Bash scripts (free of external
  dependencies) that streamline interaction with a Datashare instance’s
  Elasticsearch index and Redis queue.
---

# Script with Playground

From cloning or replacing whole indices and reindexing specific directories, to adjusting replica settings, monitoring or cancelling long-running tasks, and queuing files for processing, Playground implements each capability through intuitive shell scripts organized under the `elasticsearch/` and `redis/` directories.

To get started, set `ELASTICSEARCH_URL` and `REDIS_URL` in your environment (or add them to a `.env` file at the repo root).  For a comprehensive guide to script options, directory layout, and example workflows, see the full documentation on Github:

{% embed url="https://github.com/ICIJ/datashare-playground/" %}

## Use playground to update index's mappings and settings

Some Datashare updates can bring some fixes and improvements on the index. The index has to be reindexed accordingly.&#x20;

**1. Create a temporary empty index and specify the desired Datashare version number:**

```bash
./elasticsearch/index/create.sh <temporary_index> <ds_version_number>
```

**2. Reindex all documents (under "/" path) from the original index under a temporary one:**

This step can take some time if your index has plenty of documents.

```bash
./elasticsearch/documents/reindex.sh <original_index> <temporary_index> /
```

**3. Replace the old index by the new one:**

```bash
./elasticsearch/index/replace.sh <temporary_index> <original_index>
```

#### 4. Delete the temporary index:

```bash
./elasticsearch/index/delete.sh <temporary_index>
```

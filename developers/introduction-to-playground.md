# Index operations with Playground

[Datashare Playground](https://github.com/ICIJ/datashare-playground) is a set of batch scripts to interact Datashare's ElasticSearch index.



## Use playground to update index's mappings and settings

Some Datashare updates can bring some fixes and improvements on the index, the index has to be reindexed accordingly.&#x20;



**1. Create a temporary empty index and specify the desired Datashare version number:**

```bash
./elasticsearch/index/create.sh <temporary_index> <ds_version_number>
```

**2. Reindex all documents (under "/" path) from the original index under to temporary one:**

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

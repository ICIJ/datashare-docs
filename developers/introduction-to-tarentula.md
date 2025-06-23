---
description: >-
  Datashare Tarentula is a powerful command-line toolbelt designed to streamline
  bulk operations against any Datashare instance.
---

# CLI with Tarentula

Whether you need to count indexed files, download large datasets, batch-tag records, or run complex Elasticsearch aggregations, Tarentula provides a consistent, scriptable interface with flexible query support, and Docker compatibility.

It also exposes a Python API for embedding automated workflows directly into your data pipelines.\
With commands like `count`, `download`, `aggregate`, and `tagging-by-query`, you can handle millions of records in a single invocation, or integrate Tarentula into CI/CD pipelines for reproducible data tasks.

You can install Tarentula with your favorite package manager:

```
pip3 install --user tarentula
```

Or alternatively with Docker:

```
docker run icij/datashare-tarentula
```

For the complete list of commands, options, and example, read the documentation or Github:

{% embed url="https://github.com/ICIJ/datashare-tarentula" %}


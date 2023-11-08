---
description: Dummy authentication provider to disable authentication
---

# Dummy authentication

You can have a dummy authentication that always accepts basic auth. So you should see this popup:

![oauth](https://i.imgur.com/qec6c2k.jpg)

But then you can enter whatever user or password, it will enter datashare.

## Example

```
docker run -ti ICIJ/datashare -m SERVER \
  --dataDir /home/dev/data \
    --batchQueueType REDIS \
    --dataSourceUrl 'jdbc:postgresql://postgres/datashare?user=dstest&password=test'\
    --sessionStoreType REDIS \
    --authFilter org.icij.datashare.session.YesBasicAuthFilter

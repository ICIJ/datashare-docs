---
description: Dummy authentication provider to disable authentication
---

# Dummy

You can have a dummy authentication that always accepts basic auth. So you should see this popup:

<figure><img src="https://i.imgur.com/qec6c2k.jpg" alt="Screenshot of an &#x27;authentication required&#x27; window with username and password fields and &#x27;Cancel&#x27; and &#x27;OK&#x27; buttons"><figcaption><p>basic auth popup</p></figcaption></figure>

But then whatever user or password you type, it will enter Datashare.

## Example

```
docker run -ti ICIJ/datashare -m SERVER \
  --dataDir /home/dev/data \
    --batchQueueType REDIS \
    --dataSourceUrl 'jdbc:postgresql://postgres/datashare?user=dstest&password=test'\
    --sessionStoreType REDIS \
    --authFilter org.icij.datashare.session.YesBasicAuthFilter
```

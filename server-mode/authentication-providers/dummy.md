---
description: Dummy authentication provider that disables authentication.
---

# Dummy

{% hint style="danger" %}
**Local development only.** This filter accepts any username and password, so anyone who can reach Datashare can read every document. Never expose a Datashare instance using this filter to the network or the internet.
{% endhint %}

The dummy filter (`YesBasicAuthFilter`) shows the browser's native basic-auth popup, but any credentials are accepted:

<figure><img src="https://i.imgur.com/qec6c2k.jpg" alt="Screenshot of an &#x27;authentication required&#x27; window with username and password fields and &#x27;Cancel&#x27; and &#x27;OK&#x27; buttons"><figcaption><p>basic auth popup</p></figcaption></figure>

Whatever user or password you type will enter Datashare.

## Example

```
docker run -ti ICIJ/datashare -m SERVER \
    --dataDir /home/dev/data \
    --batchQueueType REDIS \
    --dataSourceUrl 'jdbc:postgresql://postgres/datashare?user=dstest&password=test' \
    --sessionStoreType REDIS \
    --authFilter org.icij.datashare.session.YesBasicAuthFilter
```

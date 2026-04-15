---
description: Basic authentication with Redis
---

# Basic with Redis

{% hint style="warning" %}
This filter is superseded by the [HTML form auth filter](form-auth.md), which offers a nicer login experience and supports sign-out. It is the recommended way to authenticate users backed by Redis. This page is kept for reference and existing deployments.
{% endhint %}

Basic authentication is a simple protocol that uses HTTP headers and the browser to authenticate users. User credentials are sent to the server in the `Authorization` header with `user:password` base64-encoded:

```
Authorization: Basic dXNlcjpwYXNzd29yZA==
```

It is only secure when the connection is encrypted, so always run Datashare behind TLS when using this filter.

## Provision users in Redis

Hash the password and build the user record as described in [Provisioning users](README.md#provisioning-users), then store the record under the user id:

```
$ redis-cli -h my.redis-server.org
redis-server.org:6379> set foo '{"uid":"foo", "password":"fcde2b2edba56bf408601fb721fe9b5c338d10ee429ea04fae5511b68fbf8fb9", "groups_by_applications":{"datashare":["local-datashare"]}}'
```

To grant access to additional indices, add them to `groups_by_applications.datashare` (keep `local-datashare` in the list). For example with `myindex`:

```
$ redis-cli -h my.redis-server.org
redis-server.org:6379> set foo '{"uid":"foo", "password":"fcde2b2edba56bf408601fb721fe9b5c338d10ee429ea04fae5511b68fbf8fb9", "groups_by_applications":{"datashare":["myindex","local-datashare"]}}'
```

## Login experience

When accessing Datashare, the browser prompts with its native basic-auth popup:

<figure><img src="https://i.imgur.com/qec6c2k.jpg" alt="Screenshot of an &#x27;authentication required&#x27; window with username and password fields and &#x27;Cancel&#x27; and &#x27;OK&#x27; buttons"><figcaption><p>basic auth popup</p></figcaption></figure>

There is no sign-out: users remain logged in until the browser is closed.

## Example

Launching Datashare with Docker and the basic-auth filter backed by Redis:

```
docker run -ti ICIJ/datashare --mode SERVER \
    --batchQueueType REDIS \
    --dataSourceUrl 'jdbc:postgresql://postgres/datashare?user=<username>&password=<password>' \
    --sessionStoreType REDIS \
    --authFilter org.icij.datashare.session.BasicAuthAdaptorFilter \
    --authUsersProvider org.icij.datashare.session.UsersInRedis
```

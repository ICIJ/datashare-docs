---
description: Basic authentication with Redis
---

# Basic with Redis

Basic authentication is a simple protocol that uses the HTTP headers and the browser to authenticate users. User credentials are sent to the server in the header `Authorization` with `user:password` base64 encoded:

```
Authorization: Basic dXNlcjpwYXNzd29yZA==
```
It is secure as long as the communication to the server is encrypted (with SSL for example).

On the server side, you have to provide a user store for Datashare. For now we are using a Redis data store.

So you have to provision users. The passwords are sha256 hex encoded (for example with bash):
```
$ echo -n bar | sha256sum
fcde2b2edba56bf408601fb721fe9b5c338d10ee429ea04fae5511b68fbf8fb9  -
```

Then insert the user like this in Redis:

```
$ redis-cli -h my.redis-server.org
redis-server.org:6379> set foo '{"uid":"foo", "password":"fcde2b2edba56bf408601fb721fe9b5c338d10ee429ea04fae5511b68fbf8fb9", "groups_by_applications":{"datashare":["local-datashare"]}}'
```

If you use other indices, you'll have to include them in the `group_by_applications`, but `local-datashare` should remain. For exammple if you use `myindex`:

```
$ redis-cli -h my.redis-server.org
redis-server.org:6379> set foo '{"uid":"foo", "password":"fcde2b2edba56bf408601fb721fe9b5c338d10ee429ea04fae5511b68fbf8fb9", "groups_by_applications":{"datashare":["myindex","local-datashare"]}}'
```

Then you should see this popup:

![oauth](https://i.imgur.com/qec6c2k.jpg)

## Example

Here is an example of launching Datashare with Docker and the 
basic auth provider filter backed in Redis:

```
docker run -ti ICIJ/datashare --mode SERVER \
    --batchQueueType REDIS \
    --dataSourceUrl 'jdbc:postgresql://postgres/datashare?user=<username>&password=<password>' \
    --sessionStoreType REDIS \
    --authFilter org.icij.datashare.session.BasicAuthAdaptorFilter \
    --authUsersProvider org.icij.datashare.session.UsersInRedis
```

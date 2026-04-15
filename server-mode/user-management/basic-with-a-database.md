---
description: Basic authentication with a database.
---

# Basic with a database

{% hint style="warning" %}
This filter is superseded by the [HTML form auth filter](form-auth.md), which offers a nicer login experience and supports sign-out. It is the recommended way to authenticate users backed by the database. This page is kept for reference and existing deployments.
{% endhint %}

Basic authentication is a simple protocol that uses HTTP headers and the browser to authenticate users. User credentials are sent to the server in the `Authorization` header with `user:password` base64-encoded:

```
Authorization: Basic dXNlcjpwYXNzd29yZA==
```

It is only secure when the connection is encrypted, so always run Datashare behind TLS when using this filter.

## Database setup

On the server side, you need to provide a database user inventory. Launching Datashare first with the full database URL will automatically migrate the schema. Datashare supports SQLite and PostgreSQL. **SQLite is not recommended** for multi-user servers because it cannot be multithreaded and will cause contention on user lookups.

## Provision users in PostgreSQL

Hash the password and build the user record as described in [Provisioning users](README.md#provisioning-users), then insert the row:

```
$ psql datashare
datashare=> insert into user_inventory (id, email, name, provider, details) values ('fbar', 'foo@bar.com', 'Foo Bar', 'my_company', '{"password": "fcde2b2edba56bf408601fb721fe9b5c338d10ee429ea04fae5511b68fbf8fb9", "groups_by_applications":{"datashare":["local-datashare"]}}');
```

To grant access to additional indices, add them to `groups_by_applications.datashare` (keep `local-datashare` in the list):

```
$ psql datashare
datashare=> insert into user_inventory (id, email, name, provider, details) values ('fbar', 'foo@bar.com', 'Foo Bar', 'my_company', '{"password": "fcde2b2edba56bf408601fb721fe9b5c338d10ee429ea04fae5511b68fbf8fb9", "groups_by_applications":{"datashare":["myindex", "local-datashare"]}}');
```

To create many users at once, use PostgreSQL's [`COPY` statement to import a CSV](https://stackoverflow.com/questions/2987433/how-to-import-csv-file-data-into-a-postgresql-table).

## Login experience

When accessing Datashare, the browser prompts with its native basic-auth popup:

<figure><img src="https://i.imgur.com/qec6c2k.jpg" alt="Screenshot of an &#x27;authentication required&#x27; window with username and password fields and &#x27;Cancel&#x27; and &#x27;OK&#x27; buttons"><figcaption><p>basic auth popup</p></figcaption></figure>

There is no sign-out: users remain logged in until the browser is closed.

## Example

Launching Datashare with Docker and the basic-auth filter backed by the database:

```
docker run -ti ICIJ/datashare --mode SERVER \
    --batchQueueType REDIS \
    --dataSourceUrl 'jdbc:postgresql://postgres/datashare?user=<username>&password=<password>' \
    --sessionStoreType REDIS \
    --authFilter org.icij.datashare.session.BasicAuthAdaptorFilter \
    --authUsersProvider org.icij.datashare.session.UsersInDb
```

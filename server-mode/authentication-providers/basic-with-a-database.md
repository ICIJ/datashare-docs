---
description: Basic authentication with a database.
---

# Basic authentication with a database

Basic authentication is a simple protocol that uses the HTTP headers and the browser to authenticate users. User credentials are sent to the server in the header `Authorization` with `user:password` base64 encoded:

```
Authorization: Basic dXNlcjpwYXNzd29yZA==
```
It is secure as long as the communication to the server is encrypted (with SSL for example).

On the server side, you have to provide a database user inventory. You can launch datashare first with the full database URL, then datashare will automatically migrate your database schema. Datashare supports SQLite and PostgreSQL as back-end databases. SQLite is not recommended for a multi-user server because it cannot be multithreaded, so it will introduce contention on users' DB SQL requests.

Then you have to provision users. The passwords are sha256 hex encoded (for example with bash):
```
$ echo -n bar | sha256sum
fcde2b2edba56bf408601fb721fe9b5c338d10ee429ea04fae5511b68fbf8fb9  -
```

Then you can insert the user like this in your database:

```
$ psql datashare
datashare=> insert into user_inventory (id, email, name, provider, details) values ('fbar', 'foo@bar.com', 'Foo Bar', 'my_company', '{"password": "fcde2b2edba56bf408601fb721fe9b5c338d10ee429ea04fae5511b68fbf8fb9", "groups_by_applications":{"datashare":["local-datashare"]}}');
```

If you use other indices, you'll have to include them in the `group_by_applications`, but `local-datashare` should remain. For exammple if you use `myindex`:

```
$ psql datashare
datashare=> insert into user_inventory (id, email, name, provider, details) values ('fbar', 'foo@bar.com', 'Foo Bar', 'my_company', '{"password": "fcde2b2edba56bf408601fb721fe9b5c338d10ee429ea04fae5511b68fbf8fb9", "groups_by_applications":{"datashare":["myindex", "local-datashare"]}}');
```

Or you can use [PostgreSQL import CSV](https://stackoverflow.com/questions/2987433/how-to-import-csv-file-data-into-a-postgresql-table) `COPY` statement if you want to create them all at once.

Then when accessing Datashare, you should see this popup:

![oauth](https://i.imgur.com/qec6c2k.jpg)

## Example

Here is an example of launching Datashare with Docker and the basic auth provider filter backed in database:

```
docker run -ti ICIJ/datashare --mode SERVER \
    --batchQueueType REDIS \
    --dataSourceUrl 'jdbc:postgresql://postgres/datashare?user=<username>&password=<password>' \
    --sessionStoreType REDIS \
    --authFilter org.icij.datashare.session.BasicAuthAdaptorFilter \
    --authUsersProvider org.icij.datashare.session.UsersInDb
```

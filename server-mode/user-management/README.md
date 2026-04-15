# Authentication providers

Authentication is the most important decision when deploying Datashare in **server mode**. It controls who can reach your documents, and changing it later usually means re-provisioning users.

## Choosing a provider

| Provider | User store | Sign-out | Best for |
| --- | --- | --- | --- |
| [OAuth2](oauth2.md) | External identity provider | Managed by IdP | Organizations that already run an IdP (KeyCloak, Okta, GitHub, etc.) |
| [HTML form](form-auth.md) | PostgreSQL or Redis | Yes | Self-managed deployments (**recommended** default) |
| [Basic with a database](basic-with-a-database.md) | PostgreSQL | No (browser-managed) | Legacy deployments already using it |
| [Basic with Redis](basic-with-redis.md) | Redis | No (browser-managed) | Legacy deployments already using it |
| [Dummy](dummy.md) | None, accepts anything | No | Local development only (**never expose to the network**) |

If you're starting from scratch and you don't have an identity provider, use the [HTML form](form-auth.md) filter. If you already run an IdP, use [OAuth2](oauth2.md).

{% hint style="warning" %}
All providers except OAuth2 send credentials to Datashare directly. **Always put Datashare behind TLS** (a reverse proxy terminating HTTPS, for example) so credentials and session cookies aren't exposed on the network.
{% endhint %}

## How it's configured

Two CLI flags select the authentication backend:

* `--authFilter`: the filter class that handles incoming requests (decides whether a request is authenticated, returns the challenge, and validates the session cookie).
* `--authUsersProvider`: the class that looks users up (by login or login+password). Only applies to filters that check credentials against a local store (form auth, basic auth). OAuth2 doesn't use it.

For example, to use the HTML form filter backed by a PostgreSQL user inventory:

```
--authFilter org.icij.datashare.session.FormAuthFilter \
--authUsersProvider org.icij.datashare.session.UsersInDb
```

## Provisioning users

Form auth and both basic auth providers share the same user record format. Only the storage location differs (PostgreSQL table vs. Redis key).

### Hash the password

Passwords are stored as `sha256` hex digests. With `bash`:

```
$ echo -n bar | sha256sum
fcde2b2edba56bf408601fb721fe9b5c338d10ee429ea04fae5511b68fbf8fb9  -
```

### User record fields

Each user is a JSON object with at least:

* `password`: the sha256 hex digest computed above.
* `groups_by_applications`: a map of application name to the list of indices (projects) the user can access. The `datashare` key is required, and `local-datashare` should usually stay in the list. Add any extra indices the user should see:

  ```json
  {
    "password": "fcde2b2edba56bf408601fb721fe9b5c338d10ee429ea04fae5511b68fbf8fb9",
    "groups_by_applications": {
      "datashare": ["local-datashare", "myindex"]
    }
  }
  ```

See the provider-specific pages for the storage command:

* [Basic with a database / HTML form backed by PostgreSQL](basic-with-a-database.md#provision-users-in-postgresql)
* [Basic with Redis / HTML form backed by Redis](basic-with-redis.md#provision-users-in-redis)

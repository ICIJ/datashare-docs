---
description: OAuth2 authentication with a third-party identity provider
---

# OAuth2

OAuth2 is the default authentication mode: if no `--authFilter` is provided in server mode, it is selected. With OAuth2 you delegate authentication to an external identity provider (IdP) such as KeyCloak, Okta, or GitHub. Datashare redirects unauthenticated users to the IdP, receives an authorization code, exchanges it for a token, then fetches the user profile.

<figure><img src="https://i.imgur.com/uHVXObS.png" alt="A diagram of a workflow"><figcaption><p>oauth</p></figcaption></figure>

## Configuration options

| Option | Required | Description |
| --- | --- | --- |
| `--oauthClientId` | Yes | OAuth2 client id registered with the IdP. |
| `--oauthClientSecret` | Yes | OAuth2 client secret. Also used as the default session signing key if `--sessionSigningKey` isn't set. |
| `--oauthAuthorizeUrl` | Yes | IdP endpoint that shows the login page and issues the authorization code. |
| `--oauthTokenUrl` | Yes | IdP endpoint that exchanges the code for an access token. |
| `--oauthApiUrl` | Yes | IdP endpoint that returns the authenticated user profile as JSON. |
| `--oauthCallbackPath` | Yes | Path inside Datashare that the IdP redirects back to (e.g. `/auth/callback`). Must match the redirect URI registered with the IdP. |
| `--oauthScope` | Sometimes | OAuth2 scopes to request. Required for OIDC providers (typically `openid email profile`). |
| `--oauthClaimIdAttribute` | No | Name of the field in the user JSON that contains the user id. Defaults to the IdP's standard. |
| `--oauthUserProjectsAttribute` | No | Name of the field in the user JSON that contains the list of projects the user can access. |
| `--oauthDefaultProject` | No | Project assigned to OAuth2 users when no project list is returned. |

## Expected user profile

`--oauthApiUrl` must return a JSON object identifying the user. At a minimum, it must contain the id attribute selected by `--oauthClaimIdAttribute` (or the IdP default). To grant project access from the IdP rather than from Datashare, include the field named by `--oauthUserProjectsAttribute` as a JSON array of index names. Otherwise users are assigned to `--oauthDefaultProject`.

## Example

```
docker run -ti ICIJ/datashare:version --mode SERVER \
    --oauthClientId 30045255030c6740ce4c95c \
    --oauthClientSecret 10af3d46399a8143179271e6b726aaf63f20604092106 \
    --oauthAuthorizeUrl https://my.oauth-server.org/oauth/authorize \
    --oauthTokenUrl https://my.oauth-server.org/oauth/token \
    --oauthApiUrl https://my.oauth-server.org/api/v1/me.json \
    --oauthCallbackPath /auth/callback
```

## Integration with KeyCloak

A small demo [repository](https://github.com/ICIJ/datashare-keycloak-integration) shows how to wire Datashare to a KeyCloak instance end-to-end.

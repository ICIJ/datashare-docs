---
description: OAuth2 authentication with a third-party id service
---

# OAuth2CookieFilter

This is the default authentication mode: if not provided in CLI it will be selected. With OAuth2 you will need a third-party authorization service. The diagram below describes the workflow:

![oauth](https://i.imgur.com/uHVXObS.png)

## Example

```
docker run -ti ICIJ/datashare:version --mode SERVER \
    --oauthClientId 30045255030c6740ce4c95c \
    --oauthClientSecret 10af3d46399a8143179271e6b726aaf63f20604092106 \
    --oauthAuthorizeUrl https://my.oauth-server.org/oauth/authorize \
    --oauthTokenUrl https://my.oauth-server.org/oauth/token \
    --oauthApiUrl https://my.oauth-server.org/api/v1/me.json \
    --oauthCallbackPath /auth/callback \
    --oauthScope=openid
```

## Integration with KeyCloak

We made a small demo [repository](https://github.com/ICIJ/datashare-keycloak-integration) to show how it could be setup.

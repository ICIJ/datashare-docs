---
description: 👷‍♀️ This page is currently being written by Datashare team.
---

# Authentication providers

Authentication with Datashare server is the most impacting choice that has to be made. It can be one of the followings:

* basic authentication with credentials stored in database (PostgreSQL)
* basic authentication with credentials stored in Redis
* oauth2 with credentials provided by an identity provider (KeyCloak for example)
* dummy basic auth to accept any user (⚠️ if the service is exposed to internet, it will leak your documents)

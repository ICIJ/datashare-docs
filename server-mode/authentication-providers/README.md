# Authentication providers

Authentication with Datashare in **server mode** is the most impacting choice that has to be made. It can be one of the followings:

* Basic authentication with credentials stored in database (PostgreSQL)
* Basic authentication with credentials stored in Redis
* OAuth2 with credentials provided by an identity provider (KeyCloak for example)
* Dummy basic auth to accept any user (⚠️ if the service is exposed to internet, it will leak your documents)

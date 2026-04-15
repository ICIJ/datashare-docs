---
description: >-
  Hierarchical RBAC authorization model based on Casbin (instance/domain/project
  scopes).
---

# Permission model

Datashare permissions are about **authorization**. They are separate from **authentication**.

The permission model is only available in **Server Mode.**

Authentication answers “who are you?”. Authorization answers “what can you do?”.

See [User management](user-management/) for login options.

### Model overview

Datashare permissions work with **hierarchical RBAC** using Casbin as permission enforcer engine.&#x20;

In practice, use a **scope string** that encodes the instance/domain/project hierarchy. Make it path-like, so you can match parents easily.

Request tuple:

* **Subject**: a user ID.
* **Domain** (scope): the organization for instance `(icij)`, current is `default`
* **Object**: a project name (`icij-leaks`, `banana-papers`, `icij-leaks`, …)
* **Action**: a role linked to operations (`INSTANCE_ADMIN`, `PROJECT_ADMIN`, `PROJECT_MEMBER`, …)

Example request:

```
enforce("alice", "icij", "banana-papers" "PROJECT_ADMIN")
enforce("bob", "default", "citrus-confidential" "PROJECT_MEMBER")
```

### Roles (instance → domain → project)

* `INSTANCE_ADMIN`
* `DOMAIN_ADMIN`
* `PROJECT_ADMIN`
* `PROJECT_EDITOR`
* `PROJECT_MEMBER`

Hierarchy:

```
instance_admin > domain_admin > project_admin > project_editor > project_member
```

### Mapping Datashare features to permissions

* `PROJECT_MEMBER`: read-only access inside a project
* `PROJECT_EDITOR`: project\_member + can change user-generated data (tags, recommendations, …)
* `PROJECT_ADMIN`: project\_editor + can manage the project (membership, settings)
* `DOMAIN_ADMIN`: project\_admin across all projects in a domain
* `INSTANCE_ADMIN`: domain\_admin across the whole instance

### How does it works inside Datashare?

Where policies live in production ? `CasbinRule` table&#x20;

How policies are updated:

* CLI : only to grant one INSTANCE\_ADMIN with grantAdminTask&#x20;
* API endpoints :
  * CRUD on all policies `/api/policies` (see the openapi schema).
  * Current user policies `/api/me/permissions`

The `Authorizer` is the singleton in charge of enforcing policies.

In the back-end code, we rely on Annotations (`@Policy` and `@TaskPolicy`)on top of web API endpoints to express the required role for a specific endpoint.

Tasks can be cross projects, so a user should be granted on each projects. A task can be either managed by another user with proper right or the owner(creator of the task). In the latest case, the owner should be granted access to the projects' task too

The convention when an endpoint manage multiple tasks, that only `DOMAIN_ADMIN` level user is allowed to manage them.

To secure policies changes we added guards so a user cannot grant or act on higher role than theirs .

### How to enroll users in the permission model ?

#### Migration

To ensures a smooth and incremental enrollment with the new system, each auth filters has an auto-enrolling system happening after a user logs in. On post login, it adds the user as `PROJECT_MEMBER` to each project the user is already allowed to access, if they are not enrolled yet.&#x20;

#### Creating the super user of the instance:

`GrantAdminPolicyTask` is a CLI task that allows creation of **one** `INSTANCE_USER` . The example below will grand `INSTANCE_ADMIN` role to the user `foo`  existing in the REDIS database.&#x20;

```
datashare --mode CLI \
--grantAdmin foo \
--defaultProject local-datashare \
--redisAddress redis://redis:6379 \
--authUsersProvider org.icij.datashare.session.UsersInRedis \
--dataSourceUrl "jdbc:postgresql://postgres/datashare?user=admin&password=admin"
```

### Casbin model (RBAC with hierarchical scopes)

This Casbin model supports instance, domain, and project scoping. It also supports wildcard matching on scopes, objects, and actions.

```
[request_definition]
r = sub, domain, obj, act

[policy_definition]
p = role, domain, obj, act

[role_definition]
g = _, _, _
g2 = _, _

[policy_effect]
e = some(where (p.eft == allow))

[matchers]
m = ( 
g(r.sub, p.role, r.domain + "::" + r.obj) 
|| g(r.sub, p.role, r.domain + "::*") 
|| g(r.sub, p.role,"*::*")
) 
&& keyMatch2(r.domain, p.domain) 
&& keyMatch2(r.obj, p.obj) 
&& (p.role == r.act || g2(p.role, r.act)
)
```

Notes:

* `g = _, _, _` means: subject has role **in a scope**.
* `g2 = _, _` means: roles are hierarchical.
* `keyMatch2(r.dom, p.dom)` lets a policy written at `foo::*` apply to `foo::bar`.

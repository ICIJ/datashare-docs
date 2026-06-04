---
description: >-
  Create and delete projects, and grant or revoke project roles, with the
  datashare project subcommands.
---

# Manage projects from the CLI

The `datashare project` subcommands let you manage projects and project permissions directly from the command line:

| Subcommand | Description |
| ---------- | ----------- |
| `project create` | Create a Datashare project |
| `project delete` | Delete a Datashare project (database, Elasticsearch index, queues, report map, artifacts) |
| `project grant` | Grant a role to a user on a project (replaces any existing role) |
| `project revoke` | Revoke all project roles for a user |

Run these commands with the same data-store settings as your server (`--dataSourceUrl`, `--elasticsearchAddress`, and `--redisAddress` if your deployment uses Redis) so they operate on the same projects.

## Create a project

```bash
datashare project create my-project
```

The project name can be passed as a positional argument (as above) or with `--name`. Useful options:

| Option | Description |
| ------ | ----------- |
| `--label` | Display label (default: name) |
| `--description` | Free-form description |
| `--source-path` | Filesystem source path (default: `/vault/<name>`) |
| `--source-url` | URL of the data origin |
| `--logo-url` | URL to the project logo |
| `--maintainer-name` | Maintainer display name |
| `--publisher-name` | Publisher display name |
| `--allow-from-mask` | IP mask for download access (default: `*.*.*.*`) |
| `--creator` | Grant `PROJECT_ADMIN` on the new project to this user (default: `defaultUserName` in LOCAL/EMBEDDED mode) |
| `--creation-date` | Creation timestamp (ISO-8601, e.g. `2026-05-15T10:00:00Z`). Defaults to now |
| `--no-index` | Skip Elasticsearch index creation |
| `--if-not-exists` | Idempotent: exit 0 if the project already exists |
| `--json` | Emit a JSON result on stdout |
| `--no-input` | Disable interactive prompts |

For example, to create a fully described project:

```bash
datashare project create my-project \
    --label 'My Project' \
    --description 'leak archive' \
    --source-path /data/my-project \
    --allow-from-mask 10.0.0.0
```

## Delete a project

```bash
datashare project delete my-project --yes
```

{% hint style="danger" %}
Deleting a project removes its database records, Elasticsearch index, queues, report map and artifacts. This cannot be undone. Without `--yes`, the command asks you to type the project name to confirm.
{% endhint %}

| Option | Description |
| ------ | ----------- |
| `--yes`, `-y` | Skip the typed-name confirmation |
| `--keep-index` | Do not drop the Elasticsearch index |
| `--if-exists` | Idempotent: exit 0 if the project doesn't exist |
| `--json` | Emit a JSON result on stdout |
| `--no-input` | Disable interactive prompts (implies `--yes`) |

## Grant a role

`project grant` assigns a role to a user on a project. It **replaces** any role the user already has on that project:

```bash
datashare project grant my-project alice admin
```

The arguments can be passed positionally (project, user, role) or with `--project`, `--user` and `--role`. The available roles map to the [permission model](permission-model.md) roles:

| CLI role | Permission model role |
| -------- | --------------------- |
| `admin` | `PROJECT_ADMIN` |
| `editor` | `PROJECT_EDITOR` |
| `member` | `PROJECT_MEMBER` |
| `visitor` | `PROJECT_VISITOR` |

Use `--if-not-exists` to exit 0 if the user already has the role, and `--json` / `--no-input` for scripting:

```bash
datashare project grant my-project alice editor --if-not-exists
datashare project grant my-project alice visitor --json --no-input
```

## Revoke roles

`project revoke` removes **all** roles a user has on a project (membership-level revoke):

```bash
datashare project revoke my-project alice
```

| Option | Description |
| ------ | ----------- |
| `--yes`, `-y` | Skip the y/N confirmation |
| `--if-exists` | Idempotent: exit 0 if the user has no role on the project |
| `--json` | Emit a JSON result on stdout |
| `--no-input` | Disable interactive prompts (implies `--yes`) |

## Scripting

All `project` subcommands are script-friendly: combine `--json` (machine-readable output), `--no-input` (no prompts) and the idempotency flags (`--if-not-exists` / `--if-exists`) to write provisioning scripts that can safely be re-run:

```bash
datashare project create my-project --no-index --if-not-exists --no-input --json
```

## Related pages

* [Permission model](permission-model.md) for what each role allows.
* [Manage users from the CLI](manage-users-from-the-cli.md) for creating the users you grant roles to.
* [Add documents from the CLI](add-documents-from-the-cli.md) for indexing documents into a project.

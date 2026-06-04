---
description: Create and delete Datashare users with the datashare user subcommands.
---

# Manage users from the CLI

The `datashare user` subcommands let you provision and remove users directly from the command line, without writing SQL or Redis commands by hand:

| Subcommand | Description |
| ---------- | ----------- |
| `user create` | Create a Datashare user |
| `user delete` | Delete a Datashare user and all their owned data |

Run these commands with the same data-store settings as your server (`--dataSourceUrl`, and `--redisAddress` if your deployment uses Redis) so they operate on the same user inventory.

## Create a user

```bash
datashare user create alice --email alice@example.org
```

The login can be passed as a positional argument (as above) or with `--login`. Useful options:

| Option | Description |
| ------ | ----------- |
| `--email` | RFC 5322 email address |
| `--name` | Display name (default: login) |
| `--password` | Password, for the `local` provider |
| `--provider` | `local`, `oauth` or `external` (default: `local`) |
| `--groups` | Comma-separated project names the user can access |
| `--if-not-exists` | Idempotent: exit 0 if the user already exists |
| `--json` | Emit a JSON result on stdout |
| `--no-input` | Disable interactive prompts |

For example, to create a local user with a password and access to two projects:

```bash
datashare user create alice \
    --email alice@example.org \
    --password "$PW" \
    --groups project1,project2
```

Or to provision a user authenticated by an external identity provider (see [OAuth2](user-management/oauth2.md)):

```bash
datashare user create alice --email alice@example.org --provider oauth --no-input
```

{% hint style="info" %}
Prefer passing the password through an environment variable (as in the example above) rather than typing it literally, so it doesn't end up in your shell history.
{% endhint %}

With Docker Compose, prefix the command with the web container's entrypoint:

```bash
docker compose exec datashare_web /entrypoint.sh \
  user create alice \
  --email alice@example.org \
  --dataSourceUrl 'jdbc:postgresql://postgres/datashare?user=<username>&password=<password>'
```

## Delete a user

```bash
datashare user delete alice --yes
```

{% hint style="danger" %}
Deleting a user removes the user **and all their owned data**. This cannot be undone.
{% endhint %}

| Option | Description |
| ------ | ----------- |
| `--yes`, `-y` | Skip the confirmation prompt |
| `--if-exists` | Idempotent: exit 0 if the user doesn't exist |
| `--json` | Emit a JSON result on stdout |
| `--no-input` | Disable interactive prompts (forces `--yes`) |

## Scripting

All `user` subcommands are script-friendly: combine `--json` (machine-readable output), `--no-input` (no prompts) and the idempotency flags (`--if-not-exists` / `--if-exists`) to write provisioning scripts that can safely be re-run:

```bash
datashare user create alice --email alice@example.org --if-not-exists --no-input --json
```

## Related pages

* [User management](user-management/README.md) for choosing an authentication method and the user record format.
* [Manage projects from the CLI](manage-projects-from-the-cli.md) for granting users a role on a project.

---
description: Complete reference of Datashare's command-line interface subcommands and global flags.
---

# CLI reference

Datashare's command-line interface is organized as subcommands. Run `datashare --help` for an overview, or `datashare COMMAND --help` for help on a specific subcommand.

Running `datashare` with no arguments is equivalent to `datashare app start` — it starts the web application in the default mode.

## Subcommands

| Subcommand | Description |
| ---------- | ----------- |
| `app start` | Start the Datashare web application server |
| `stage run` | Run one or more document processing pipeline stages |
| `worker run` | Start an async task worker daemon |
| `plugin list` | List available plugins |
| `plugin install <id>` | Install a plugin by id, URL, or file path |
| `plugin delete <id>` | Remove an installed plugin |
| `extension list` | List available extensions |
| `extension install <id>` | Install an extension by id, URL, or file path |
| `extension delete <id>` | Remove an installed extension |
| `api-key get` | Get the current user's API key |
| `api-key create` | Create an API key |
| `api-key delete` | Delete an API key |
| `user create` | Create a Datashare user |
| `user delete` | Delete a Datashare user and all their owned data |
| `project create` | Create a Datashare project |
| `project delete` | Delete a Datashare project (DB, ES index, queues, report map, artifacts) |
| `project grant` | Grant a role to a user on a project (replaces any existing role) |
| `project revoke` | Revoke all project roles for a user |

## `app start`

Start the Datashare web application. The default mode is `LOCAL` (single-user, embedded services). Running `datashare` with no arguments is a shorthand for `datashare app start`.

```bash
# Local mode (default)
datashare app start

# Server mode
datashare app start --mode SERVER \
  --elasticsearchAddress http://elasticsearch:9200 \
  --redisAddress redis://redis:6379

# Embedded mode (all services in one JVM)
datashare app start --mode EMBEDDED
```

## `stage run`

Run one or more document processing [stages](cli-stages.md). Requires `--stages`.

```bash
# Scan and index documents
datashare stage run --stages SCAN,INDEX \
  --dataDir /path/to/documents \
  --elasticsearchAddress http://elasticsearch:9200

# Extract named entities
datashare stage run --stages NLP \
  --nlpPipeline CORENLP \
  --elasticsearchAddress http://elasticsearch:9200

# Full pipeline
datashare stage run --stages SCAN,INDEX,NLP \
  --dataDir /path/to/documents \
  --elasticsearchAddress http://elasticsearch:9200
```

## `worker run`

Start an async task worker that processes background tasks (batch searches, batch downloads, indexing, NER extraction).

```bash
datashare worker run \
  --redisAddress redis://redis:6379 \
  --busType REDIS
```

## `plugin` and `extension`

```bash
# List available plugins
datashare plugin list

# Install a plugin
datashare plugin install datashare-plugin-ner-corenlp

# Remove a plugin
datashare plugin delete datashare-plugin-ner-corenlp

# List available extensions
datashare extension list

# Install an extension
datashare extension install datashare-extension-nlp-opennlp

# Remove an extension
datashare extension delete datashare-extension-nlp-opennlp
```

## `user`

Create and delete Datashare users. See [Manage users from the CLI](../server-mode/manage-users-from-the-cli.md) for details.

```bash
# Create a user
datashare user create alice --email alice@example.org

# Create a user with a password and project access
datashare user create alice --email alice@example.org --password $PW --groups p1,p2

# Delete a user and all their owned data
datashare user delete alice --yes
```

## `project`

Create and delete projects, and manage project permissions. See [Manage projects from the CLI](../server-mode/manage-projects-from-the-cli.md) for details.

```bash
# Create a project
datashare project create my-project --label 'My Project'

# Delete a project (DB, ES index, queues, report map, artifacts)
datashare project delete my-project --yes

# Grant a role to a user (admin, editor, member or visitor)
datashare project grant my-project alice admin

# Revoke all project roles for a user
datashare project revoke my-project alice
```

All `user` and `project` subcommands accept `--json` (machine-readable output), `--no-input` (disable prompts) and idempotency flags (`--if-not-exists` / `--if-exists`) for scripting.

## Global flags

These flags can be placed before any subcommand and apply to all subcommands.

| Flag | Default | Description |
| ---- | ------- | ----------- |
| `-d, --dataDir` | `~/Datashare` | Document source directory |
| `-P, --defaultProject` | `local-datashare` | Default project name |
| `-s, --settings` | `./dist/datashare.conf` | Path to settings file |
| `--logLevel` | `INFO` | Log level (`DEBUG`, `INFO`, `WARN`, `ERROR`) |
| `--elasticsearchAddress` | `http://localhost:9200` | Elasticsearch URL |
| `--redisAddress` | `redis://localhost:6379` | Redis URL |
| `--busType` | `MEMORY` | Data bus type (`MEMORY`, `REDIS`, `AMQP`) |
| `--queueType` | `MEMORY` | Queue type (`MEMORY`, `REDIS`, `AMQP`) |
| `--no-color` | — | Disable colored output |
| `-h, --help` | — | Show help and exit |
| `-V, --version` | — | Print version and exit |

## Backward compatibility

The legacy flag-based syntax (`--mode`, `--stage`, `-m CLI`, etc.) is still accepted for backward compatibility. New scripts should use the subcommand syntax.

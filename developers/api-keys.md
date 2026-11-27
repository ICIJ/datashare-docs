---
description: >-
  An API key gives anyone who holds it your access to Datashare. Keep it out of
  your shell history and out of your AI assistant's config files.
---

# API keys

An API key lets a script or an AI assistant use Datashare in your name, with the same access as you. Datashare shows it only once, right after you create it from **Settings > API**. Treat it like a password: anyone who reads it can search, read and tag your documents.

The variable name used on this page, `DATASHARE_API_KEY`, is a convention. Any name works, as long as you use the same one everywhere.

## Keep it out of your shell history

Your shell writes every command you run to a history file (`~/.zsh_history`, `~/.bash_history`). A command that contains the key leaves the key in that file:

```bash
# Don't: the key ends up in your shell history
claude mcp add --transport http datashare https://<host>/api/mcp \
  --header "Authorization: Bearer 1a2b3c..."
```

Instead, have the shell ask for the key. `read -s` reads it without showing it on screen and without writing it to the history. This works in zsh and bash:

```bash
printf 'Datashare API key: ' && read -rs DATASHARE_API_KEY && echo
```

Paste the key when prompted, then press Enter. Commands you run afterwards in the same terminal can use `"$DATASHARE_API_KEY"`, and the history only keeps the variable name:

```bash
claude mcp add --transport http datashare https://<host>/api/mcp \
  --header "Authorization: Bearer $DATASHARE_API_KEY"
```

The variable disappears when you close the terminal. To remove it earlier, run `unset DATASHARE_API_KEY`.

{% hint style="warning" %}
This keeps the key out of your history, not out of your AI assistant's config. The command above still saves the key itself in Claude Code's config file. See [Keep it out of your AI assistant's config](#keep-it-out-of-your-ai-assistants-config) to avoid that.
{% endhint %}

## Store it in your system's keychain

Rather than pasting the key each time, store it once in the password store of your system, then load it when you need it.

### macOS

Store the key in the Keychain. `-w` placed last makes `security` prompt for the key instead of reading it from the command:

```bash
security add-generic-password -a "$USER" -s datashare-api-key -w
```

Load it into the variable:

```bash
export DATASHARE_API_KEY="$(security find-generic-password -a "$USER" -s datashare-api-key -w)"
```

### Linux

With a desktop keyring (GNOME Keyring, KWallet), `secret-tool` stores the key and prompts for it:

```bash
secret-tool store --label='Datashare API key' service datashare-api-key
```

Load it into the variable:

```bash
export DATASHARE_API_KEY="$(secret-tool lookup service datashare-api-key)"
```

{% hint style="info" %}
A password manager with a command-line tool works the same way: store the key in it, and load it into `DATASHARE_API_KEY` with the tool's read command.
{% endhint %}

## Keep it out of your AI assistant's config

MCP clients save the servers you add in a config file in your home directory. If the header holds the key, the file holds the key. Some clients can read the key from an environment variable instead, so the file only holds the variable name.

The client then reads the variable when it starts. Load `DATASHARE_API_KEY` (from the prompt or the keychain above) in the terminal where you start the client.

### Claude Code

Put the variable in **single quotes**, so the shell passes it as written and Claude Code stores `${DATASHARE_API_KEY}` instead of the key:

```bash
claude mcp add --transport http datashare https://<host>/api/mcp \
  --header 'Authorization: Bearer ${DATASHARE_API_KEY}'
```

Claude Code replaces `${DATASHARE_API_KEY}` with the value of the variable each time it connects. If the variable is not set, `claude mcp list` and `/mcp` show a warning naming it.

### Codex

In `~/.codex/config.toml`, use `bearer_token_env_var` instead of `http_headers`. Codex sends `Authorization: Bearer` followed by the value of the variable:

```toml
[mcp_servers.datashare]
url = "https://<host>/api/mcp"
bearer_token_env_var = "DATASHARE_API_KEY"
```

### Other clients

Check your client's documentation for environment variables in MCP server settings. If it has no such option, the key stays in its config file: make sure only you can read that file.

## See also

* [MCP](mcp.md): connect an AI assistant to Datashare.
* [API](backend/api.md): the full Datashare API.

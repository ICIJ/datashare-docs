---
description: >-
  Datashare runs an MCP server so AI assistants like Claude Code or Codex can
  search, read and tag your documents, with the same access as you.
---

# MCP

Datashare speaks the [Model Context Protocol](https://modelcontextprotocol.io) (MCP). Any MCP client that supports HTTP servers (Claude Code, Codex, Antigravity, ...) can connect to it and use Datashare as a set of tools: list your projects, search and read documents, tag them, and follow your tasks.

The server lives at `POST /api/mcp`, in both local and server modes. Each tool runs the same access checks as the matching API route, so the assistant sees exactly what you see, nothing more.

## Connect a client

### On your computer

In local mode, no key is needed. With Claude Code:

```bash
claude mcp add --transport http datashare http://localhost:8080/api/mcp
```

### On a server

In server mode, the client authenticates with an API key. Create one from **Settings > API** in Datashare, or with the CLI (see [CLI reference](../concepts/cli-reference.md)):

```bash
datashare api-key create <username>
```

Then add the server with Claude Code:

```bash
claude mcp add --transport http datashare https://<host>/api/mcp \
  --header "Authorization: Bearer <api key>"
```

{% hint style="info" %}
Other clients take the same two pieces of information: the URL of `/api/mcp` and, in server mode, an `Authorization: Bearer <api key>` header. Check your client's documentation for where to set them.
{% endhint %}

Once connected, ask in plain language, for instance: _"find documents about offshore companies in project my-project and summarize the first one"_.

## Tools

| Tool | What it does |
| --- | --- |
| `list_projects` | Lists the projects you can access |
| `search_documents` | Full-text search in the documents of one project |
| `get_document` | Reads a document's metadata, its tags and a slice of its extracted text |
| `list_tags` | Lists the tags in use in one project, most used first |
| `tag_documents` | Adds tags to documents |
| `untag_documents` | Removes tags from documents |
| `list_tasks` | Lists the tasks you can see |
| `stop_task` | Stops a running task |

The assistant picks the arguments itself. The details below help you understand what it can and cannot do.

### `list_projects`

Takes no argument.

### `search_documents`

| Argument | Required | Description |
| --- | --- | --- |
| `project` | yes | Project id |
| `query` | yes | Query in [Elasticsearch query string syntax](../usage/search-with-operators.md) |
| `size` | no | Number of hits, from 1 to 50. Default: 10 |
| `from` | no | Index of the first hit, for paging. Default: 0 |

Each hit comes with highlighted extracts of the content. The response gives the total number of matches, and tells whether that total is exact or a lower bound.

`from + size` cannot exceed 10,000: like in the interface, the assistant cannot page beyond the first 10,000 results (see [What should I do if I get more than 10,000 results?](../usage/faq/general/what-should-i-do-if-i-get-more-than-10-000-results.md)).

### `get_document`

| Argument | Required | Description |
| --- | --- | --- |
| `project` | yes | Project id |
| `id` | yes | Document id |
| `routing` | no | Root document id, for embedded documents |
| `offset` | no | First character of the text to read. Default: 0 |
| `limit` | no | Number of characters to read. Default: 10,000 |

`offset` and `limit` let the assistant read a large document piece by piece.

### `list_tags`

| Argument | Required | Description |
| --- | --- | --- |
| `project` | yes | Project id |
| `size` | no | Number of tags, from 1 to 500. Default: 50 |

Tags keep the casing they were stored with.

### `tag_documents` and `untag_documents`

| Argument | Required | Description |
| --- | --- | --- |
| `project` | yes | Project id |
| `tags` | yes | Tags to add or remove, up to 100. A tag added is at most 64 characters |
| `doc_ids` | one of the two | Ids of the documents, up to 10,000 |
| `query` | one of the two | Query selecting the documents, in the same syntax as `search_documents` |
| `confirmed` | no | Set on the second call of a query, once you agreed. Default: false |

Tags written by the assistant are attributed to you, as if you had added them from the interface.

Tag matching is case-sensitive: removing `invoice` does not remove a tag stored as `Invoice`. Use `list_tags` to see the exact labels.

**With `doc_ids`**, the tool writes in one call. A single call can write at most 100,000 document-tag pairs.

**With `query`**, the tool asks first:

1. The first call writes nothing. It reports how many documents match and what it would do.
2. The assistant shows you that count and asks whether to go ahead.
3. A second call, with the same arguments and `confirmed: true`, writes one batch of up to 10,000 documents.
4. If documents remain, the response says so and gives the query for the next batch. The assistant repeats until nothing is left.

This applies to every query, whatever its size, so you always see how many documents will change before they do.

### `list_tasks`

| Argument | Required | Description |
| --- | --- | --- |
| `name` | no | Case-insensitive pattern on the task name |
| `size` | no | Number of tasks, from 1 to 100. Default: 20 |
| `from` | no | Index of the first task, for paging. Default: 0 |

### `stop_task`

| Argument | Required | Description |
| --- | --- | --- |
| `taskId` | yes | Id of the task to stop |

In local mode, any task can be stopped. In server mode, the same rules as the API apply: you need the right role on the task's project, or to own the task.

## Security

* **Same access as you.** Every tool runs the access checks of the matching API route. In server mode, a client without a valid API key gets nothing.
* **API keys and CSRF.** Requests authenticated with an API key do not need a CSRF token, since they carry no cookie to forge. Requests using a browser session still need it.
* **Local mode.** MCP calls from your own computer do not need a CSRF token either. They must send `Content-Type: application/json` and target `localhost`, `127.0.0.1` or `[::1]`, so a web page you visit cannot call Datashare in your name.

## Limits

* Only tools are available. MCP resources, prompts and streaming (SSE) are not supported.
* Datashare does not generate the client configuration for you yet.

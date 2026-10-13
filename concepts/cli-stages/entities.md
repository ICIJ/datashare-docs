---
description: >-
  The ENTITIES stage turns the rows of a spreadsheet already indexed in a
  project into structured FollowTheMoney entities, following a mapping you
  write by hand.
---

# ENTITIES

ENTITIES reads a table that is already indexed in a project, and turns each row into entities: companies, people, and the relationships between them. A **mapping**, a small JSON file, says which column fills which property of which entity.

It reads CSV and TSV files, Excel and OpenDocument spreadsheets, Numbers files, JSON and JSON Lines files, and tables inside Word and HTML documents.

The entities are stored in the database, then copied into a `<project>.entities` index in Elasticsearch, next to the project's documents.

{% hint style="warning" %}
For now this stage only creates entities. Datashare has no way yet to search, browse or display the indexed entities.
{% endhint %}

```bash
datashare stage run \
  --stages ENTITIES \
  --defaultProject my-project \
  --mappingFile companies.json
```

## Input and output

| | |
| --- | --- |
| Reads | one indexed document of the project, and the mapping file |
| Writes | statements to the database, then the `<project>.entities` index in Elasticsearch |
| Distributable | **No.** One run reads one document from end to end |

## Options that affect it

| Option | Default | Effect |
| ------ | ------- | ------ |
| `-P, --defaultProject` | `local-datashare` | The project holding the document, the mapping and the entities. |
| `--mappingFile` | none, **required** | Path to the mapping file. The stage saves it in the project, then runs it. |

ENTITIES runs alone: listing another stage in the same `--stages` is an error.

## An example

Say the project holds this `companies.csv`, already indexed:

```
company_id,company_name,country,incorporated,director_id,director_name,role
C1,Acme Ltd,gb,03/02/2011,P1,Jane Doe,secretary
C2,Globex SA,fr,15/07/2018,P1,Jane Doe,director
```

This mapping creates one company per row, one person per director, and one directorship linking them:

```json
{
  "id": "companies-v1",
  "name": "Companies and their directors",
  "model": "ftm",
  "documentId": "<id of companies.csv in Datashare>",
  "entities": {
    "company": {
      "type": "Company",
      "keys": ["company_id"],
      "properties": {
        "name": { "columns": ["company_name"] },
        "jurisdiction": { "columns": ["country"] },
        "incorporationDate": { "columns": ["incorporated"], "dateFormat": "dd/MM/yyyy" }
      }
    },
    "director": {
      "type": "Person",
      "keys": ["director_id"],
      "properties": {
        "name": { "columns": ["director_name"] }
      }
    },
    "directorship": {
      "type": "Directorship",
      "keys": ["company_id", "director_id"],
      "properties": {
        "organization": { "entity": "company" },
        "director": { "entity": "director" },
        "role": { "columns": ["role"] }
      }
    }
  }
}
```

Jane Doe appears on two rows with the same `director_id`, so she becomes **one** person with two directorships.

## The mapping format

### Top level

| Field | Required | Meaning |
| ----- | -------- | ------- |
| `id` | yes | The mapping's id: a letter or digit, then letters, digits, `.`, `_` or `-`, 96 characters at most. |
| `name` | yes | A human-readable name. |
| `model` | yes | The data model the entities follow. Only `ftm` (FollowTheMoney) is supported for now, more models will be added later. |
| `documentId` | yes | The Datashare id of the table to read. |
| `rootId` | no | The id of the archive or email the table was extracted from, when it is an attachment. |
| `options` | no | How to read the table, see [Reading options](#reading-options). |
| `entities` | yes | The entities to create from each row, by alias. At least one. |

`projectId` and `userId` can be left out: Datashare fills them in. A file declaring another project is refused.

### Entities

Each key of `entities` is an alias of your choice (`company`, `director`...), used to link entities together.

| Field | Required | Meaning |
| ----- | -------- | ------- |
| `type` | yes | The FollowTheMoney schema, such as `Company`, `Person` or `Ownership`. |
| `keys` | yes | The columns that identify the entity. Can be empty, see below. |
| `keyLiteral` | no | A fixed text mixed into the identity, see below. |
| `properties` | yes | The properties to fill, by FollowTheMoney property name. At least one. |

**How identity works.** An entity's id is computed from its type and the values of its `keys` columns. The same values always give the same id, in any file and on any run, so rows sharing a key merge into one entity. With `"keys": []`, each row is its own entity instead.

Key values are compared without their column names, so two files naming the same identifier differently still meet. The flip side: two unrelated entities of the same type, keyed on columns whose values happen to collide, merge. Give them different `keyLiteral` values to keep them apart.

A row whose key cells are blank produces no entity for that alias.

### Properties

Each property is filled from **exactly one** of these:

| Field | Meaning |
| ----- | ------- |
| `columns` | One or more columns. Each non-empty cell becomes a separate value. |
| `literal` | The same fixed text on every row. |
| `entity` | The alias of another entity of the mapping, to link to it. |

Two more fields refine `columns`:

| Field | Meaning |
| ----- | ------- |
| `join` | Glues the cells of several columns into one value, with this separator. Needs at least two columns. |
| `dateFormat` | Converts dates written this way to ISO format, for example `dd/MM/yyyy`. A cell that does not match is kept as written. |

A link (`entity`) is checked against the model: `organization` on a `Directorship` must point at an `Organization` or one of its subtypes, such as `Company`.

### Reading options

All optional. Each one only applies to the formats it makes sense for.

| Field | Applies to | Meaning |
| ----- | ---------- | ------- |
| `delimiter` | CSV, TSV | The column separator. Defaults to `,`, or a tab for TSV. |
| `quote` | CSV, TSV | The quote character. |
| `charset` | CSV, TSV | The encoding, for example `ISO-8859-1`. Detected when left out. |
| `sheet` | Excel | The sheet to read, by name or by position. |
| `table` | OpenDocument, Numbers, Word, HTML | The table to read, by position, starting at 1. |
| `contentType` | all | Forces the format, when the detected one is wrong. |

The first row of a CSV or a sheet holds the column names.

## Execution details

* **The mapping is checked before anything is read.** An unknown type or property, a link to the wrong kind of entity, an unknown field or a bad date format stops the stage with a message naming the problem.
* **A misspelled column fails on the first row**, rather than importing every row as empty.
* **A mapping cannot be changed.** Saving another mapping under an existing id is refused. To change a mapping, give it a new id. Running the exact same file again is fine, so a failed run can be retried with the same command.
* **Re-running replaces.** A new run over the same document and sheet replaces what the previous run stored there. A run that fails or is cancelled leaves the previous result untouched.
* **Cells are cleaned** of surrounding whitespace and invisible characters, so a copy-pasted value matches its original.
* **The run logs what it skipped**: rows with blank keys, entities with nothing to store, and cells it could not read.

## From the API

The same thing is available over HTTP, in two calls:

1. Save the mapping: `PUT /api/<project>/extraction-mappings/<mappingId>` with the mapping as body. Needs the editor role on the project.
2. Run it: `POST /api/task/structuredEntityExtraction/<project>/<mappingId>`. Only the mapping's author or a project admin can run it. The response holds a task id to poll at `GET /api/task/<id>`.

## Not available yet

This is a first version. These are deliberately left out for now:

* **Extracting entities from free text** with regular expressions. Only tables are read.
* **Other data models**, such as Schema.org or Wikidata. Only FollowTheMoney is supported for now, more will be added later.
* **The Python `ingest-file` processing** used by Aleph.
* **Changes to how documents are indexed.** Tables inside PDFs, for instance, are not read.
* **A user interface.** Mappings are written by hand, and the entities they create cannot be explored in Datashare.

## See also

* [FollowTheMoney schemata](https://followthemoney.tech/explorer/schemata/), for the types and properties you can map to.

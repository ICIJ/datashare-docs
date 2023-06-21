## `api_key`

Column | Type | Nullable | Default
--- | --- | --- | ---
`id` | `character varying(96)` | `not null` | 
`user_id` | `character varying(96)` | `not null` | 
`creation_date` | `timestamp without time zone` | `not null` | 

### Constraints and indexes

* `api_key_pkey PRIMARY KEY, btree (id)`
* `api_key_user_id_key UNIQUE CONSTRAINT, btree (user_id)`

*****

## `batch_search`

Column | Type | Nullable | Default
--- | --- | --- | ---
`uuid` | `character(36)` | `not null` | 
`name` | `character varying(255)` |  | 
`description` | `character varying(4096)` |  | 
`user_id` | `character varying(96)` | `not null` | 
`batch_date` | `timestamp without time zone` | `not null` | 
`state` | `character varying(8)` | `not null` | 
`published` | `integer` | `not null` | `0`
`phrase_matches` | `integer` | `not null` | `0`
`fuzziness` | `integer` | `not null` | `0`
`file_types` | `text` |  | 
`paths` | `text` |  | 
`error_message` | `text` |  | 
`batch_results` | `integer` |  | `0`
`error_query` | `text` |  | 

### Constraints and indexes

* `batch_search_pkey PRIMARY KEY, btree (uuid)`
* `batch_search_date btree (batch_date)`
* `batch_search_published btree (published)`
* `batch_search_user_id btree (user_id)`

### Referenced by

* `batch_search_pkey PRIMARY KEY, btree (uuid)`
* `batch_search_date btree (batch_date)`
* `batch_search_published btree (published)`
* `batch_search_user_id btree (user_id)`
* `Referenced by:`
* `TABLE batch_search_project CONSTRAINT batch_search_project_batch_search_uuid_fk FOREIGN KEY (search_uuid) REFERENCES batch_search(uuid)`

*****

## `batch_search_project`

Column | Type | Nullable | Default
--- | --- | --- | ---
`search_uuid` | `character(36)` | `not null` | 
`prj_id` | `character varying(96)` | `not null` | 

### Constraints and indexes

* `batch_search_project_unique UNIQUE, btree (search_uuid, prj_id)`
* `batch_search_project_batch_search_uuid_fk FOREIGN KEY (search_uuid) REFERENCES batch_search(uuid)`

*****

## `batch_search_query`

Column | Type | Nullable | Default
--- | --- | --- | ---
`search_uuid` | `character(36)` | `not null` | 
`query_number` | `integer` | `not null` | 
`query` | `text` | `not null` | 
`query_results` | `integer` |  | `0`

### Constraints and indexes

* `idx_query_result_batch_unique UNIQUE, btree (search_uuid, query)`
* `batch_search_query_search_id btree (search_uuid)`

*****

## `batch_search_result`

Column | Type | Nullable | Default
--- | --- | --- | ---
`search_uuid` | `character(36)` | `not null` | 
`query` | `text` | `not null` | 
`doc_nb` | `integer` | `not null` | 
`doc_id` | `character varying(96)` | `not null` | 
`root_id` | `character varying(96)` | `not null` | 
`doc_path` | `character varying(4096)` | `not null` | 
`creation_date` | `timestamp without time zone` |  | 
`content_type` | `character varying(255)` |  | 
`content_length` | `bigint` |  | 
`prj_id` | `character varying(96)` |  | 

### Constraints and indexes

* `batch_search_result_prj_id btree (prj_id)`
* `batch_search_result_query btree (query)`
* `batch_search_result_uuid btree (search_uuid)`

*****

## `document`

Column | Type | Nullable | Default
--- | --- | --- | ---
`id` | `character varying(96)` | `not null` | 
`path` | `character varying(4096)` | `not null` | 
`project_id` | `character varying(96)` | `not null` | 
`content` | `text` |  | 
`metadata` | `text` |  | 
`status` | `smallint` |  | 
`extraction_level` | `smallint` |  | 
`language` | `character(2)` |  | 
`extraction_date` | `timestamp without time zone` |  | 
`parent_id` | `character varying(96)` |  | 
`root_id` | `character varying(96)` |  | 
`content_type` | `character varying(256)` |  | 
`content_length` | `bigint` |  | 
`charset` | `character varying(32)` |  | 
`ner_mask` | `smallint` |  | 

### Constraints and indexes

* `document_pkey PRIMARY KEY, btree (id)`
* `document_parent_id btree (parent_id)`
* `document_status btree (status)`

*****

## `document_tag`

Column | Type | Nullable | Default
--- | --- | --- | ---
`doc_id` | `character varying(96)` | `not null` | 
`label` | `character varying(64)` | `not null` | 
`prj_id` | `character varying(96)` |  | 
`user_id` | `character varying(255)` |  | 
`creation_date` | `timestamp without time zone` | `not null` | `'1970-01-01 00:00:00'::timestamp without time zone`

### Constraints and indexes

* `idx_document_tag_unique UNIQUE, btree (doc_id, label)`
* `document_tag_doc_id btree (doc_id)`
* `document_tag_label btree (label)`
* `document_tag_project_id btree (prj_id)`

*****

## `document_user_recommendation`

Column | Type | Nullable | Default
--- | --- | --- | ---
`doc_id` | `character varying(96)` | `not null` | 
`user_id` | `character varying(96)` | `not null` | 
`prj_id` | `character varying(96)` |  | 

### Constraints and indexes

* `idx_document_mark_read_unique UNIQUE, btree (doc_id, user_id, prj_id)`
* `document_user_mark_read_doc_id btree (doc_id)`
* `document_user_mark_read_project_id btree (prj_id)`
* `document_user_mark_read_user_id btree (user_id)`

*****

## `document_user_star`

Column | Type | Nullable | Default
--- | --- | --- | ---
`doc_id` | `character varying(96)` | `not null` | 
`user_id` | `character varying(96)` | `not null` | 
`prj_id` | `character varying(96)` |  | 

### Constraints and indexes

* `idx_document_star_unique UNIQUE, btree (doc_id, user_id, prj_id)`
* `document_user_star_doc_id btree (doc_id)`
* `document_user_star_project_id btree (prj_id)`
* `document_user_star_user_id btree (user_id)`

*****

## `named_entity`

Column | Type | Nullable | Default
--- | --- | --- | ---
`id` | `character varying(96)` | `not null` | 
`mention` | `text` | `not null` | 
`offsets` | `text` | `not null` | 
`extractor` | `smallint` | `not null` | 
`category` | `character varying(8)` |  | 
`doc_id` | `character varying(96)` | `not null` | 
`root_id` | `character varying(96)` |  | 
`extractor_language` | `character(2)` |  | 
`hidden` | `boolean` |  | 

### Constraints and indexes

* `named_entity_pkey PRIMARY KEY, btree (id)`
* `named_entity_doc_id btree (doc_id)`

*****

## `note`

Column | Type | Nullable | Default
--- | --- | --- | ---
`project_id` | `character varying(96)` | `not null` | 
`path` | `character varying(4096)` |  | 
`note` | `text` |  | 
`variant` | `character varying(16)` |  | 

### Constraints and indexes

* `idx_unique_note_path_project UNIQUE, btree (project_id, path)`
* `note_project btree (project_id)`

*****

## `project`

Column | Type | Nullable | Default
--- | --- | --- | ---
`id` | `character varying(255)` | `not null` | 
`path` | `character varying(4096)` |  | 
`allow_from_mask` | `character varying(64)` |  | 
`label` | `character varying(255)` |  | 
`publisher_name` | `character varying(255)` |  | `''::character varying`
`maintainer_name` | `character varying(255)` |  | `''::character varying`
`source_url` | `character varying(2048)` |  | `''::character varying`
`logo_url` | `character varying(2048)` |  | `''::character varying`
`creation_date` | `timestamp without time zone` |  | `now()`
`update_date` | `timestamp without time zone` |  | `now()`

### Constraints and indexes

* `project_pkey PRIMARY KEY, btree (id)`

*****

## `user_history`

Column | Type | Nullable | Default
--- | --- | --- | ---
`id` | `integer` | `not null` | `generated by default as identity`
`creation_date` | `timestamp without time zone` | `not null` | 
`modification_date` | `timestamp without time zone` | `not null` | 
`user_id` | `character varying(96)` | `not null` | 
`type` | `smallint` | `not null` | 
`name` | `text` |  | 
`uri` | `text` | `not null` | 

### Constraints and indexes

* `user_history_pkey PRIMARY KEY, btree (id)`
* `idx_user_history_unique UNIQUE, btree (user_id, uri)`
* `user_history_creation_date btree (creation_date)`
* `user_history_type btree (type)`
* `user_history_user_id btree (user_id)`

### Referenced by

* `user_history_pkey PRIMARY KEY, btree (id)`
* `idx_user_history_unique UNIQUE, btree (user_id, uri)`
* `user_history_creation_date btree (creation_date)`
* `user_history_type btree (type)`
* `user_history_user_id btree (user_id)`
* `Referenced by:`
* `TABLE user_history_project CONSTRAINT user_history_project_user_history_id_fk FOREIGN KEY (user_history_id) REFERENCES user_history(id)`

*****

## `user_history_project`

Column | Type | Nullable | Default
--- | --- | --- | ---
`user_history_id` | `integer` | `not null` | 
`prj_id` | `character varying(96)` | `not null` | 

### Constraints and indexes

* `user_history_project_unique UNIQUE, btree (user_history_id, prj_id)`
* `user_history_project_user_history_id_fk FOREIGN KEY (user_history_id) REFERENCES user_history(id)`

*****

## `user_inventory`

Column | Type | Nullable | Default
--- | --- | --- | ---
`id` | `character varying(96)` | `not null` | 
`email` | `text` |  | 
`name` | `character varying(255)` |  | 
`provider` | `character varying(255)` |  | 
`details` | `text` |  | `'{}'::text`

### Constraints and indexes

* `user_inventory_pkey PRIMARY KEY, btree (id)`

*****


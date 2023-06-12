## `/api/key`

### OPTIONS `/api/key/:userId`
Preflight for key management.

* **Return** 200 with OPTIONS, GET, PUT and DELETE
### PUT `/api/key/:userId`
Creates a new private key and saves its 384 hash into database for current user.

"/api/key" resource is available only in SERVER mode.

Returns JSON like :
```
{"apiKey":"SrcasvUmaAD6NsZ3+VmUkFFWVfRggIRNmWR5aHx7Kfc="}
```

* **Parameter** userId
* **Return** 201 (created) or error

* **Throws** Exception
### GET `/api/key/:userId`
Get the private key for an existing user.

"/api/key" resource is available only in SERVER mode.

Returns JSON like :
```
{"hashedKey":"c3e7766f7605659f2b97f2a6f5bcf34611997fc31173931eefcea91df1b465ffe35c2b9b4b91e8bbe2eec3730ce2a74a"}
```

* **Parameter** userId
* **Return** 200 or error

* **Throws** Exception
### DELETE `/api/key/:userId`
Deletes an apikey for current user.
Returns 204 (idempotent) or server error.

"/api/key" resource is available only in SERVER mode.

* **Parameter** userId
* **Return** 204
* **Throws** Exception
##atch"></a> `/api/batch`
### GET `/api/batch/search`
Retrieve the batch search list for the user issuing the request.

* **Return** 200 and the list of batch searches

Example :
```
curl localhost:8080/api/batch/search 
[{"uuid":"f74432db-9ae8-401d-977c-5c44a124f2c8","published":true,"projects":[{"name":"apigen-datashare","sourcePath":"file:///vault/apigen-datashare"}],"name":"test1","description":"desc 1","user":{"id":"apigen","name":null,"email":null,"provider":"local","details":{}},"state":"SUCCESS","date":"2019-10-15T15:41:18.634+00:00","nbQueries":2,"nbResults":0,"errorMessage":null,"errorQuery":null},{"uuid":"b7bee2d8-5ede-4c56-8b69-987629742146","published":true,"projects":[{"name":"apigen-datashare","sourcePath":"file:///vault/apigen-datashare"}],"name":"search1","description":"desc 1","user":{"id":"apigen","name":null,"email":null,"provider":"local","details":{}},"state":"SUCCESS","date":"2019-10-15T14:01:21.008+00:00","nbQueries":2,"nbResults":0,"errorMessage":null,"errorQuery":null}]
```
### POST `/api/batch/search`
Retrieve the batch search list for the user issuing the request filter with the given criteria, and the total
of batch searches matching the criteria.

It needs a Query json body with the parameters :

- from : index offset of the first document to return (mandatory)
- size : window size of the results (mandatory)
- sort : field to sort (prj_id name user_id description state batch_date batch_results published) (default "batch_date")
- order : "asc" or "desc" (default "asc")
- project : projects to include in the filter (default null / empty list)
- batchDate : batch search with a creation date included in this range (default null / empty list)
- state : states to include in the filter (default null / empty list)
- publishState : publish state to filter (default null)

If from/size are not given their default values are 0, meaning that all the results are returned.
BatchDate must be a list of 2 items (the first one for the starting date and the second one for the ending date)
If defined publishState is a string equals to "0" or "1"

* **Return** 200 and the list of batch searches with the total batch searches for the query. See example for the JSON format.

Example :
```
curl -H 'Content-Type: application/json' localhost:8080/api/batch/search -d '{"from":0, "size": 2}'
{"error":"java.lang.NullPointerException"}
```
### GET `/api/batch/search/:batchid`
Retrieve the batch search with the given id
The query param "withQueries" accepts a boolean value
When "withQueries" is set to false, the list of queries is empty and nbQueries contains the number of queries.

* **Parameter** batchId
* **Return** 200 and the batch search

Example :
```
curl localhost:8080/api/batch/search/b7bee2d8-5ede-4c56-8b69-987629742146?withQueries=true
{"uuid":"b7bee2d8-5ede-4c56-8b69-987629742146","published":true,"projects":[{"name":"apigen-datashare","sourcePath":"file:///vault/apigen-datashare"}],"name":"search1","description":"desc 1","user":{"id":"apigen","name":null,"email":null,"provider":"local","details":{}},"state":"SUCCESS","date":"2019-10-15T14:01:21.008+00:00","nbQueries":2,"nbResults":0,"errorMessage":null,"errorQuery":null,"queries":{"Skype":0,"Trump":0},"fileTypes":[],"paths":[],"fuzziness":0,"phraseMatches":true}
```
### GET `/api/batch/search/:batchid/queries`
Retrieve the batch search queries with the given batch id and returns a list of strings UTF-8 encoded

if the request parameter format is set with csv, then it will answer with
content-disposition attachment (file downloading)

the optional request parameters are :
- from : if not provided it starts from 0
- size : if not provided all queries are returned from the "from" parameter
- search : if provided it will filter the queries accordingly
- orderBy : field name to order by asc, "query_number" by default (if it does not exist it will return a 500 error)

* **Parameter** batchId
* **Return** 200 and the batch search queries map [(query, nbResults), ...]

Example :
```
curl localhost:8080/api/batch/search/b7bee2d8-5ede-4c56-8b69-987629742146/queries?format=csv&from=0&size=2 
Skype
Trump
```
### OPTIONS `/api/batch/search`
preflight request

* **Return** 200 DELETE
### OPTIONS `/api/batch/search/:batchid`
preflight resquest for removal of one batchsearch

* **Parameter** batchId
* **Return** 200 DELETE
### DELETE `/api/batch/search/:batchid`
Delete batch search with the given id and its results.
It won't delete running batch searches, because results are added and would be orphans.

Returns 204 (No Content) : idempotent

* **Return** 204

Example :
```
curl -i -XDELETE localhost:8080/api/batch/search/unknown_id
HTTP/1.1 204 No Content
Access-Control-Allow-Origin: *
Content-Length: 0
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:27 GMT; max-age=2147483647

```

### PATCH `/api/batch/search/:batchid`
Update batch search with the given id.

Returns 200 and 404 if there is no batch id
If the user issuing the request is not the same as the batch owner in database, it will do nothing (thus returning 404)

* **Return** 200 or 404

Example :
```
curl -i -XPATCH localhost:8080/api/batch/search/f74432db-9ae8-401d-977c-5c44a124f2c8 -H 'Content-Type: application/json' -d '{"data": {"published": true}}'
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Length: 0
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:27 GMT; max-age=2147483647

```

### POST `/api/batch/search/:coma`
Creates a new batch search. This is a multipart form with 8 fields :
name, description, csvFile, published, fileTypes, paths, fuzziness, phrase_matches

No matter the order. The name and csv file are mandatory else it will return 400 (bad request)
Csv file must have under 60 000 lines else it will return 413 (payload too large)
Queries with less than two characters are filtered

To do so with bash you can create a text file like :
```
--BOUNDARY
Content-Disposition: form-data; name="name"

my batch search
--BOUNDARY
Content-Disposition: form-data; name="description"

search description
--BOUNDARY
Content-Disposition: form-data; name="csvFile"; filename="search.csv"
Content-Type: text/csv

Obama
skype
test
query three
--BOUNDARY--
Content-Disposition: form-data; name="published"

true
--BOUNDARY--
```
Then replace `\n` with `\r\n` with a sed like this:

`sed -i 's/$/^M/g' ~/multipart.txt`

Then make a curl request with this file :
```
curl -i -XPOST localhost:8080/api/batch/search/prj1,prj2 -H 'Content-Type: multipart/form-data; boundary=BOUNDARY' --data-binary @/home/dev/multipart.txt
```
* **Parameter** comaSeparatedProjects
* **Parameter** context : the request body
* **Return** 200 or 400 or 413
### OPTIONS `/api/batch/search/copy/:sourcebatchid`
preflight request

* **Return** 200 POST
### POST `/api/batch/search/copy/:sourcebatchid`
Create a new batch search based on a previous one given its id, and enqueue it for running

it returns 404 if the source BatchSearch object is not found in the repository.

* **Parameter** sourceBatchId: the id of BatchSearch to copy
* **Parameter** context : the context of request (containing body)
* **Return** 200 or 404

Example:
```
curl localhost:8080/api/batch/search/copy/b7bee2d8-5ede-4c56-8b69-987629742146 -H 'Content-Type: application/json' -d "{\"name\": \"my new batch\", \"description\":\"desc\"}"
aff5bc40-8c9e-4a7b-a6f7-48ba1e39d75a
```
### POST `/api/batch/search/result/:batchid`
Retrieve the results of a batch search as JSON.

It needs a Query json body with the parameters :

- from : index offset of the first document to return (mandatory)
- size : window size of the results (mandatory)
- queries: list of queries to be downloaded (default null)
- sort: field to sort ("doc_nb", "doc_id", "root_id", "doc_path", "creation_date", "content_type", "content_length", "creation_date") (default "doc_nb")
- order: "asc" or "desc" (default "asc")

If from/size are not given their default values are 0, meaning that all the results are returned.
* **Parameter** batchId
* **Parameter** webQuery
* **Return** 200

Example :
```
curl -XPOST localhost:8080/api/batch/search/result/b7bee2d8-5ede-4c56-8b69-987629742146 -d "{\"from\":0, \"size\": 2}"
[{"query":"Skype","project":null,"documentId":"bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f","rootId":"bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f","documentPath":"doc1.txt","creationDate":null,"contentType":"text/plain","contentLength":854,"documentNumber":0},{"query":"Trump","project":null,"documentId":"bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f","rootId":"bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f","documentPath":"doc1.txt","creationDate":null,"contentType":"text/plain","contentLength":854,"documentNumber":0}]
```
### GET `/api/batch/search/result/csv/:batchid`
Retrieve the results of a batch search as a CSV file.

The search request is by default all results of the batch search.

* **Parameter** batchId
* **Return** 200 and the CSV file as attached file

Example :
```
curl -i localhost:8080/api/batch/search/result/csv/f74432db-9ae8-401d-977c-5c44a124f2c8
HTTP/1.1 200 OK
Content-Disposition: attachment;filename="f74432db-9ae8-401d-977c-5c44a124f2c8.csv"
Access-Control-Allow-Origin: *
Content-Type: text/csv
ETag: af6a4e9eda7d0238b038668b4c9bd004
Content-Length: 1081
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:27 GMT; max-age=2147483647

"query", "documentUrl", "documentId","rootId","contentType","contentLength","documentPath","creationDate","documentNumber"
"Skype","localhost:8080/#/d/apigen-datashare/bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f/bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f","bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f","bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f","text/plain","854","doc1.txt","null","0"
"Trump","localhost:8080/#/d/apigen-datashare/bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f/bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f","bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f","bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f","text/plain","854","doc1.txt","null","0"
```
### DELETE `/api/batch/search`
Delete batch searches and results for the current user.

Returns 204 (No Content): idempotent

* **Return** 204

Example :
```
curl -XDELETE localhost:8080/api/batch/search

```
## `/api`

### GET `/api/:project/documents/src/:id?`routing=:routing
Returns the file from the index with the index id and the root document (if embedded document).

The routing can be omitted if it is a top level document, or it can be the same as the id.

Returns 404 if it doesn't exist

Returns 403 if the user has no access to the requested index.

* **Parameter** project
* **Parameter** id
* **Parameter** routing
* **Return** 200 or 404 or 403 (Forbidden)

Example :

```
curl -i http://localhost:8080/api/apigen-datashare/documents/src/bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f
HTTP/1.1 200 OK
Content-Disposition: attachment;filename="doc1.txt"
Access-Control-Allow-Origin: *
Content-Type: text/plain
ETag: 8f1cdb75be4a54bfc6bcfe8be5a2c6f4
Content-Length: 854
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:27 GMT; max-age=2147483647

This is an embedded doc test on behalf of our client 'Skype Ltd.'.

What is Skype Ltd. ?

Skype Ltd. is for doing things together, whenever you’re apart. 

With Skype Ltd., you can share a story, celebrate a birthday, learn a language, hold a meeting, work with colleagues – just about anything you need to do together every day. You can use Skype Ltd. on whatever works best for you - on your phone or computer or a TV with Skype Ltd. on it. It is free to start using Skype Ltd. - to speak, see and instant message other people on Skype Ltd. for example. You can even try out group video, with the latest version of Skype Ltd.

Skype is heavily used by a lot of people around the world. For example Trump is using frequently skype app to discuss all political issues with his advisors.

Don't hesitate to contact us on contact@skype.com.
```
### GET `/api/:project/documents/content/:id?routing=:routing`
Fetch extracted text by slice (pagination)
* **Parameter** project Project id
* **Parameter** id Document id
* **Parameter** offset Starting byte (starts at 0)
* **Parameter** limit Size of the extracted text slice in bytes
* **Parameter** targetLanguage Target language (like "ENGLISH") to get slice from translated content
* **Return** 200 and a JSON containing the extracted text content ("content":text), the max offset as last rank index ("maxOffset":number), start ("start":number) and size ("size":number) parameters.
* **Throws** IOException

Example :
```
curl -XGET -H 'Content-Type: application/json' localhost:8080/api/apigen-datashare/documents/content/bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f?offset=1&limit=300
{"error":"java.lang.NullPointerException"}
```

### GET `/api/:project/documents/searchContent/:id?routing=:routing`
Search query occurrences in content or translated content (pagination)
* **Parameter** project Project id
* **Parameter** id Document id
* **Parameter** query Query string to search occurrences (starts at 0)
* **Parameter** targetLanguage Target language (like "ENGLISH") to search in translated content
* **Return** 200 and a JSON containing the occurrences offsets in the text, and the count of occurrences.
* **Throws** IOException

Example :
```
curl -XGET -H 'Content-Type: application/json' localhost:8080/api/apigen-datashare/documents/searchContent/bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f?query=test&targetLanguage=ENGLISH
{"offsets":[24,607],"count":2,"query":"test","targetLanguage":null}
```

### POST `/api/:project/documents/batchUpdate/star`
Group star the documents. The id list is passed in the request body as a json list.

It answers 200 if the change has been done and the number of documents updated in the response body.
* **Parameter** projectId
* **Parameter** docIds as json
* **Return** 200 and the number of documents updated

Example :
```
curl -i -XPOST -H "Content-Type: application/json" localhost:8080/api/apigen-datashare/documents/batchUpdate/star -d '["bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f"]'
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: f3e08ec610a65d7274b42ef66cfb631f
Content-Length: 12
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:28 GMT; max-age=2147483647

{"result":0}
```

### POST `/api/:project/documents/batchUpdate/unstar`
Group unstar the documents. The id list is passed in the request body as a json list.

It answers 200 if the change has been done and the number of documents updated in the response body.

* **Parameter** projectId
* **Parameter** docIds as json in body
* **Return** 200 and the number of documents unstarred

Example :
```
curl -i -XPOST -H "Content-Type: application/json" localhost:8080/api/apigen-datashare/documents/batchUpdate/unstar -d '["bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f", "unknownId"]'
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: cb9cba297da561bff19badc2a44c6b93
Content-Length: 12
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:28 GMT; max-age=2147483647

{"result":1}
```
### GET `/api/:project/documents/starred`
Retrieves the list of starred document for a given project.

* **Parameter** projectId
* **Return** 200

Example :
```
curl -i localhost:8080/api/apigen-datashare/documents/starred
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: d751713988987e9331980363e24189ce
Content-Length: 2
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:28 GMT; max-age=2147483647

[]
```
### GET `/api/:projects/documents/tagged/:coma`
Retrieves the list of tagged document with tag "tag" for the given project id.

This service doesn't need to have the document stored in the database (no join is made)

* **Parameter** projectId
* **Parameter** comaSeparatedTags
* **Return** 200

Example :
```
curl -i localhost:8080/api/apigen-datashare/documents/tagged/tag_01,tag_02
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: d751713988987e9331980363e24189ce
Content-Length: 2
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:28 GMT; max-age=2147483647

[]
```
### OPTIONS `/api/:project/documents/tags/:docId`
preflight request

* **Parameter** projectId
* **Parameter** docId
* **Return** 200 PUT
### PUT `/api/:project/documents/tags/:docId?routing=:routing`

* **Parameter** projectId
* **Parameter** docId
* **Parameter** routing
* **Parameter** tags
* **Return** 201 if created else 200

Example :
```
curl -XPUT -H "Content-Type: application/json" localhost:8080/api/apigen-datashare/documents/tags/bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f -d '["tag1","tag2"]'

```
### GET `/api/:project/documents/tags/:docId`
Gets all the tags from a document with the user and timestamp.
* **Parameter** projectId
* **Parameter** docId
* **Return** 200 and the list of tags

Example :
```
curl  http://localhost:8080/api/apigen-datashare/documents/tags/bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f
[{"label":"tag1","creationDate":"2023-06-12T19:20:21.384+00:00","user":{"id":null,"name":null,"email":null,"provider":"local","details":{}}},{"label":"tag2","creationDate":"2023-06-12T19:20:21.384+00:00","user":{"id":null,"name":null,"email":null,"provider":"local","details":{}}}]
```
### POST `/api/:project/documents/batchUpdate/tag`
Group tag the documents. The document id list and the tag list are passed in the request body.

It answers 200 if the change has been done.

* **Parameter** projectId
* **Parameter** query
* **Return** 200

Example :
```
curl -i -XPOST  -H "Content-Type: application/json"  localhost:8080/api/apigen-datashare/documents/batchUpdate/tag -d '{"docIds": ["bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f", "7473df320bee9919abe3dc179d7d2861e1ba83ee7fe42c9acee588d886fe9aef0627df6ae26b72f075120c2c9d1c9b61"], "tags": ["foo", "bar"]}'
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Length: 0
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:28 GMT; max-age=2147483647

```
### POST `/api/:project/documents/batchUpdate/untag`
Group untag the documents. The document id list and the tag list are passed in the request body.

It answers 200 if the change has been done.

* **Parameter** projectId
* **Parameter** query
* **Return** 200

Example :
```
curl -i -XPOST  -H "Content-Type: application/json"  localhost:8080/api/documents/apigen-datashare/batchUpdate/untag -d '{"docIds": ["bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f", "7473df320bee9919abe3dc179d7d2861e1ba83ee7fe42c9acee588d886fe9aef0627df6ae26b72f075120c2c9d1c9b61"], "tags": ["foo", "bar"]}'
HTTP/1.1 404 Not Found
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: b71633c3c6c82e3d187d0ef9cde9ad65
Content-Length: 12
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:28 GMT; max-age=2147483647

{"error":""}
```
### OPTIONS `/api/:project/documents/untag/:docId`
preflight request

* **Parameter** projectId
* **Parameter** docId
* **Return** 200 PUT
### PUT `/api/:project/documents/untag/:docId?routing=:routing`
Untag one document

* **Parameter** projectId
* **Parameter** docId
* **Parameter** routing
* **Parameter** tags
* **Return** 201 if untagged else 200

```
curl -i -XPUT -H "Content-Type: application/json" localhost:8080/api/apigen-datashare/documents/untag/bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f -d '["tag1"]'
HTTP/1.1 201 Created
Access-Control-Allow-Origin: *
Content-Length: 0
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:28 GMT; max-age=2147483647

```
### GET `/api/documents/starred`
Retrieves the list of starred document for all projects.

This service needs to have the document stored in the database.

* **Return** 200 and the list of Documents

```
curl localhost:8080/api/documents/starred
[]
```
### GET `/api/users/recommendations?project=:project`
Retrieves the list of users who recommended a document with the total count of recommended documents
for the given project id


* **Parameter** projectId
* **Return** 200

Example :
```
curl -i localhost:8080/api/users/recommendations?project=apigen-datashare
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: 5b75634430b29618a96b03dc7f4b657e
Content-Length: 123
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:28 GMT; max-age=2147483647

{"aggregates":[{"item":{"id":"apigen","name":null,"email":null,"provider":"local","details":{}},"count":1}],"totalCount":1}
```
### GET `/api/users/recommendationsby?project=:project`
Get all users who recommended a document with the count of all recommended documents
for project and documents ids.

* **Parameter** projectId
* **Parameter** comaSeparatedDocIds
* **Return** 200 and the list of tags

Example :
```
curl  http://localhost:8080/api/users/recommendations?project=apigen-datashare&docIds=bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f
{"aggregates":[{"item":{"id":"apigen","name":null,"email":null,"provider":"local","details":{}},"count":1}],"totalCount":1}
```
### GET `/api/:project/documents/recommendations?userids=:coma`
Retrieves the set of marked read documents for the given project id and a list of users
provided in the url.

This service doesn't need to have the document stored in the database (no join is made)

* **Parameter** projectId
* **Parameter** comaSeparatedUsers
* **Return** 200

Example :
```
curl -i localhost:8080/api/apigen-datashare/documents/recommendations?userids=apigen
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: 522f24330c4e01bd4bfa8f275726b982
Content-Length: 100
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:28 GMT; max-age=2147483647

["bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f"]
```
### POST `/api/:project/documents/batchUpdate/recommend`
Group mark the documents "read". The id list is passed in the request body as a json list.

It answers 200 if the change has been done and the number of documents updated in the response body.
* **Parameter** projectId
* **Parameter** docIds as json
* **Return** 200 and the number of documents marked

Example :
```
curl -i -XPOST -H "Content-Type: application/json" localhost:8080/api/apigen-datashare/documents/batchUpdate/recommend -d '["7473df320bee9919abe3dc179d7d2861e1ba83ee7fe42c9acee588d886fe9aef0627df6ae26b72f075120c2c9d1c9b61"]'
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: cb9cba297da561bff19badc2a44c6b93
Content-Length: 12
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:28 GMT; max-age=2147483647

{"result":1}
```
### POST `/api/:project/documents/batchUpdate/unrecommend`
Group unmark the documents. The id list is passed in the request body as a json list.

It answers 200 if the change has been done and the number of documents updated in the response body.

* **Parameter** projectId
* **Parameter** docIds as json
* **Return** 200 and the number of documents unmarked

Example :
```
curl -i -XPOST -H "Content-Type: application/json" localhost:8080/api/apigen-datashare/documents/batchUpdate/unrecommend -d '["bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f"]'
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: cb9cba297da561bff19badc2a44c6b93
Content-Length: 12
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:28 GMT; max-age=2147483647

{"result":1}
```
## `/api/extensions`
### GET `/api/extensions`
Gets the extension set in JSON

If a request parameter "filter" is provided, the regular expression will be applied to the list.

see https://docs.oracle.com/javase/8/docs/api/java/util/regex/Pattern.html
for pattern syntax.

Example:
```
curl localhost:8080/api/extensions?filter=.*paginator
[]
```
* **Return**
### OPTIONS `/api/extensions/install`
Preflight request

* **Return** OPTIONS,PUT
### PUT `/api/extensions/install`
Download (if necessary) and install extension specified by its id or url

request parameter `id` or `url` must be present.

* **Return**  200 if the extension is installed
* **Return**  404 if the extension is not found by the provided id or url
* **Return**  400 if neither id nor url is provided

* **Throws** IOException

Example:
```
curl -i -XPUT localhost:8080/api/extensions/install?id=https://github.com/ICIJ/datashare-extension-nlp-ixapipe/releases/download/7.0.0/datashare-nlp-ixapipe-7.0.0-jar-with-dependencies.jar
HTTP/1.1 404 Not Found
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: b71633c3c6c82e3d187d0ef9cde9ad65
Content-Length: 12
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:28 GMT; max-age=2147483647

{"error":""}
```
### OPTIONS `/api/extensions/uninstall`
Preflight request

* **Return** OPTIONS,DELETE
###extensionid"></a> DELETE `/api/extensions/uninstall?`id=:extensionId
Uninstall extension specified by its id

* **Parameter** extensionId
* **Return** 204 if the extension is uninstalled (idempotent)

* **Throws** IOException if there is a filesystem error

Example:
```
curl -i -XDELETE localhost:8080/api/extensions/uninstall?id=https://github.com/ICIJ/datashare-extension-nlp-ixapipe/releases/download/7.0.0/datashare-nlp-ixapipe-7.0.0-jar-with-dependencies.jar
HTTP/1.1 204 No Content
Access-Control-Allow-Origin: *
Content-Length: 0
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:28 GMT; max-age=2147483647

```
## `/api/index`

### PUT `/api/index/:index`
Create the index for the current user if it doesn't exist.

* **Return** 201 (Created) or 200 if it already exists

Example :
```
curl -i -XPUT localhost:8080/api/index/apigen-datashare
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Length: 0
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:28 GMT; max-age=2147483647

```
### OPTIONS `/api/index/:index`
Preflight for index creation.

* **Parameter** index
* **Return** 200 with PUT
### HEAD `/api/index/search/:path:`
Head request useful for JS api (for example to test if an index exists)

* **Parameter** path
* **Return** 200
### POST `/api/index/search/:path:`
The search endpoint is just a proxy in front of Elasticsearch, everything sent is forwarded to Elasticsearch. DELETE method is not allowed.

Path can be of the form :
* _search/scroll
* index_name/_search
* index_name1,index_name2/_search
* index_name/_count
* index_name1,index_name2/_count
* index_name/doc/_search
* index_name1,index_name2/doc/_search

* **Parameter** path
* **Return** 200 or http error from Elasticsearch

Example :
```
curl -XPOST -H 'Content-Type: application/json' http://dsenv:8080/api/index/search/apigen-datashare/_search -d '{}'

```
### GET `/api/index/search/:path:`
Search GET request to Elasticsearch

As it is a GET method, all paths are accepted.

if a body is provided, the body will be sent to ES as source=urlencoded(body)&source_content_type=application%2Fjson
in that case, request parameters are not taken into account.

* **Parameter** path
* **Return** 200 or http error from Elasticsearch

Example :
```
curl -H 'Content-Type: application/json' 'http://dsenv:8080/api/index/search/apigen-datashare/_search?q=type:NamedEntity&size=1'

```
### OPTIONS `/api/index/search/:path:`
Prefligth option request

* **Parameter** path
* **Return** 200

## `/api`

### GET `/api/:project/namedEntities/:id?routing=:documentId`
Returns the named entity with given id and document id.

* **Parameter** id
* **Parameter** documentId the root document
* **Return** 200

Example :
```
 curl "localhost:8080/api/apigen-datashare/namedEntities/4c262715b69f33e9ba69c794cc37ce6a90081fa124ca2ef67ab4f0654c72cb250e08f1f8455fbf8e4331f8955300c83a?routing=bd2ef02d39043cc5cd8c5050e81f6e73c608cafde339c9b7ed68b2919482e8dc7da92e33aea9cafec2419c97375f684f"
{"error":"net.codestory.http.errors.NotFoundException"}
```
### OPTIONS `/api/:project/namedEntities/hide/:mentionNorm`
preflight request for hide
* **Parameter** mentionNorm
* **Return** 200 PUT
### PUT `/api/:project/namedEntities/hide/:mentionNorm`
hide all named entities with the given normalized mention

* **Parameter** mentionNorm
* **Parameter** project
* **Return** 200

Example :
```
curl -i -XPUT localhost:8080/api/namedEntities/hide/xlsx
HTTP/1.1 404 Not Found
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: b71633c3c6c82e3d187d0ef9cde9ad65
Content-Length: 12
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:28 GMT; max-age=2147483647

{"error":""}
```
## `/api/ner`
### GET `/api/ner/pipelines`
Get the list of registered pipelines.

* **Return** pipeline set
Example:
```
curl http://dsenv:8080/api/ner/pipelines

```
### POST `/api/ner/findNames/:pipeline`
When datashare is launched in NER mode (without index) it exposes a name finding HTTP API. The text is sent with the HTTP body.

* **Parameter** pipeline to use
* **Parameter** text to analyse in the request body
* **Return** list of NamedEntities annotations

Example :
```
curl -XPOST http://dsenv:8080/api/ner/findNames/CORENLP -d "Please find attached a PDF copy of the advance tax clearance obtained for our client John Doe."

```
## `/api`
### GET `/api/:project/notes/:path:`
Gets the list of notes for a project and a document path.

if we have on disk:

```
/a/b/doc1
/a/c/doc2
/d/doc3
```

And in database

projectId | path | note | variant
--- | --- | --- | ---
p1 | a | note A | info
p1 | a/b | note B | danger

then :
- `GET `/api/p1/notes/a/b/doc1` will return note A and B`
- `GET `/api/p1/notes/a/c/doc2` will return note A`
- `GET `/api/p1/notes/d/doc3` will return an empty list`

If the user doesn't have access to the project she gets a 403 Forbidden

* **Parameter** project the project the note belongs to
* **Parameter** documentPath the document path
* **Parameter** context HTTP context containing the user
* **Return** list of Note that match the document path

Example:
```
curl localhost:8080/api/apigen-datashare/notes/path/to/note/for/doc.txt
[{"project":{"name":"apigen-datashare","sourcePath":"file:///vault/apigen-datashare"},"path":"path/to/note","note":"this is a note","variant":"info"}]
```
### GET `/api/:project/notes`
Gets the list of notes for a project.

If the user doesn't have access to the project she gets a 403 Forbidden

* **Parameter** project the project the note belongs to
* **Parameter** context HTTP context containing the user
* **Return** list of Note related to the project

Example:
```
curl localhost:8080/api/apigen-datashare/notes
[{"project":{"name":"apigen-datashare","sourcePath":"file:///vault/apigen-datashare"},"path":"path/to/note","note":"this is a note","variant":"info"}]
```
##lugins"></a> `/api/plugins`
### GET `/api/plugins`
Gets the plugins set in JSON

If a request parameter "filter" is provided, the regular expression will be applied to the list.

see https://docs.oracle.com/javase/8/docs/api/java/util/regex/Pattern.html
for pattern syntax.

Example:
```
curl localhost:8080/api/plugins?filter=.*paginator
[{"deliverableFromRegistry":{"id":"datashare-plugin-text-paginator","name":"Text Paginator","version":"0.0.14","description":"A Datashare plugin to detect pages in text to display them nicely.","url":"https://github.com/ICIJ/datashare-plugin-text-paginator/releases/download/0.0.14/datashare-plugin-text-paginator-0.0.14.tgz","homepage":"https://github.com/ICIJ/datashare-plugin-text-paginator","type":"PLUGIN"},"installed":false,"version":"0.0.14","name":"Text Paginator","id":"datashare-plugin-text-paginator","type":"PLUGIN","description":"A Datashare plugin to detect pages in text to display them nicely."}]
```
### OPTIONS `/api/plugins/install`
Preflight request

* **Return** OPTIONS,PUT
### PUT `/api/plugins/install`
Download (if necessary) and install plugin specified by its id or url

request parameter `id` or `url` must be present.

* **Return**  200 if the plugin is installed
* **Return**  404 if the plugin is not found by the provided id or url
* **Return**  400 if neither id nor url is provided

* **Throws** IOException
* **Throws** ArchiveException

Example:
```
curl -i -XPUT localhost:8080/api/plugins/install?id=datashare-plugin-site-alert
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Length: 0
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:29 GMT; max-age=2147483647

```
### OPTIONS `/api/plugins/uninstall`

Preflight request

* **Return** OPTIONS,DELETE
###pluginid"></a> DELETE `/api/plugins/uninstall?id=:pluginId`
Uninstall plugin specified by its id
Always returns 204 or error 500.

* **Parameter** pluginId
* **Return** 204

* **Throws** IOException if there is a filesystem error

Example:
```
curl -i -XDELETE localhost:8080/api/plugins/uninstall?id=datashare-plugin-site-alert
HTTP/1.1 204 No Content
Access-Control-Allow-Origin: *
Content-Length: 0
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:29 GMT; max-age=2147483647

```
## `/api/project`

### GET `/api/project/:id`
Gets the project information for the given project id.

* **Parameter** id
* **Return** 200 and the project from database if it exists else a transient one

Example :

```
curl -H 'Content-Type:application/json' localhost:8080/api/project/apigen-datashare
{"name":"apigen-datashare","sourcePath":"file:///vault/apigen-datashare"}
```

### GET `/api/project/isDownloadAllowed/:id`
Returns if the project is allowed with this network route : in datashare database
there is the project table that can specify an IP mask that is allowed per project.
If the client IP is not in the range, then the file download will be forbidden.

in that project table there is a field called `allow_from_mask` that can have a mask
with IP and star wildcard.

Ex : `192.168.*.*` will match all subnetwork 192.168.0.0 IP's and only users with an IP in
this range will be granted for downloading documents.

* **Parameter** id
* **Return** 200 or 403 (Forbidden)

Example :
```
curl -i -H 'Content-Type:application/json' localhost:8080/api/project/isDownloadAllowed/apigen-datashare
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Length: 0
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:29 GMT; max-age=2147483647

```
Example :
```
curl -i -H 'Content-Type:application/json' localhost:8080/api/project/isDownloadAllowed/disallowed-project
HTTP/1.1 403 Forbidden
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: b71633c3c6c82e3d187d0ef9cde9ad65
Content-Length: 12
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:29 GMT; max-age=2147483647

{"error":""}
```
### OPTIONS `/api/project/:id`
Preflight option request
* **Parameter** id
* **Return** 200 DELETE
### DELETE `/api/project/:id`
Delete the project from database and elasticsearch indices.

It always returns 204 (no content) or 500 if an error occurs.

If the project id is not the current user project (local-datashare in local mode),
then it will return 401 (unauthorized)

* **Parameter** id
* **Return** 204

Example :
```
curl -I -XDELETE -H 'Content-Type:application/json' localhost:8080/api/project/unknown-project
HTTP/1.1 401 Unauthorized
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: b71633c3c6c82e3d187d0ef9cde9ad65
Content-Length: 12
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:29 GMT; max-age=2147483647

```
## `/`
### GET `/`
gets the root of the front-end app ie: ./app/index.html

if pluginsDir is set, it will add in the index the tag <script src="plugins/my_plugin/index.js"></script>
else it will return the index.html content as is

* **Return** the content of index.html file
### GET `/settings`
Gets the public (i.e. without user's information) datashare settings parameters.
These parameters are used for the client app for the init process.

The endpoint is removing all fields that contain Address or Secret or Url or Key

* **Return** 200

Example :
```
curl -i localhost:8080/settings
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: b949dbc38558db908d6335537ea0caaf
Content-Length: 840
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:29 GMT; max-age=2147483647

{"parserParallelism":"1","cors":"*","dataDir":"/home/circleci/datashare/doc/apigen/docs","parallelism":"2","batchQueueType":"MEMORY","backHost":"http://localhost:","userAdmin":"icij","scrollSlices":"1","elasticsearchDataPath":"/home/datashare/es","protectedUriPrefix":"/api/","redisPoolSize":"1","mode":"LOCAL","previewHost":"http://localhost:5000","pathSeparator":"/","clusterName":"datashare","nlpParallelism":"1","busType":"MEMORY","defaultProject":"apigen-datashare","scrollSize":"1000","ocr":"true","defaultUserName":"apigen","batchDownloadMaxNbFiles":"10000","frontHost":"http://localhost:","tcpListenPort":"8080","sessionStoreType":"MEMORY","queueName":"extract:queue","batchDownloadTimeToLive":"24","pluginsDir":"/tmp/plugins","queueType":"MEMORY","browserOpenLink":"false","batchDownloadMaxSize":"100M","sessionTtlSeconds":"43200"}
```
### GET `/version`
Gets the versions (front/back/docker) of datashare.

* **Return** 200

Example :
```
curl -i localhost:8080/version
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: 5ccd0df03e9723a7113104cd22742ccf
Content-Length: 753
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:29 GMT; max-age=2147483647

{"git.tags":"11.2.0-alpha8","git.build.version":"11.2.0-alpha8","git.closest.tag.commit.count":"","git.commit.user.name":"Pierre Romera","git.commit.id.abbrev":"55fde1d","git.branch":"master","git.build.host":"281d9b549037","git.commit.id.describe-short":"55fde1d","git.commit.id.describe":"55fde1d","git.build.user.email":"","git.commit.id":"55fde1dfcd24ce5acd4a9cd2dcd7a896ed06887f","git.commit.message.short":"[release] 11.2.0-alpha8","git.commit.user.email":"hello@pirhoo.com","git.closest.tag.name":"","git.build.time":"2023-06-12T17:13:10+0000","git.commit.time":"2023-06-12T17:10:11+0000","git.build.user.name":"","git.dirty":"false","git.commit.message.full":"[release] 11.2.0-alpha8","git.remote.origin.url":"git@github.com:ICIJ/datashare.git"}
```
## `/api/settings`
### OPTIONS `/api/settings`

Preflight for settings.

* **Parameter** context
* **Return** 200 with PATCH
### PATCH `/api/settings`

update the datashare settings with provided body. It will save the settings on disk.

Returns 404 if settings is not found. It means that the settings file has not been set (or is not readable)
Returns 403 if we are in SERVER mode

The settings priority is basically
DS_DOCKER_* variables > -s file > classpath:datashare.properties > command line. I.e. :

- DS_DOCKER_* variables will be taken and override all keys (if any similar keys exist)
- if a file is given (w/ -c path/to/file) to the command line it will be read and used (it can be empty or not present)
- if no file is given, we are looking for datashare.properties in the classpath (for example in /dist)
- if none of the two above cases is fulfilled we are taking the default CLI parameters (and those given by the user)
- parameters are common between CLI and settings file, the settings file "wins"
- if a settings file is not writable then 404 will be returned (and a WARN will be logged at start)

* **Return** 200 or 404 or 403

Example :
```
curl -i -XPATCH -H 'Content-Type: application/json' localhost:8080/api/settings -d '{"data":{"foo":"bar"}}'
HTTP/1.1 404 Not Found
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: b71633c3c6c82e3d187d0ef9cde9ad65
Content-Length: 12
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:29 GMT; max-age=2147483647

{"error":""}
```
### GET `/api/settings/ocr/languages`
List all available language in Tesseract

Returns 503 if Tesseract is not installed

* **Return** 200 or 503
### GET `/api/settings/text/languages`
List all available language in the text extractor

* **Return** 200

## `/api`

### GET `/api/status`
Retrieve the status of databus connection, database connection, shared queues and index.
Adding "format=openmetrics" parameter to the url will return the status witn openmetrics format.

* **Return** the status of datashare elements

Example:
```
curl localhost:8080/api/status
{"database":true,"index":true,"databus":true,"document_queue_status":true,"document_queue_size":0}
```

```
curl localhost:8080/api/status?format=openmetrics
# HELP datashare The datashare resources status
# TYPE datashare gauge
datashare{status="OK",resource="database"} 1 1686597622687
datashare{status="OK",resource="index"} 1 1686597622687
datashare{status="OK",resource="databus"} 1 1686597622687
datashare{status="OK",resource="document_queue_status"} 1 1686597622687
datashare{resource="document_queue_size"} 0 1686597622688
```

## `/api/task`

### GET `/api/task/all`
gets all the user tasks
a filter can be added with a pattern contained in the task name.

* **Return** 200 and the list of tasks

Example :
```
curl localhost:8080/api/task/all?filter=BatchDownloadRunner
[]
```
### GET `/api/task/:id`
gets one task with its id

* **Parameter** id
* **Return** 200

Example :
```
curl localhost:8080/api/task/21148262
{"error":"net.codestory.http.errors.NotFoundException"}
```
### GET `/api/task/:id/result`
gets task result with its id

* **Parameter** id
* **Return** 200 and the result,
204 if there is no result
404 if the tasks doesn't exist
403 if the task is not belonging to current user

Example :
```
curl localhost:8080/api/task/21148262/result
{"error":"net.codestory.http.errors.NotFoundException"}
```
### OPTIONS `/api/task/batchDownload`
### POST `/api/task/batchDownload`
download files from a search query. Expected parameters are :

* project: string
* query: string or elasticsearch JSON query

if the query is a string it is taken as an ES query string, else it is a raw JSON query (without the query part)
@see org.elasticsearch.index.query.WrapperQueryBuilder that is used to wrap the query

* **Parameter** optionsWrapper wrapper for options json

* **Return** 200 and json task

Example :
```
curl -XPOST -H 'Content-Type: application/json' localhost:8080/api/task/batchDownload -d '{"options": {"projectIds": ["genapi-datashare"], "query": "*", "uri": "/?q=&from=0&size=25&indices=genapi-datashare" }}'
{"name":"org.icij.datashare.tasks.BatchDownloadRunner@840815c6-a38e-4de8-9625-d34856c02da1","state":"RUNNING","progress":0.0,"user":{"id":"apigen","name":null,"email":null,"provider":"local"},"properties":{"batchDownload":{"uuid":"840815c6-a38e-4de8-9625-d34856c02da1","projects":[{"name":"genapi-datashare","sourcePath":"file:///vault/genapi-datashare"}],"filename":"file:///home/circleci/datashare/app/tmp/archive_apigen_2023-06-12T19_20_22.744Z%5BGMT%5D.zip","query":"*","uri":"/?q=&from=0&size=25&indices=genapi-datashare","user":{"id":"apigen","name":null,"email":null,"provider":"local"},"encrypted":false,"zipSize":0,"exists":false}}}
```
### POST `/api/task/batchUpdate/index`
index files from the queue

* **Parameter** optionsWrapper wrapper for options json
* **Return** 200 and json task

Example :
```
curl -XPOST localhost:8080/api/task/batchUpdate/index -d '{}'
{"name":"org.icij.datashare.tasks.IndexTask@90413c6","state":"RUNNING","progress":"NaN","user":{"id":"apigen","name":null,"email":null,"provider":"local"}}
```
### POST `/api/task/batchUpdate/index/file`
Indexes files in a directory (with docker, it is the mounted directory that is scanned)

* **Parameter** optionsWrapper
* **Return** 200 and the list of tasks created

Example :
```
curl -XPOST localhost:8080/api/task/batchUpdate/index/file -d '{}'
[{"name":"org.icij.datashare.tasks.ScanTask@1b665c35","state":"DONE","progress":1.0,"user":{"id":"apigen","name":null,"email":null,"provider":"local"},"result":2},{"name":"org.icij.datashare.tasks.IndexTask@2e2af1a","state":"RUNNING","progress":0.0,"user":{"id":"apigen","name":null,"email":null,"provider":"local"}}]
```
### POST `/api/task/batchUpdate/index/:filePath:`
Indexes all files of a directory with the given path.

* **Parameter** filePath
* **Parameter** optionsWrapper
* **Return** 200 and the list of created tasks

Example $(curl -XPOST localhost:8080/api/task/batchUpdate/index/home/dev/myfile.txt)
### POST `/api/task/batchUpdate/scan/:filePath:`
Scans recursively a directory with the given path

* **Parameter** filePath
* **Parameter** optionsWrapper
* **Return** 200 and the task created

Example :
```
mkdir -p /tmp/apigen

```
```
curl -XPOST localhost:8080/api/task/batchUpdate/index/tmp/apigen -d '{}'
[{"name":"org.icij.datashare.tasks.ScanTask@c53f207","state":"DONE","progress":1.0,"user":{"id":"apigen","name":null,"email":null,"provider":"local"},"result":0},{"name":"org.icij.datashare.tasks.IndexTask@23749c53","state":"RUNNING","progress":0.0,"user":{"id":"apigen","name":null,"email":null,"provider":"local"}}]
```
### POST `/api/task/clean`
Cleans all DONE tasks.

* **Return** 200 and the list of removed tasks

Example :
```
curl -XPOST -d '{}' http://dsenv:8080/api/task/clean/

```
### DELETE `/api/task/clean/:taskName:`
Cleans a specific task.

* **Parameter** taskName
* **Return**

Example :
```
curl -XDELETE -d '{}' http://dsenv:8080/api/task/clean/TASK_NAME

```
### OPTIONS `/api/task/clean/:taskName:`
### PUT `/api/task/stop/:taskId:`
Cancels the task with the given name. It answers 200 with the cancellation status `true|false`

* **Parameter** taskId
* **Return**
### OPTIONS `/api/task/stop/:taskName:`
### PUT `/api/task/stopAll`
Cancels the running tasks. It returns a map with task name/stop statuses.
If the status is false, it means that the thread has not been stopped.

* **Return** 200 and the tasks stop result map

Example :
curl -XPUT localhost:8080/api/task/stopAll
### OPTIONS `/api/task/stopAll`
### POST `/api/task/findNames/:pipeline`
Find names using the given pipeline :

- OPENNLP
- CORENLP
- IXAPIPE
- GATENLP
- MITIE

This endpoint is going to find all Documents that are not taggued with the given pipeline,
and extract named entities for all these documents.

* **Parameter** pipelineName
* **Parameter** optionsWrapper
* **Return** 200 and the list of created tasks

Example :
```
curl -XPOST http://dsenv:8080/api/task/findNames/CORENLP -d {}

```

## `/api/tree`

### GET `/api/tree:dirPath:`
List all files and directory for the given path. This endpoint returns a JSON using the same
specification than the `tree` command on UNIX. It is roughly the equivalent of:

```
tree -L 1 -spJ --noreport /home/datashare/data
```

* **Parameter** dirPath
* **Return** 200 and the list of files and directory

Example $(curl -XGET localhost:8080/api/tree/home/datashare/data)

## `/api/users`

### GET `/api/users/me`
Gets the user's session information

* **Return** 200 and the user map

Example :
```
curl -i localhost:8080/api/users/me
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: 94bb68ed0007ef584b80333e5a38916d
Content-Length: 76
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:32 GMT; max-age=2147483647

{"uid":"apigen","groups_by_applications":{"datashare":["apigen-datashare"]}}
```
### OPTIONS `/api/users/me/history`
Preflight for history.

* **Return** 200 with OPTIONS, GET, PUT and DELETE
### GET `/api/users/me/history?type=:type`
Gets the user's history by type

* **Parameter** type String included in 'document' or 'search'
* **Parameter** from the offset of the list, starting from 0
* **Parameter** size the number of element retrieved
* **Parameter** sort the name of the parameter to sort on (default: modificationDate)
* **Parameter** desc the list is sorted in descending order (default: true)
* **Parameter** projects projectIds separated by comma to filter by projects (default: none)
* **Return** 200, the user's list of events and the total number of events

Example :
```
curl -i localhost:8080/api/users/me/history?type=document&from=0&size=10&sort=modificationDate&desc=true&projects=project1,project2
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Type: application/json;charset=UTF-8
ETag: 9a3f093e2dc5d929bb25879501d527c7
Content-Length: 22
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:32 GMT; max-age=2147483647

{"items":[],"total":0}
```
### PUT `/api/users/me/history`
Add event to history. The event's type, the project ids and the uri are passed in the request body.
The project list related to the event is stored in database but is never queried (no filters on project)

It answers 200 when event is added or updated.

* **Parameter** query
* **Return** 200

Example :
```
curl -i -XPUT  -H "Content-Type: application/json"  localhost:8080/api/users/me/history -d '{"type": "SEARCH", "projectIds": ["apigen-datashare","local-datashare"], "name": "foo AND bar", "uri": "?q=foo%20AND%20bar&from=0&size=100&sort=relevance&index=luxleaks&field=all&stamp=cotgpe"}'
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Length: 0
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:32 GMT; max-age=2147483647

```
### DELETE `/api/users/me/history?type=:type`
Delete user history by type.

Returns 204 (No Content) : idempotent

* **Parameter** type
* **Return** 204

Example :
```
curl -i -XDELETE localhost:8080/api/users/me/history?type=search
HTTP/1.1 204 No Content
Access-Control-Allow-Origin: *
Content-Length: 0
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:32 GMT; max-age=2147483647

```

### OPTIONS `/api/users/me/history/event`
Preflight for history.

* **Return** 200 with OPTIONS, DELETE
### DELETE `/api/users/me/history/event?id=:eventId`
Delete user event by id.

Returns 204 (No Content) : idempotent

* **Parameter** eventId
* **Return** 204

Example :
```
curl -i -XDELETE localhost:8080/api/users/me/history/event?id=1
HTTP/1.1 204 No Content
Access-Control-Allow-Origin: *
Content-Length: 0
Connection: keep-alive
Set-Cookie: _ds_session_id={"login":null,"roles":null,"sessionId":null,"redirectAfterLogin":"/"}; version=1; path=/; expires=Sat, 30-Jun-2091 22:34:32 GMT; max-age=2147483647

```


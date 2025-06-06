# API
{% swagger src="./ds_openapi.json" path="/api/key/{userId}" method="delete" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/key/{userId}" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/key/{userId}" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/key/{userId}" method="put" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/batch/search" method="delete" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/batch/search" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/batch/search" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/batch/search" method="post" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/batch/search/result/csv/{batchid}" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/batch/search/{batchid}" method="delete" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/batch/search/{batchid}" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/batch/search/{batchid}" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/batch/search/{batchid}/queries" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/documents/starred" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/users/recommendations?project={project}" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/users/recommendationsby?project={project}&docIds={coma_separated_docIds}" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/{projects}/documents/tagged/{coma_separated_tags}" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/{project}/documents/recommendations?userids={coma_separated_users}" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/{project}/documents/starred" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/{project}/documents/tags/{docId}" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/{project}/documents/tags/{docId}" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/{project}/documents/untag/{docId}" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/document-user-recommendation/" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/document-user-recommendation/" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/extensions" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/extensions/install" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/extensions/install" method="put" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/extensions/uninstall" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/extensions/uninstall?id={extensionId}" method="delete" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/ftm/{project}/{docId}" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/index/search/{path}" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/index/search/{path}" method="head" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/index/{index}" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/index/{index}" method="put" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/{project}/namedEntities/hide/{mentionNorm}" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/{project}/namedEntities/hide/{mentionNorm}" method="put" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/ner/findNames/{pipeline}" method="post" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/ner/pipelines" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/{project}/notes" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/openapi?format={format}" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/plugins" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/plugins/install" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/plugins/install" method="put" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/plugins/uninstall" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/plugins/uninstall?id={pluginId}" method="delete" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/project/" method="delete" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/project/" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/project/" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/project/" method="post" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/project/isDownloadAllowed/{id}" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/project/{id}" method="delete" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/project/{id}" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/project/{id}" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/project/{id}" method="put" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/settings" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/version" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/status" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/all" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/batchDownload" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/batchDownload" method="post" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/batchSearch/copy/{sourcebatchid}" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/batchSearch/copy/{sourcebatchid}" method="post" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/batchSearch/{coma_separated_projects}" method="post" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/batchUpdate/index" method="post" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/batchUpdate/index/file" method="post" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/clean" method="post" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/clean/{taskName}" method="delete" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/clean/{taskName}" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/stop" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/stop" method="put" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/stop/{taskId}" method="put" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/stop/{taskName}" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/stopAll" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/stopAll" method="put" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/{id}" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/task/{id}/result" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/tree/{dirPath}" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/users/me" method="get" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/users/me/history" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/users/me/history" method="put" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/users/me/history/event" method="options" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/users/me/history/event?id={eventId}" method="delete" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}
{% swagger src="./ds_openapi.json" path="/api/users/me/history?type={type}" method="delete" %} [ds_openapi.json](./ds_openapi.json) {% endswagger %}

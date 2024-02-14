# TreeView

> A view listing directories from a specific path.

## Props

| Prop name                | Description                                                                                  | Type    | Values | Default             |
| ------------------------ | -------------------------------------------------------------------------------------------- | ------- | ------ | ------------------- |
| v-model                  | List directories from this path.<br/>`@model` true                                           | string  | -      |                     |
| projects                 | The ES indices                                                                               | array   | -      | ['local-datashare'] |
| selectedPaths            | A list of selected paths                                                                     | array   | -      | []                  |
| selectable               | Either or not paths can be selected                                                          | boolean | -      | false               |
| count                    | Show the number of documents by directory.                                                   | boolean | -      | false               |
| size                     | Show the size of documents by directory.                                                     | boolean | -      | false               |
| noHeader                 | Deactivate the header (including breadcrumb and total)                                       | boolean | -      | false               |
| noBars                   | Deactivate the bar chart bellow each folder                                                  | boolean | -      | false               |
| compact                  | Display the tree view in compact mode                                                        | boolean | -      | false               |
| preBodyBuild             | Function to apply to the elasticsearch body before it's build                                | func    | -      | identity            |
| infiniteScroll           | Either or not results should be loaded on scroll                                             | boolean | -      | true                |
| searchable               | Display a link to search by path.                                                            | boolean | -      | false               |
| sortBy                   | Key to sort the directories                                                                  | string  | -      | 'contentLength'     |
| sortByOrder              | Order to sort by (asc or desc)                                                               | string  | -      | 'desc'              |
| includeChildrenDocuments | If the true, the document count and size of each directory will include<br/>child documents. | boolean | -      |                     |
| query                    | Query to filter the directory by name.                                                       | string  | -      |                     |

## Events

| Event name           | Properties | Description                                                                                    |
| -------------------- | ---------- | ---------------------------------------------------------------------------------------------- |
| input                |            |
| update:directories   |            | Called when more directories are loaded                                                        |
| checked              |            | The selectedPaths are updated (deprecated event).                                              |
| update:selectedPaths |            | The selectedPaths are updated. New way to propagate change compatible with the .sync modifier. |

## Slots

| Name   | Description                                 | Bindings |
| ------ | ------------------------------------------- | -------- |
| above  | Area to insert content above the tree view  |          |
| bellow | Area to insert content bellow the tree view |          |

---

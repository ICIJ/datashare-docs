# DocumentLocalSearchInput

> A form to search for terms inside the current document.

## Props

| Prop name         | Description                                                                               | Type    | Values | Default                                           |
| ----------------- | ----------------------------------------------------------------------------------------- | ------- | ------ | ------------------------------------------------- |
| shortkeyScope     | Name of the scope for the shortkey settings.<br/>`@default` Name of the current component | string  | -      | function() {<br/> return this.$options.name<br/>} |
| v-model           | An object containing a property `label` to use as search term<br/>`@model` true           | string  | -      |                                                   |
| searchIndex       | The position of the current occurrence of the term<br/>`@default` 0                       | number  | -      | 0                                                 |
| searchOccurrences | The total number of occurrences found in the document<br/>`@default` 0                    | number  | -      | 0                                                 |
| loading           | Switch to loading state                                                                   | boolean | -      |                                                   |
| disabled          | Disable input                                                                             | boolean | -      |                                                   |

## Events

| Event name       | Properties | Description                                       |
| ---------------- | ---------- | ------------------------------------------------- |
| input            |            |
| previous         |            | User selected the previous occurrence of the term |
| next             |            | User selected the next occurrence of the term     |
| update:activated |            | User lost focus on the search input               |

---

# DocumentLocalSearchInput

> A form to search for terms inside the current document.

## Props

| Prop name         | Description                                                                                                 | Type    | Values | Default                                               |
| ----------------- | ----------------------------------------------------------------------------------------------------------- | ------- | ------ | ----------------------------------------------------- |
| shortkeyScope     | <p>Name of the scope for the shortkey settings.<br><code>@default</code> Name of the current component</p>  | string  | -      | <p>function() {<br>return this.$options.name<br>}</p> |
| v-model           | <p>An object containing a property <code>label</code> to use as search term<br><code>@model</code> true</p> | string  | -      |                                                       |
| searchIndex       | <p>The position of the current occurrence of the term<br><code>@default</code> 0</p>                        | number  | -      | 0                                                     |
| searchOccurrences | <p>The total number of occurrences found in the document<br><code>@default</code> 0</p>                     | number  | -      | 0                                                     |
| loading           | Switch to loading state                                                                                     | boolean | -      |                                                       |
| disabled          | Disable input                                                                                               | boolean | -      |                                                       |

## Events

| Event name       | Properties | Description                                       |
| ---------------- | ---------- | ------------------------------------------------- |
| input            |            |                                                   |
| previous         |            | User selected the previous occurrence of the term |
| next             |            | User selected the next occurrence of the term     |
| update:activated |            | User lost focus on the search input               |


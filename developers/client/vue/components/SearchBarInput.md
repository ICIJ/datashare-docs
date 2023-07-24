# SearchBarInput

> The general search input group with field options.

## Props

| Prop name     | Description                     | Type    | Values           | Default                                                    |
| ------------- | ------------------------------- | ------- | ---------------- | ---------------------------------------------------------- |
| placeholder   | Placeholder in the search bar.  | string  | -                | <p>function () {<br>this.$t('search.placeholder')<br>}</p> |
| v-model       | Search input query              | string  | -                |                                                            |
| size          | Search input size               | string  | `sm`, `md`, `lg` | 'md'                                                       |
| disableSubmit | Disable submit button           | boolean | -                | false                                                      |
| hideTips      | Hide tips icon in the input bar | boolean | -                |                                                            |

## Events

| Event name | Properties | Description |
| ---------- | ---------- | ----------- |
| update     |            |             |
| blur       |            |             |
| input      |            |             |
| focus      |            |             |

## Slots

| Name        | Description | Bindings |
| ----------- | ----------- | -------- |
| fields      |             |          |
| suggestions |             |          |


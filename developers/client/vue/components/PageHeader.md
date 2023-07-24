# PageHeader

> The header to display on top of every page

## Props

| Prop name   | Description                             | Type   | Values | Default       |
| ----------- | --------------------------------------- | ------ | ------ | ------------- |
| description | The description of the page as subtitle | string | -      | 'Description' |
| icon        | A FortAwesome definition object         | string | -      | null          |
| title       | The title of the page                   | string | -      | 'Title'       |
| tab         | Index of the active tab                 | number | -      | 0             |

## Events

| Event name | Properties | Description                             |
| ---------- | ---------- | --------------------------------------- |
| update:tab |            | Called when more directories are loaded |

## Slots

| Name     | Description | Bindings |
| -------- | ----------- | -------- |
| default  |             |          |
| preTitle |             |          |
| tabs     |             |          |


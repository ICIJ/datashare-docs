# SearchBarInputDropdown

> The general search input dropdown.

## Props

| Prop name   | Description                                       | Type          | Values | Default |
| ----------- | ------------------------------------------------- | ------------- | ------ | ------- |
| options     | Options list.                                     | array         | -      | []      |
| optionsPath | Translation path for each option value.           | array         | -      | []      |
| v-model     | Selected value                                    | string\|array | -      | 'all'   |
| multiple    | The select value can be a series values.          | boolean       | -      |         |
| disabled    | The dropdown toggler must be disabled.            | boolean       | -      |         |
| noCaret     | The caret in the dropdown toggler must be hidden. | boolean       | -      |         |

## Events

| Event name | Properties | Description |
| ---------- | ---------- | ----------- |
| update     |            |

## Slots

| Name           | Description | Bindings |
| -------------- | ----------- | -------- |
| button-content |             |          |
| dropdown-item  |             | <br/>    |

---

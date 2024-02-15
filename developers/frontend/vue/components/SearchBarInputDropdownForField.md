# SearchBarInputDropdownForField

## Props

| Prop name   | Description                                       | Type    | Values | Default                                            |
| ----------- | ------------------------------------------------- | ------- | ------ | -------------------------------------------------- |
| value       | Selected field                                    | string  | -      |                                                    |
| disabled    | The dropdown toggler must be disabled.            | boolean | -      |                                                    |
| noCaret     | The caret in the dropdown toggler must be hidden. | boolean | -      |                                                    |
| options     | Search field configuration dictionary.            | array   | -      | settings.searchFields.map((field) =&gt; field.key) |
| optionsPath | Field option translation path                     | array   | -      | ['search', 'field']                                |

## Events

| Event name | Properties | Description |
| ---------- | ---------- | ----------- |
| hidden     |            |
| changed    |            |
| input      |            |

---

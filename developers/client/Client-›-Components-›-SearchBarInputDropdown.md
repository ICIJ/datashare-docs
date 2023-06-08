# SearchBarInputDropdown

> The general search input dropdown.

## Props

| Prop name        | Description                            | Type   | Values | Default                                            |
| ---------------- | -------------------------------------- | ------ | ------ | -------------------------------------------------- |
| fieldOptions     | Search field configuration dictionary. | array  | -      | settings.searchFields.map((field) =&gt; field.key) |
| fieldOptionsPath | Field option translation path          | array  | -      | ['search', 'field']                                |
| v-model          | Selected field value                   | string | -      | 'all'                                              |

## Events

| Event name | Properties | Description |
| ---------- | ---------- | ----------- |
| update     |            |

---

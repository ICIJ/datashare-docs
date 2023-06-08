# SearchBar

> The general search form.

## Props

| Prop name        | Description                            | Type    | Values           | Default                                                |
| ---------------- | -------------------------------------- | ------- | ---------------- | ------------------------------------------------------ |
| animated         | Animate the focus on the search input. | boolean | -                |                                                        |
| placeholder      | Placeholder in the search bar.         | string  | -                | function () {<br/> this.$t('search.placeholder')<br/>} |
| settings         | Display the shortcuts button.          | boolean | -                |                                                        |
| fieldOptions     | Search field configuration dictionary. | array   | -                | settings.searchFields.map((field) =&gt; field.key)     |
| fieldOptionsPath | Field option translation path          | array   | -                | ['search', 'field']                                    |
| size             | Search input size                      | string  | `sm`, `md`, `lg` | 'md'                                                   |

---

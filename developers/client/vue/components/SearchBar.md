# SearchBar

> The general search form.

## Props

| Prop name         | Description                                      | Type    | Values           | Default                                                |
| ----------------- | ------------------------------------------------ | ------- | ---------------- | ------------------------------------------------------ |
| animated          | Animate the focus on the search input.           | boolean | -                |                                                        |
| placeholder       | Placeholder in the search bar.                   | string  | -                | function () {<br/> this.$t('search.placeholder')<br/>} |
| settings          | Display the shortcuts button.                    | boolean | -                |                                                        |
| hideFieldDropdown | Hide the field dropdown                          | boolean | -                |                                                        |
| size              | Search input size                                | string  | `sm`, `md`, `lg` | 'md'                                                   |
| indices           | Force the search bar to search intogiven indices | array   | -                | null                                                   |

---

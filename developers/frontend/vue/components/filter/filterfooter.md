# FilterFooter

## Props

| Prop name         | Description | Type    | Values | Default                                |
| ----------------- | ----------- | ------- | ------ | -------------------------------------- |
| filter            |             | object  | -      |                                        |
| hideContextualize |             | boolean | -      | false                                  |
| hideExclude       |             | boolean | -      | false                                  |
| hideSort          |             | boolean | -      | false                                  |
| hideShowMore      |             | boolean | -      | false                                  |
| sortByOptions     |             | array   | -      | () =&gt; settings.filter.sortByOptions |

## Events

| Event name           | Properties                                     | Description                                                                     |
| -------------------- | ---------------------------------------------- | ------------------------------------------------------------------------------- |
| toggle-filter        |                                                | Triggered when the filter is "inverted" (excluding selected values).            |
| contextualize-filter |                                                | Triggered when the filter is "contextualized" (relative to the search results). |
| open-filter-search   | **&lt;anonymous1&gt;** `undefined` - undefined | Triggered when user starts to search in the filter values.                      |

---

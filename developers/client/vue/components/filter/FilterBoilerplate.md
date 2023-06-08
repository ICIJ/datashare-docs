# FilterBoilerplate

> A base component to wrap other filter components. Not intended to be used directly.
> This was created to implement an "extendable" component with template slots because Vue.js doesn't allow to extend
> a component while redefining only "slots" in its templates.

## Props

| Prop name              | Description                                                             | Type    | Values | Default |
| ---------------------- | ----------------------------------------------------------------------- | ------- | ------ | ------- |
| filter                 |                                                                         | object  | -      |         |
| hideHeader             |                                                                         | boolean | -      | false   |
| hideSearch             |                                                                         | boolean | -      | false   |
| hideShowMore           |                                                                         | boolean | -      | false   |
| hideExclude            |                                                                         | boolean | -      | false   |
| hideContextualize      |                                                                         | boolean | -      | false   |
| hideFooter             |                                                                         | boolean | -      | false   |
| hideSort               |                                                                         | boolean | -      | false   |
| showResultsBeforeReady |                                                                         | boolean | -      | false   |
| modelQuery             | Search query on the filter                                              | string  | -      | ''      |
| collapsedIfNoValues    | Etheir or not the items should be collapsed when no values are selected | boolean | -      | true    |
| infiniteScroll         | Either or not results should be loaded on scroll                        | boolean | -      | true    |
| dark                   | Display the filter on dark background                                   | boolean | -      | true    |
| noItemTranslation      | Disable the attempt to translate an item value                          | boolean | -      | false   |

## Events

| Event name          | Properties                                     | Description                                                  |
| ------------------- | ---------------------------------------------- | ------------------------------------------------------------ |
| update:modelQuery   |                                                |
| async-search        | **&lt;anonymous1&gt;** `undefined` - undefined | Triggered when user starts to search in the filter values.   |
| aggregate           |                                                | Triggered when a filter received instruction to be load data |
| reset-filter-values | **&lt;anonymous1&gt;** `undefined` - undefined |
| add-filter-values   | **&lt;anonymous1&gt;** `undefined` - undefined |

## Slots

| Name        | Description | Bindings                       |
| ----------- | ----------- | ------------------------------ |
| header      |             |                                |
| title       |             |                                |
| search      |             |                                |
| items       |             | <br/><br/><br/><br/><br/><br/> |
| all         |             |                                |
| items-group |             | <br/><br/>                     |
| item        |             | <br/><br/><br/>                |

---

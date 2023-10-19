# ColumnChartPicker

> Widget to display the number of file by creation date on the insights page.

## Props

| Prop name         | Description                                                                                                       | Type    | Values | Default   |
| ----------------- | ----------------------------------------------------------------------------------------------------------------- | ------- | ------ | --------- |
| v-model           | Initial values of the range bounds. Should contain two timestamps.<br/>indicating the start and end of the range. | object  | -      | null      |
| data              | The data to visualize (from an ElasticSearch aggregation)                                                         | array   | -      |           |
| interval          | Active interval unit                                                                                              | string  | -      | 'year'    |
| throttle          | Throttle to trigger the update                                                                                    | number  | -      | 1000      |
| columnSnap        | Should or should not "snap" range picker                                                                          | boolean | -      |           |
| columnMargin      | Add a margin to each column                                                                                       | number  | -      | 0         |
| columnHeightRatio | Change the ratio of the columns' height                                                                           | number  | -      | 0.3       |
| variant           | Apply a different variant color to the range picker                                                               | string  | -      | 'warning' |

## Events

| Event name | Properties                           | Description                    |
| ---------- | ------------------------------------ | ------------------------------ |
| update     | **Object** `mixed` - New range value | Fired when the range is update |

---

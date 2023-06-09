# Insight widgets

### Classes

[WidgetDiskUsage](widgets.md#WidgetDiskUsage)

Widget to display the disk space occupied by indexed files on the insights page.

[WidgetDocumentsByCreationDate](widgets.md#WidgetDocumentsByCreationDate)

Widget to display the number of file by creation date on the insights page.

[WidgetDocumentsByCreationDateByPath](widgets.md#WidgetDocumentsByCreationDateByPath)

Widget to display number of files by creation date by path

[WidgetDuplicates](widgets.md#WidgetDuplicates)

Widget for the insights page indicating the proportion of duplicates in the data.

[WidgetEmpty](widgets.md#WidgetEmpty)

Class representing the Empty widget. This widget is not intended to be used directly.

[WidgetEntities](widgets.md#WidgetEntities)

Widget to display text on the insights page

[WidgetFileBarometer](widgets.md#WidgetFileBarometer)

Widget to display the number of indexed files on the insights page

[WidgetListGroup](widgets.md#WidgetListGroup)

Widget to display a list of items or links on the insights page

[WidgetText](widgets.md#WidgetText)

Widget to display text on the insights page

[WidgetTreeMap](widgets.md#WidgetTreeMap)

Class representing the TreeMap widget

### WidgetDiskUsage

Widget to display the disk space occupied by indexed files on the insights page.

**Kind**: global class\


### WidgetDocumentsByCreationDate

Widget to display the number of file by creation date on the insights page.

**Kind**: global class\


### WidgetDocumentsByCreationDateByPath

Widget to display number of files by creation date by path

**Kind**: global class\


### WidgetDuplicates

Widget for the insights page indicating the proportion of duplicates in the data.

**Kind**: global class\


### WidgetEmpty

Class representing the Empty widget. This widget is not intended to be used directly.

**Kind**: global class\


#### new WidgetEmpty(name, card, cols, order)

Create a new WidgetEmpty

| Param | Type      | Default | Description                                                                                                                                                                   |
| ----- | --------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| name  | `string`  |         | Unique name of the widget                                                                                                                                                     |
| card  | `boolean` | `true`  | Is this widget displayed as [card](https://bootstrap-vue.org/docs/components/card) ?                                                                                          |
| cols  | `number`  | `12`    | Number of columns on which the widget should be displayed according to the [Bootstrap's grid system](https://bootstrap-vue.org/docs/components/layout#layout-and-grid-system) |
| order | `number`  | `0`     | Order to display among the others widgets                                                                                                                                     |

### WidgetEntities

Widget to display text on the insights page

**Kind**: global class\


### WidgetFileBarometer

Widget to display the number of indexed files on the insights page

**Kind**: global class\


### WidgetListGroup

Widget to display a list of items or links on the insights page

**Kind**: global class\


#### new WidgetListGroup(title, items, pipeline, options)

Create a new WidgetListGroup

| Param    | Type     | Default                 | Description                        |
| -------- | -------- | ----------------------- | ---------------------------------- |
| title    | `string` | `null`                  | The title of the widget            |
| items    | `Array`  | `[`                     | The list of items to display       |
| pipeline | `string` | `"'widget-list-group'"` | I do not know                      |
| options  | `Object` |                         | See WidgetEmpty for others options |

### WidgetText

Widget to display text on the insights page

**Kind**: global class\


#### new WidgetText(title, content, pipeline, options)

Create a new WidgetText based on a WidgetEmpty

| Param    | Type     | Default           | Description                            |
| -------- | -------- | ----------------- | -------------------------------------- |
| title    | `string` | `null`            | The title of the widget                |
| content  | `string` | `null`            | The content of the widget              |
| pipeline | `string` | `"'widget-text'"` | Transformation to apply to the content |
| options  | `Object` |                   | See WidgetEmpty for others options     |

### WidgetTreeMap

Class representing the TreeMap widget

**Kind**: global class\


#### new WidgetTreeMap(title, index, options)

Create a new WidgetTreeMap based on a WidgetEmpty

| Param   | Type     | Default | Description                             |
| ------- | -------- | ------- | --------------------------------------- |
| title   | `string` | `null`  | The title of the Widget                 |
| index   | `string` |         | The Elasticsearch project of the Widget |
| options | `Object` |         | See WidgetEmpty for others options      |

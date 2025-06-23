# Insight widgets

## WidgetDiskUsage

Widget to display the disk space occupied by indexed files on the insights page.

**Kind**: global class

***

## WidgetDocumentsByCreationDate

Widget to display the number of file by creation date on the insights page.

**Kind**: global class

***

## WidgetDocumentsByCreationDateByPath

Widget to display number of files by creation date by path

**Kind**: global class

***

## WidgetDuplicates

Widget for the insights page indicating the proportion of duplicates in the data.

**Kind**: global class

***

## WidgetEmpty

Class representing the Empty widget. This widget is not intended to be used directly.

**Kind**: global class

***

### new WidgetEmpty(name, card, cols, order)

Create a new WidgetEmpty

| Param | Type    | Default | Description                                                                                                                                                                   |
| ----- | ------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| name  | string  |         | Unique name of the widget                                                                                                                                                     |
| card  | boolean | `true`  | Is this widget displayed as [card](https://bootstrap-vue.org/docs/components/card) ?                                                                                          |
| cols  | number  | `12`    | Number of columns on which the widget should be displayed according to the [Bootstrap's grid system](https://bootstrap-vue.org/docs/components/layout#layout-and-grid-system) |
| order | number  | `0`     | Order to display among the others widgets                                                                                                                                     |

***

## WidgetEntities

Widget to display text on the insights page

**Kind**: global class

***

## WidgetFieldFacets

Widget to display a list of items or links on the insights page

**Kind**: global class

***

### new WidgetFieldFacets(title, field, icon, routeQueryField, bucketTranslation, options)

Create a new WidgetFacets

| Param             | Type   | Default      | Description                        |
| ----------------- | ------ | ------------ | ---------------------------------- |
| title             | string | `null`       | The title of the widget            |
| field             | string | `"\"type\""` | Field to build the facet uppon     |
| icon              | mixed  |              |                                    |
| routeQueryField   | string | `null`       |                                    |
| bucketTranslation | mixed  |              |                                    |
| options           | Object |              | See WidgetEmpty for others options |

***

## WidgetFileBarometer

Widget to display the number of indexed files on the insights page

**Kind**: global class

***

## WidgetListGroup

Widget to display a list of items or links on the insights page

**Kind**: global class

***

### new WidgetListGroup(title, items, pipeline, options)

Create a new WidgetListGroup

| Param    | Type   | Default                 | Description                        |
| -------- | ------ | ----------------------- | ---------------------------------- |
| title    | string | `null`                  | The title of the widget            |
| items    | Array  | `[`                     | The list of items to display       |
| pipeline | string | `"'widget-list-group'"` | I do not know                      |
| options  | Object |                         | See WidgetEmpty for others options |

***

## WidgetNames

Widget to display names

**Kind**: global class

***

## WidgetNested

Widget to display nested widgets

**Kind**: global class

***

### new WidgetNested(widgets, options)

Create a new WidgetProject

| Param   | Type   | Description                        |
| ------- | ------ | ---------------------------------- |
| widgets | Array  | A list of nested widgets           |
| options | Object | See WidgetEmpty for others options |

***

## WidgetProject

Widget to to display a search bar

**Kind**: global class

***

### new WidgetProject(options)

Create a new WidgetProject

| Param   | Type   | Description                        |
| ------- | ------ | ---------------------------------- |
| options | Object | See WidgetEmpty for others options |

***

## WidgetRecommendedBy

Widget to display latest recommend documents.

**Kind**: global class

***

### new WidgetRecommendedBy(hideThumbnails, options)

Create a new WidgetRecommendedBy

| Param          | Type    | Description                             |
| -------------- | ------- | --------------------------------------- |
| hideThumbnails | Boolean | Etheir or not we should hide thumbnails |
| options        | Object  | See WidgetEmpty for others options      |

***

## WidgetSearchBar

Widget to to display a search bar

**Kind**: global class

***

### new WidgetSearchBar(index, options)

Create a new WidgetSearchBar

| Param   | Type   | Description                             |
| ------- | ------ | --------------------------------------- |
| index   | string | The Elasticsearch project of the Widget |
| options | Object | See WidgetEmpty for others options      |

***

## WidgetText

Widget to display text on the insights page

**Kind**: global class

***

### new WidgetText(title, content, pipeline, options)

Create a new WidgetText based on a WidgetEmpty

| Param    | Type   | Default           | Description                            |
| -------- | ------ | ----------------- | -------------------------------------- |
| title    | string | `null`            | The title of the widget                |
| content  | string | `null`            | The content of the widget              |
| pipeline | string | `"'widget-text'"` | Transformation to apply to the content |
| options  | Object |                   | See WidgetEmpty for others options     |

***

## WidgetTreeMap

Class representing the TreeMap widget

**Kind**: global class

***

### new WidgetTreeMap(title, index, options)

Create a new WidgetTreeMap based on a WidgetEmpty

| Param   | Type   | Default | Description                             |
| ------- | ------ | ------- | --------------------------------------- |
| title   | string | `null`  | The title of the Widget                 |
| index   | string |         | The Elasticsearch project of the Widget |
| options | Object |         | See WidgetEmpty for others options      |

***

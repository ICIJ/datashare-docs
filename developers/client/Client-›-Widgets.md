## Classes

<dl>
<dt><a href="#WidgetDiskUsage">WidgetDiskUsage</a></dt>
<dd><p>Widget to display the disk space occupied by indexed files on the insights page.</p>
</dd>
<dt><a href="#WidgetDocumentsByCreationDate">WidgetDocumentsByCreationDate</a></dt>
<dd><p>Widget to display the number of file by creation date on the insights page.</p>
</dd>
<dt><a href="#WidgetDocumentsByCreationDateByPath">WidgetDocumentsByCreationDateByPath</a></dt>
<dd><p>Widget to display number of files by creation date by path</p>
</dd>
<dt><a href="#WidgetDuplicates">WidgetDuplicates</a></dt>
<dd><p>Widget for the insights page indicating the proportion of duplicates in the data.</p>
</dd>
<dt><a href="#WidgetEmpty">WidgetEmpty</a></dt>
<dd><p>Class representing the Empty widget. This widget is not intended to be used directly.</p>
</dd>
<dt><a href="#WidgetEntities">WidgetEntities</a></dt>
<dd><p>Widget to display text on the insights page</p>
</dd>
<dt><a href="#WidgetFileBarometer">WidgetFileBarometer</a></dt>
<dd><p>Widget to display the number of indexed files on the insights page</p>
</dd>
<dt><a href="#WidgetListGroup">WidgetListGroup</a></dt>
<dd><p>Widget to display a list of items or links on the insights page</p>
</dd>
<dt><a href="#WidgetText">WidgetText</a></dt>
<dd><p>Widget to display text on the insights page</p>
</dd>
<dt><a href="#WidgetTreeMap">WidgetTreeMap</a></dt>
<dd><p>Class representing the TreeMap widget</p>
</dd>
</dl>

<a name="WidgetDiskUsage"></a>

## WidgetDiskUsage
Widget to display the disk space occupied by indexed files on the insights page.

**Kind**: global class  
<a name="WidgetDocumentsByCreationDate"></a>

## WidgetDocumentsByCreationDate
Widget to display the number of file by creation date on the insights page.

**Kind**: global class  
<a name="WidgetDocumentsByCreationDateByPath"></a>

## WidgetDocumentsByCreationDateByPath
Widget to display number of files by creation date by path

**Kind**: global class  
<a name="WidgetDuplicates"></a>

## WidgetDuplicates
Widget for the insights page indicating the proportion of duplicates in the data.

**Kind**: global class  
<a name="WidgetEmpty"></a>

## WidgetEmpty
Class representing the Empty widget. This widget is not intended to be used directly.

**Kind**: global class  
<a name="new_WidgetEmpty_new"></a>

### new WidgetEmpty(name, card, cols, order)
Create a new WidgetEmpty


| Param | Type | Default | Description |
| --- | --- | --- | --- |
| name | <code>string</code> |  | Unique name of the widget |
| card | <code>boolean</code> | <code>true</code> | Is this widget displayed as [card](https://bootstrap-vue.org/docs/components/card) ? |
| cols | <code>number</code> | <code>12</code> | Number of columns on which the widget should be displayed according to the [Bootstrap's grid system](https://bootstrap-vue.org/docs/components/layout#layout-and-grid-system) |
| order | <code>number</code> | <code>0</code> | Order to display among the others widgets |

<a name="WidgetEntities"></a>

## WidgetEntities
Widget to display text on the insights page

**Kind**: global class  
<a name="WidgetFileBarometer"></a>

## WidgetFileBarometer
Widget to display the number of indexed files on the insights page

**Kind**: global class  
<a name="WidgetListGroup"></a>

## WidgetListGroup
Widget to display a list of items or links on the insights page

**Kind**: global class  
<a name="new_WidgetListGroup_new"></a>

### new WidgetListGroup(title, items, pipeline, options)
Create a new WidgetListGroup


| Param | Type | Default | Description |
| --- | --- | --- | --- |
| title | <code>string</code> | <code>null</code> | The title of the widget |
| items | <code>Array</code> | <code>[</code> | The list of items to display |
| pipeline | <code>string</code> | <code>&quot;&#x27;widget-list-group&#x27;&quot;</code> | I do not know |
| options | <code>Object</code> |  | See WidgetEmpty for others options |

<a name="WidgetText"></a>

## WidgetText
Widget to display text on the insights page

**Kind**: global class  
<a name="new_WidgetText_new"></a>

### new WidgetText(title, content, pipeline, options)
Create a new WidgetText based on a WidgetEmpty


| Param | Type | Default | Description |
| --- | --- | --- | --- |
| title | <code>string</code> | <code>null</code> | The title of the widget |
| content | <code>string</code> | <code>null</code> | The content of the widget |
| pipeline | <code>string</code> | <code>&quot;&#x27;widget-text&#x27;&quot;</code> | Transformation to apply to the content |
| options | <code>Object</code> |  | See WidgetEmpty for others options |

<a name="WidgetTreeMap"></a>

## WidgetTreeMap
Class representing the TreeMap widget

**Kind**: global class  
<a name="new_WidgetTreeMap_new"></a>

### new WidgetTreeMap(title, index, options)
Create a new WidgetTreeMap based on a WidgetEmpty


| Param | Type | Default | Description |
| --- | --- | --- | --- |
| title | <code>string</code> | <code>null</code> | The title of the Widget |
| index | <code>string</code> |  | The Elasticsearch project of the Widget |
| options | <code>Object</code> |  | See WidgetEmpty for others options |


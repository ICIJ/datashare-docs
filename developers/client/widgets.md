# Insight widgets 

<a id="widgetdiskusage"></a>

## WidgetDiskUsage

Widget to display the disk space occupied by indexed files on the insights page.

**Kind**: global class  

*****

<a id="widgetdocumentsbycreationdate"></a>

## WidgetDocumentsByCreationDate

Widget to display the number of file by creation date on the insights page.

**Kind**: global class  

*****

<a id="widgetdocumentsbycreationdatebypath"></a>

## WidgetDocumentsByCreationDateByPath

Widget to display number of files by creation date by path

**Kind**: global class  

*****

<a id="widgetduplicates"></a>

## WidgetDuplicates

Widget for the insights page indicating the proportion of duplicates in the data.

**Kind**: global class  

*****

<a id="widgetempty"></a>

## WidgetEmpty

Class representing the Empty widget. This widget is not intended to be used directly.

**Kind**: global class  

*****

<a id="new-widgetempty-new"></a>

### new WidgetEmpty(name, card, cols, order)

Create a new WidgetEmpty

<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td>string</td><td></td><td><p>Unique name of the widget</p>
</td>
    </tr><tr>
    <td>card</td><td>boolean</td><td><code>true</code></td><td><p>Is this widget displayed as <a href="https://bootstrap-vue.org/docs/components/card">card</a> ?</p>
</td>
    </tr><tr>
    <td>cols</td><td>number</td><td><code>12</code></td><td><p>Number of columns on which the widget should be displayed according to the
<a href="https://bootstrap-vue.org/docs/components/layout#layout-and-grid-system">Bootstrap&#39;s grid system</a></p>
</td>
    </tr><tr>
    <td>order</td><td>number</td><td><code>0</code></td><td><p>Order to display among the others widgets</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="widgetentities"></a>

## WidgetEntities

Widget to display text on the insights page

**Kind**: global class  

*****

<a id="widgetfilebarometer"></a>

## WidgetFileBarometer

Widget to display the number of indexed files on the insights page

**Kind**: global class  

*****

<a id="widgetlistgroup"></a>

## WidgetListGroup

Widget to display a list of items or links on the insights page

**Kind**: global class  

*****

<a id="new-widgetlistgroup-new"></a>

### new WidgetListGroup(title, items, pipeline, options)

Create a new WidgetListGroup

<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>title</td><td>string</td><td><code>null</code></td><td><p>The title of the widget</p>
</td>
    </tr><tr>
    <td>items</td><td>Array</td><td><code>[</code></td><td><p>The list of items to display</p>
</td>
    </tr><tr>
    <td>pipeline</td><td>string</td><td><code>&quot;&#x27;widget-list-group&#x27;&quot;</code></td><td><p>I do not know</p>
</td>
    </tr><tr>
    <td>options</td><td>Object</td><td></td><td><p>See WidgetEmpty for others options</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="widgetnames"></a>

## WidgetNames

Widget to display names

**Kind**: global class  

*****

<a id="widgetsearchbar"></a>

## WidgetSearchBar

Widget to to display a search bar

**Kind**: global class  

*****

<a id="new-widgetsearchbar-new"></a>

### new WidgetSearchBar(index, options)

Create a new WidgetSearchBar

<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>index</td><td>string</td><td><p>The Elasticsearch project of the Widget</p>
</td>
    </tr><tr>
    <td>options</td><td>Object</td><td><p>See WidgetEmpty for others options</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="widgettext"></a>

## WidgetText

Widget to display text on the insights page

**Kind**: global class  

*****

<a id="new-widgettext-new"></a>

### new WidgetText(title, content, pipeline, options)

Create a new WidgetText based on a WidgetEmpty

<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>title</td><td>string</td><td><code>null</code></td><td><p>The title of the widget</p>
</td>
    </tr><tr>
    <td>content</td><td>string</td><td><code>null</code></td><td><p>The content of the widget</p>
</td>
    </tr><tr>
    <td>pipeline</td><td>string</td><td><code>&quot;&#x27;widget-text&#x27;&quot;</code></td><td><p>Transformation to apply to the content</p>
</td>
    </tr><tr>
    <td>options</td><td>Object</td><td></td><td><p>See WidgetEmpty for others options</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="widgettreemap"></a>

## WidgetTreeMap

Class representing the TreeMap widget

**Kind**: global class  

*****

<a id="new-widgettreemap-new"></a>

### new WidgetTreeMap(title, index, options)

Create a new WidgetTreeMap based on a WidgetEmpty

<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>title</td><td>string</td><td><code>null</code></td><td><p>The title of the Widget</p>
</td>
    </tr><tr>
    <td>index</td><td>string</td><td></td><td><p>The Elasticsearch project of the Widget</p>
</td>
    </tr><tr>
    <td>options</td><td>Object</td><td></td><td><p>See WidgetEmpty for others options</p>
</td>
    </tr>  </tbody>
</table>


*****


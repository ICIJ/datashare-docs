# TreeBreadcrumb

> A clickable path breadcrumb.

## Props

| Prop name      | Description                                                                           | Type                  | Values | Default  |
| -------------- | ------------------------------------------------------------------------------------- | --------------------- | ------ | -------- |
| v-model        | Path to use in the breadcrumb.<br/>`@model` true                                      | string                | -      |          |
| maxDirectories | Maximum number of directories to display (truncate from the beginning using ellipsis) | number                | -      | 5        |
| noDatadir      | Hide Datashare's root data directory from the breadcrumb.                             | boolean               | -      |          |
| datadirIcon    | Data directory icon                                                                   | string\|object\|array | -      | 'folder' |
| datadirLabel   | Use a label next to the datadir icon                                                  | boolean               | -      | false    |

## Events

| Event name | Properties | Description |
| ---------- | ---------- | ----------- |
| input      |            |

---

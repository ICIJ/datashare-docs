# JSDoc

This documentation helps you create plugins for Datashare client. All methods currently exposed in the [Core](api.md#Core) class are available to a global variable called `datashare`.

**Example**

```js
datashare.replaceWidget('default-text', {
  card: true,
  cols: 6,
  type: 'WidgetText',
  content: "Welcome to my amazing project dashboard!",
  title: "Secret Project",
  order: "-1"
})
```

## Core

Class representing the core application with public methods for plugins.

**Kind**: global class\
**Mixes**: [`FiltersMixin`](api.md#filtersmixin), [`HooksMixin`](api.md#hooksmixin), [`I18nMixin`](api.md#i-nmixin), [`PipelinesMixin`](api.md#pipelinesmixin), [`ProjectsMixin`](api.md#projectsmixin), [`WidgetsMixin`](api.md#widgetsmixin)

* [Core](api.md#core)
  * [new Core(api, mode)](api.md#new-core-new)
  * _instance_
    * [.ready](api.md#core-ready) : Promise.\<Object>
    * [~~.app~~](api.md#core-app) ~~:~~ [~~`Core`~~](api.md#core)
    * [.core](api.md#core-core) : [`Core`](api.md#core)
    * [.bootstrapVue](api.md#core-bootstrapvue) ⇒ Plugin
    * [.i18n](api.md#core-i-n) : I18n
    * [.router](api.md#core-router) : VueRouter
    * [.store](api.md#core-store) : Vuex.Store
    * [.plugin](api.md#core-plugin) ⇒ \*
    * [.auth](api.md#core-auth) : Auth
    * [.config](api.md#core-config) : Object
    * [.api](api.md#core-api) : Api
    * [.vue](api.md#core-vue) : Vue
    * [.wait](api.md#core-wait) : VueWait
    * [.mode](api.md#core-mode) : String
    * [.use(Plugin, options)](api.md#core-use) ⇒ [`Core`](api.md#core)
    * [.useAll()](api.md#core-useall) ⇒ [`Core`](api.md#core)
    * [.useI18n()](api.md#core-usei-n) ⇒ [`Core`](api.md#core)
    * [.useBootstrapVue()](api.md#core-usebootstrapvue) ⇒ [`Core`](api.md#core)
    * [.useRouter()](api.md#core-userouter) ⇒ [`Core`](api.md#core)
    * [.useVuex()](api.md#core-usevuex) ⇒ [`Core`](api.md#core)
    * [.useCommons()](api.md#core-usecommons) ⇒ [`Core`](api.md#core)
    * [.useWait()](api.md#core-usewait) ⇒ [`Core`](api.md#core)
    * [.useCore()](api.md#core-usecore) ⇒ [`Core`](api.md#core)
    * [.buildCorePlugin()](api.md#core-buildcoreplugin) ⇒ VueCore
    * [.configure()](api.md#core-configure) ⇒ Promise.\<Object>
    * [.mount(\[selector\])](api.md#core-mount) ⇒ Vue
    * [.defer()](api.md#core-defer)
    * [.dispatch(name, ...args)](api.md#core-dispatch) ⇒ [`Core`](api.md#core)
    * [.getUser()](api.md#core-getuser) ⇒ Promise.\<Object>
    * [.loadUser()](api.md#core-loaduser) ⇒ Promise
    * [.loadSettings()](api.md#core-loadsettings) ⇒ Promise
    * [.setPageTitle(title, \[suffix\])](api.md#core-setpagetitle)
    * [.on(event, callback)](api.md#core-on)
    * [.off(event, callback)](api.md#core-off)
    * [.emit(event, payload)](api.md#core-emit)
  * _static_
    * [.init(...options)](api.md#core-init) ⇒ [`Core`](api.md#core)

***

### new Core(api, mode)

Create an application

| Param | Default | Description                                 |
| ----- | ------- | ------------------------------------------- |
| api   |         | Datashare api interface                     |
| mode  |         | mode of authentication ('local' or 'server' |

***

### datashare.ready : Promise.\<Object>

Get a promise that is resolved when the application is ready

**Kind**: instance property of [`Core`](api.md#core)\
**Fullfil**: Object The actual application core instance.

***

### ~~datashare.app :~~ [~~`Core`~~](api.md#core)

_**Deprecated**_

The application core instance. Deprecated in favor or the `core` property.

**Kind**: instance property of [`Core`](api.md#core)

***

### datashare.core : [`Core`](api.md#core)

The application core instance

**Kind**: instance property of [`Core`](api.md#core)

***

### datashare.bootstrapVue ⇒ Plugin

The Bootstrap Vue plugin instance.

**Kind**: instance property of [`Core`](api.md#core)

***

### datashare.i18n : I18n

The I18n instance

**Kind**: instance property of [`Core`](api.md#core)

***

### datashare.router : VueRouter

The VueRouter instance

**Kind**: instance property of [`Core`](api.md#core)

***

### datashare.store : Vuex.Store

The Vuex instance

**Kind**: instance property of [`Core`](api.md#core)

***

### datashare.plugin ⇒ \*

The CorePlugin instance

**Kind**: instance property of [`Core`](api.md#core)

***

### datashare.auth : Auth

The Auth module instance

**Kind**: instance property of [`Core`](api.md#core)

***

### datashare.config : Object

The configuration object provided by Murmur

**Kind**: instance property of [`Core`](api.md#core)

***

### datashare.api : Api

The Datashare api interface

**Kind**: instance property of [`Core`](api.md#core)

***

### datashare.vue : Vue

The Vue app

**Kind**: instance property of [`Core`](api.md#core)

***

### datashare.wait : VueWait

The VueWait

**Kind**: instance property of [`Core`](api.md#core)

***

### datashare.mode : String

Get current Datashare mode

**Kind**: instance property of [`Core`](api.md#core)

***

### datashare.use(Plugin, options) ⇒ [`Core`](api.md#core)

Add a Vue plugin to the app

**Kind**: instance method of [`Core`](api.md#core)\
**Returns**: [`Core`](api.md#core) - the current instance of Core

| Param   | Type   | Description                  |
| ------- | ------ | ---------------------------- |
| Plugin  | Object | The actual Vue plugin class  |
| options | Object | Option to pass to the plugin |

***

### datashare.useAll() ⇒ [`Core`](api.md#core)

Configure all default Vue plugins for this application

**Kind**: instance method of [`Core`](api.md#core)\
**Returns**: [`Core`](api.md#core) - the current instance of Core

***

### datashare.useI18n() ⇒ [`Core`](api.md#core)

Configure vue-i18n plugin

**Kind**: instance method of [`Core`](api.md#core)\
**Returns**: [`Core`](api.md#core) - the current instance of Core

***

### datashare.useBootstrapVue() ⇒ [`Core`](api.md#core)

Configure bootstrap-vue plugin

**Kind**: instance method of [`Core`](api.md#core)\
**Returns**: [`Core`](api.md#core) - the current instance of Core

***

### datashare.useRouter() ⇒ [`Core`](api.md#core)

Configure vue-router plugin

**Kind**: instance method of [`Core`](api.md#core)\
**Returns**: [`Core`](api.md#core) - the current instance of Core

***

### datashare.useVuex() ⇒ [`Core`](api.md#core)

Configure vuex plugin

**Kind**: instance method of [`Core`](api.md#core)\
**Returns**: [`Core`](api.md#core) - the current instance of Core

***

### datashare.useCommons() ⇒ [`Core`](api.md#core)

Configure most common Vue plugins (Murmur, VueShortkey, VueScrollTo and VueCalendar)

**Kind**: instance method of [`Core`](api.md#core)\
**Returns**: [`Core`](api.md#core) - the current instance of Core

***

### datashare.useWait() ⇒ [`Core`](api.md#core)

Configure vue-wait plugin

**Kind**: instance method of [`Core`](api.md#core)\
**Returns**: [`Core`](api.md#core) - the current instance of Core

***

### datashare.useCore() ⇒ [`Core`](api.md#core)

Add a $core property to the instance's Vue

**Kind**: instance method of [`Core`](api.md#core)\
**Returns**: [`Core`](api.md#core) - the current instance of Core

***

### datashare.buildCorePlugin() ⇒ VueCore

Build a VueCore instance with the current Core instance as parameter of the global properties.

**Kind**: instance method of [`Core`](api.md#core)

***

### datashare.configure() ⇒ Promise.\<Object>

Load settings from the server and instantiate most the application configuration.

**Kind**: instance method of [`Core`](api.md#core)\
**Fullfil**: [`Core`](api.md#core) - The instance of the core application\
**Reject**: Object - The Error object

***

### datashare.mount(\[selector]) ⇒ Vue

Mount the instance's vue application

**Kind**: instance method of [`Core`](api.md#core)\
**Returns**: Vue - The instantiated Vue

| Param       | Type   | Default | Description                          |
| ----------- | ------ | ------- | ------------------------------------ |
| \[selector] | String | `#app`  | Query selector to the mounting point |

***

### datashare.defer()

Build a promise to be resolved when the application is configured.

**Kind**: instance method of [`Core`](api.md#core)

***

### datashare.dispatch(name, ...args) ⇒ [`Core`](api.md#core)

Dispatch an event from the document root, passing the core application through event message.

**Kind**: instance method of [`Core`](api.md#core)\
**Returns**: [`Core`](api.md#core) - the current instance of Core

| Param   | Type   | Description                            |
| ------- | ------ | -------------------------------------- |
| name    | String | Name of the event to fire              |
| ...args | Mixed  | Additional params to pass to the event |

***

### datashare.getUser() ⇒ Promise.\<Object>

Get the current signed user.

**Kind**: instance method of [`Core`](api.md#core)\
**Fullfil**: Object Current user

***

### datashare.loadUser() ⇒ Promise

Get and update user definition in place

**Kind**: instance method of [`Core`](api.md#core)

***

### datashare.loadSettings() ⇒ Promise

Get settings (both from the server settings and the current mode)

**Kind**: instance method of [`Core`](api.md#core)

***

### datashare.setPageTitle(title, \[suffix])

Append the given title to the page title

**Kind**: instance method of [`Core`](api.md#core)

| Param     | Type   | Default     | Description                 |
| --------- | ------ | ----------- | --------------------------- |
| title     | String |             | Title to append to the page |
| \[suffix] | String | `Datashare` | Suffix to the title         |

***

### datashare.on(event, callback)

Register a callback to an event using the EventBus singleton.

**Kind**: instance method of [`Core`](api.md#core)

| Param    | Type   |
| -------- | ------ |
| event    | String |
| callback | \*     |

***

### datashare.off(event, callback)

Unregister a callback to an event using the EventBus singleton.

**Kind**: instance method of [`Core`](api.md#core)

| Param    | Type   |
| -------- | ------ |
| event    | String |
| callback | \*     |

***

### datashare.emit(event, payload)

Emit an event using the EventBus singleton.

**Kind**: instance method of [`Core`](api.md#core)

| Param   | Type   |
| ------- | ------ |
| event   | String |
| payload | \*     |

***

### Core.init(...options) ⇒ [`Core`](api.md#core)

instantiate a Core class (useful for chaining usage or mapping)

**Kind**: static method of [`Core`](api.md#core)

| Param      | Type  | Description                             |
| ---------- | ----- | --------------------------------------- |
| ...options | Mixed | Options to pass to the Core constructor |

***

## ComponentMixin

Mixin class extending the core to add helpers for components.

**Kind**: global mixin

***

## FiltersMixin

Mixin class extending the core to add helpers for filters.

**Kind**: global mixin

* [FiltersMixin](api.md#filtersmixin)
  * [.registerFilter(...args)](api.md#filtersmixin-registerfilter)
  * [.unregisterFilter(name)](api.md#filtersmixin-unregisterfilter)
  * [.registerFilterForProject(name, ...args)](api.md#filtersmixin-registerfilterforproject)
  * [.unregisterFilterForProject(name, name)](api.md#filtersmixin-unregisterfilterforproject)

***

### datashare.registerFilter(...args)

Register a filter

**Kind**: instance method of [`FiltersMixin`](api.md#filtersmixin)

| Param                             | Type     | Default   | Description                                                               |
| --------------------------------- | -------- | --------- | ------------------------------------------------------------------------- |
| ...args                           | Mixed    |           | Filter's params.                                                          |
| args.type                         | String   |           | Type of the filter.                                                       |
| args.options                      | Object   |           | Options to pass to the filter constructor.                                |
| args.options.name                 | String   |           | Name of the filter.                                                       |
| args.options.key                  | String   |           | Key of the filter. Typically ElasticSearch field name.                    |
| \[args.options.icon]              | String   |           | Icon of the filter.                                                       |
| \[args.options.isSearchable]      | Boolean  | `false`   | Set if this filter should be searchable or not.                           |
| \[args.options.alternativeSearch] | function | `()=>{})` | Set a function about how to transform query term before searching for it. |
| \[args.options.order]             | Number   |           | Order of the filter. Will be added as last filter by default.             |

***

### datashare.unregisterFilter(name)

Unregister a filter

**Kind**: instance method of [`FiltersMixin`](api.md#filtersmixin)

| Param | Type   | Description                      |
| ----- | ------ | -------------------------------- |
| name  | String | Name of the filter to unregister |

***

### datashare.registerFilterForProject(name, ...args)

Register a filter only for a specific project

**Kind**: instance method of [`FiltersMixin`](api.md#filtersmixin)

| Param        | Type   | Description                               |
| ------------ | ------ | ----------------------------------------- |
| name         | String | Name of the project                       |
| ...args      | Mixed  | Filter's options.                         |
| args.name    | String | Name of the filter                        |
| args.type    | String | Type of the filter.                       |
| args.options | Object | Options to pass to the filter constructor |

***

### datashare.unregisterFilterForProject(name, name)

Unregister a filter only for a specific project

**Kind**: instance method of [`FiltersMixin`](api.md#filtersmixin)

| Param | Type   | Description         |
| ----- | ------ | ------------------- |
| name  | String | Name of the project |
| name  | String | Name of the filter  |

***

## HooksMixin

Mixin class extending the core to add helpers for hooks.

**Kind**: global mixin

* [HooksMixin](api.md#hooksmixin)
  * [.registerHook(...args)](api.md#hooksmixin-registerhook)
  * [.unregisterHook(name)](api.md#hooksmixin-unregisterhook)
  * [.resetHook(name)](api.md#hooksmixin-resethook)
  * [.resetHooks()](api.md#hooksmixin-resethooks)
  * [.registerHookForProject(project, options)](api.md#hooksmixin-registerhookforproject)

***

### datashare.registerHook(...args)

Register a hook

**Kind**: instance method of [`HooksMixin`](api.md#hooksmixin)

| Param           | Type   | Description                             |
| --------------- | ------ | --------------------------------------- |
| ...args         | Mixed  | Hook's options                          |
| args.name       | String | Name of the hook                        |
| args.target     | String | Target of the hook                      |
| args.order      | Number | Priority of the hook                    |
| args.definition | Object | Options to pass to the hook constructor |

***

### datashare.unregisterHook(name)

Unregister a specific hook

**Kind**: instance method of [`HooksMixin`](api.md#hooksmixin)

| Param | Type   | Description      |
| ----- | ------ | ---------------- |
| name  | String | Name of the hook |

***

### datashare.resetHook(name)

Unregister all hooks from a target

**Kind**: instance method of [`HooksMixin`](api.md#hooksmixin)

| Param | Type   | Description        |
| ----- | ------ | ------------------ |
| name  | String | Name of the target |

***

### datashare.resetHooks()

Unregister all hooks, on every targets

**Kind**: instance method of [`HooksMixin`](api.md#hooksmixin)

***

### datashare.registerHookForProject(project, options)

Register a hook for a specific project

**Kind**: instance method of [`HooksMixin`](api.md#hooksmixin)

| Param              | Type   | Description                             |
| ------------------ | ------ | --------------------------------------- |
| project            | String | Project to add this hook to             |
| options            | Object | Hook's options                          |
| options.name       | String | Name of the hook                        |
| options.target     | String | Target of the hook                      |
| options.order      | Number | Priority of the hook                    |
| options.definition | Object | Options to pass to the hook constructor |

***

## I18nMixin

Mixin class extending the core to add helpers for i18n.

**Kind**: global mixin

* [I18nMixin](api.md#i-nmixin)
  * [.initializeI18n()](api.md#i-nmixin-initializei-n) ⇒ Promise
  * [.setI18nLocale(locale)](api.md#i-nmixin-seti-nlocale) ⇒ String
  * [.hasI18Locale(locale)](api.md#i-nmixin-hasi-locale) ⇒ Boolean
  * [.loadI18Locale(locale)](api.md#i-nmixin-loadi-locale) ⇒ Promise

***

### datashare.initializeI18n() ⇒ Promise

Initialize i18N using the local storage and load the necessary locale's messages

**Kind**: instance method of [`I18nMixin`](api.md#i-nmixin)

***

### datashare.setI18nLocale(locale) ⇒ String

Set the active locale both in local stoage and VueI18n.

**Kind**: instance method of [`I18nMixin`](api.md#i-nmixin)

| Param  | Type   | Description                            |
| ------ | ------ | -------------------------------------- |
| locale | String | Key of the local (fr, de, en, ja, ...) |

***

### datashare.hasI18Locale(locale) ⇒ Boolean

Check the given locale storage was loaded.

**Kind**: instance method of [`I18nMixin`](api.md#i-nmixin)

| Param  | Type   | Description                            |
| ------ | ------ | -------------------------------------- |
| locale | String | Key of the local (fr, de, en, ja, ...) |

***

### datashare.loadI18Locale(locale) ⇒ Promise

Load i18n messages for the given locale (if needed) and set it as the current locale.

**Kind**: instance method of [`I18nMixin`](api.md#i-nmixin)

| Param  | Type   | Description                            |
| ------ | ------ | -------------------------------------- |
| locale | String | Key of the local (fr, de, en, ja, ...) |

***

## PipelinesMixin

Mixin class extending the core to add helpers for pipelines.

**Kind**: global mixin

* [PipelinesMixin](api.md#pipelinesmixin)
  * [.registerPipeline(...args, category)](api.md#pipelinesmixin-registerpipeline)
  * [.unregisterPipeline(name)](api.md#pipelinesmixin-unregisterpipeline)
  * [.registerPipelineForProject(project, ...args, category)](api.md#pipelinesmixin-registerpipelineforproject)
  * [.unregisterPipelineForProject(project, name)](api.md#pipelinesmixin-unregisterpipelineforproject)

***

### datashare.registerPipeline(...args, category)

Register a pipeline

**Kind**: instance method of [`PipelinesMixin`](api.md#pipelinesmixin)

| Param     | Type               | Description            |
| --------- | ------------------ | ---------------------- |
| ...args   | Mixed              | Pipeline's options.    |
| args.name | String             | Name of the pipeline   |
| args.type | String \| function | Type of the pipeline.  |
| category  | String             | The pipeline to target |

***

### datashare.unregisterPipeline(name)

Unregister a pipeline

**Kind**: instance method of [`PipelinesMixin`](api.md#pipelinesmixin)

| Param | Type   | Description          |
| ----- | ------ | -------------------- |
| name  | String | Name of the pipeline |

***

### datashare.registerPipelineForProject(project, ...args, category)

Register a pipeline for a specific project

**Kind**: instance method of [`PipelinesMixin`](api.md#pipelinesmixin)

| Param     | Type               | Description            |
| --------- | ------------------ | ---------------------- |
| project   | String             | Name of the project    |
| ...args   | Mixed              | Pipeline's options.    |
| args.name | String             | Name of the pipeline   |
| args.type | String \| function | Type of the pipeline.  |
| category  | String             | The pipeline to target |

***

### datashare.unregisterPipelineForProject(project, name)

Unregister a pipeline for a specific project

**Kind**: instance method of [`PipelinesMixin`](api.md#pipelinesmixin)

| Param   | Type   | Description          |
| ------- | ------ | -------------------- |
| project | String | Name of the project  |
| name    | String | Name of the pipeline |

***

## ProjectsMixin

Mixin class extending the core to add helpers for projects.

**Kind**: global mixin

* [ProjectsMixin](api.md#projectsmixin)
  * [.toggleForProject(name, withFn, withoutFn, mutationType, storePath)](api.md#projectsmixin-toggleforproject)
  * [.createDefaultProject()](api.md#projectsmixin-createdefaultproject) ⇒ Promise:Object

***

### datashare.toggleForProject(name, withFn, withoutFn, mutationType, storePath)

Call a function when a project is selected

**Kind**: instance method of [`ProjectsMixin`](api.md#projectsmixin)

| Param        | Type     | Description                                     |
| ------------ | -------- | ----------------------------------------------- |
| name         | String   | Name of the project                             |
| withFn       | function | Function to call when the project is selected   |
| withoutFn    | function | Function to call when the project is unselected |
| mutationType | String   | Mutation type that will be watched for changes. |
| storePath    | String   | Path to the project in the store                |

***

### datashare.createDefaultProject() ⇒ Promise:Object

Create a default project on Datashare using the API

**Kind**: instance method of [`ProjectsMixin`](api.md#projectsmixin)\
**Returns**: Promise:Object - The HTTP response object

***

## WidgetsMixin

Mixin class extending the core to add helpers for widgets.

**Kind**: global mixin

* [WidgetsMixin](api.md#widgetsmixin)
  * [.registerWidget(...args)](api.md#widgetsmixin-registerwidget)
  * [.unregisterWidget(name)](api.md#widgetsmixin-unregisterwidget)
  * [.clearWidgets()](api.md#widgetsmixin-clearwidgets)
  * [.registerWidgetForProject(project, options)](api.md#widgetsmixin-registerwidgetforproject)
  * [.replaceWidget(name, options)](api.md#widgetsmixin-replacewidget)
  * [.replaceWidgetForProject(project, name, options)](api.md#widgetsmixin-replacewidgetforproject)

***

### datashare.registerWidget(...args)

Register a widget

**Kind**: instance method of [`WidgetsMixin`](api.md#widgetsmixin)

| Param        | Type    | Default       | Description                                                           |
| ------------ | ------- | ------------- | --------------------------------------------------------------------- |
| ...args      | Mixed   |               | Widget's options passed to widget constructor                         |
| args.name    | String  |               | Name of the widget                                                    |
| args.card    | Boolean |               | Either or not this widget should be a `card` component from Boostrap. |
| args.cols    | Number  |               | Number of columns to fill in the grid (from 1 to 12)                  |
| \[args.type] | String  | `WidgetEmpty` | Type of the widget                                                    |

***

### datashare.unregisterWidget(name)

Unregister a widget

**Kind**: instance method of [`WidgetsMixin`](api.md#widgetsmixin)

| Param | Type   | Description                      |
| ----- | ------ | -------------------------------- |
| name  | String | Name of the widget to unregister |

***

### datashare.clearWidgets()

Unregister all widgets

**Kind**: instance method of [`WidgetsMixin`](api.md#widgetsmixin)

***

### datashare.registerWidgetForProject(project, options)

Register a widget for a specific project

**Kind**: instance method of [`WidgetsMixin`](api.md#widgetsmixin)

| Param           | Type    | Default       | Description                                                          |
| --------------- | ------- | ------------- | -------------------------------------------------------------------- |
| project         | String  |               | Name of the project to add this widget to                            |
| options         | Object  |               | Widget's options passed to widget constructor                        |
| options.name    | String  |               | Name of the widget                                                   |
| options.card    | Boolean |               | Either or not this widget should be a `card` component from Boostrap |
| options.cols    | Number  |               | Number of columns to fill in the grid (from 1 to 12)                 |
| \[options.type] | String  | `WidgetEmpty` | Type of the widget                                                   |

***

### datashare.replaceWidget(name, options)

Replace an existing widget

**Kind**: instance method of [`WidgetsMixin`](api.md#widgetsmixin)

| Param           | Type    | Default       | Description                                                          |
| --------------- | ------- | ------------- | -------------------------------------------------------------------- |
| name            | String  |               | Name of the widget to replace                                        |
| options         | Object  |               | Widget's options passed to widget constructor.                       |
| options.card    | Boolean |               | Either or not this widget should be a `card` component from Boostrap |
| options.cols    | Number  |               | Number of columns to fill in the grid (from 1 to 12)                 |
| \[options.type] | String  | `WidgetEmpty` | Type of the widget                                                   |

**Example**

```js
datashare.replaceWidget('default-text', {
 card: true,
 cols: 6,
 type: 'WidgetText',
 content: "Welcome to my amazing project dashboard!",
 title: "Secret Project",
 order: "-1"
})
```

***

### datashare.replaceWidgetForProject(project, name, options)

Replace an existing widget for a specific project

**Kind**: instance method of [`WidgetsMixin`](api.md#widgetsmixin)

| Param           | Type    | Default       | Description                                                                                         |
| --------------- | ------- | ------------- | --------------------------------------------------------------------------------------------------- |
| project         | String  |               | Name of the project to add this widget to                                                           |
| name            | String  |               | Name of the widget to replace                                                                       |
| options         | Object  |               | Widget's options passed to widget constructor. Each widget class can define its own default values. |
| options.card    | Boolean |               | Either or not this widget should be a `card` component from Boostrap                                |
| options.cols    | Number  |               | Number of columns to fill in the grid (from 1 to 12)                                                |
| \[options.type] | String  | `WidgetEmpty` | Type of the widget                                                                                  |

***

## projects ⇒ Array:String

List all projects this user has access to.

**Kind**: global variable

***

## projectIds ⇒ Array:String

List all projects name ids this user has access to.

**Kind**: global variable

***

## defaultProject ⇒ String

Get the name of the default project

**Kind**: global variable

***

## findComponent(name) ⇒ Promise.<(object|null)>

Asynchronously find a component in the lazyComponents object by its name.

**Kind**: global function\
**Returns**: Promise.<(object|null)> - - A promise that resolves with the found component object, or null if not found.

| Param | Type   | Description                        |
| ----- | ------ | ---------------------------------- |
| name  | string | The name of the component to find. |

***

## getComponent(name) ⇒ Promise.<(object|Error)>

Asynchronously get a component from the lazyComponents object based on its name.

**Kind**: global function\
**Returns**: Promise.<(object|Error)> - - A promise that resolves with the found component object, or rejects with an Error if not found.

| Param | Type   | Description                            |
| ----- | ------ | -------------------------------------- |
| name  | string | The name of the component to retrieve. |

***

## sameComponentNames(...names) ⇒ boolean

Check if multiple component names are the same when slugified.

**Kind**: global function\
**Returns**: boolean - - True if all names are the same when slugified, false otherwise.

| Param    | Type   | Description                     |
| -------- | ------ | ------------------------------- |
| ...names | string | The component names to compare. |

***

## componentNameSlug(name) ⇒ string

Generate a slug from the component name using kebab case and lowercase.

**Kind**: global function\
**Returns**: string - - The slugified component name.

| Param | Type   | Description                           |
| ----- | ------ | ------------------------------------- |
| name  | string | The name of the component to slugify. |

***

## lazyComponents() ⇒ Object

Get the lazyComponents object using require.context for lazy loading of components.

**Kind**: global function\
**Returns**: Object - - The lazyComponents object generated using require.context.

***

## defaultProjectExists() ⇒ Promise:Boolean

Return true if the default project exists

**Kind**: global function

***

## findProject(name) ⇒ Object

Retrieve a project by its name

**Kind**: global function\
**Returns**: Object - The project matching with this name

| Param | Type   | Description                     |
| ----- | ------ | ------------------------------- |
| name  | String | Name of the project to retrieve |

***

## deleteProject(name) ⇒ Promise:Integer

Delete a project by it name identifier.

**Kind**: global function\
**Returns**: Promise:Integer - Index of the project deleted or -1 if project does not exist

| Param | Type   | Description                     |
| ----- | ------ | ------------------------------- |
| name  | String | Name of the project to retrieve |

***

## deleteProjectFromSearch(name)

Delete a project from the search store

**Kind**: global function

| Param | Type   | Description                                   |
| ----- | ------ | --------------------------------------------- |
| name  | String | Name of the project to delete fropm the store |

***

## setProject(project) ⇒ Object

Update a project in the list or add it if it doesn't exist yet.

**Kind**: global function\
**Returns**: Object - The project

| Param   | Type   |
| ------- | ------ |
| project | Object |

***

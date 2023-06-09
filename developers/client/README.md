# Frontend API

This documentation is intended to help you create plugins for Datashare client. All methods currently exposed in the [Core](./#Core) class are available to a global variable called `datashare`.

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

## Classes

[Core](./#Core)

Class representing the core application with public methods for plugins.

## Mixins

[FiltersMixin](./#FiltersMixin)

Mixin class extending the core to add helpers for filters.

[HooksMixin](./#HooksMixin)

Mixin class extending the core to add helpers for hooks.

[I18nMixin](./#I18nMixin)

Mixin class extending the core to add helpers for i18n.

[PipelinesMixin](./#PipelinesMixin)

Mixin class extending the core to add helpers for pipelines.

[ProjectsMixin](./#ProjectsMixin)

Mixin class extending the core to add helpers for projects.

[WidgetsMixin](./#WidgetsMixin)

Mixin class extending the core to add helpers for widgets.

## Members

[projects](./#projects) ⇒ `Array:String`

List all projects this user has access to.

## Core

Class representing the core application with public methods for plugins.

**Kind**: global class\
**Mixes**: [`FiltersMixin`](./#FiltersMixin), [`HooksMixin`](./#HooksMixin), [`I18nMixin`](./#I18nMixin), [`PipelinesMixin`](./#PipelinesMixin), [`ProjectsMixin`](./#ProjectsMixin), [`WidgetsMixin`](./#WidgetsMixin)

* [Core](./#Core)
  * [new Core(LocalVue, api, mode)](./#new\_Core\_new)
  * _instance_
    * [.ready](./#Core+ready) : `Promise.<Object>`
    * [~~.app~~](./#Core+app) ~~:~~ [~~`Core`~~](./#Core)
    * [.core](./#Core+core) : [`Core`](./#Core)
    * [.localVue](./#Core+localVue) : `Vue`
    * [.store](./#Core+store) : `Vuex.Store`
    * [.auth](./#Core+auth) : `Auth`
    * [.config](./#Core+config) : `Object`
    * [.api](./#Core+api) : `Api`
    * [.use(Plugin, options)](./#Core+use) ⇒ [`Core`](./#Core)
    * [.useAll()](./#Core+useAll) ⇒ [`Core`](./#Core)
    * [.useI18n()](./#Core+useI18n) ⇒ [`Core`](./#Core)
    * [.useBootstrapVue()](./#Core+useBootstrapVue) ⇒ [`Core`](./#Core)
    * [.useRouter()](./#Core+useRouter) ⇒ [`Core`](./#Core)
    * [.useCommons()](./#Core+useCommons) ⇒ [`Core`](./#Core)
    * [.useWait()](./#Core+useWait) ⇒ [`Core`](./#Core)
    * [.useCore()](./#Core+useCore) ⇒ [`Core`](./#Core)
    * [.configure()](./#Core+configure) ⇒ `Promise.<Object>`
    * [.mount(\[selector\])](./#Core+mount) ⇒ `Vue`
    * [.defer()](./#Core+defer)
    * [.dispatch(name, ...args)](./#Core+dispatch) ⇒ [`Core`](./#Core)
    * [.getUser()](./#Core+getUser) : `Promise.<Object>`
    * [.setPageTitle(title, \[suffix\])](./#Core+setPageTitle)
  * _static_
    * [.init(...options)](./#Core.init) ⇒ [`Core`](./#Core)

### new Core(LocalVue, api, mode)

Create an application

| Param    | Type     | Description                                        |
| -------- | -------- | -------------------------------------------------- |
| LocalVue | `Object` | The Vue class to instantiate the application with. |
| api      |          | Datashare api interface                            |
| mode     |          | mode of authentication ('local' or 'server'        |

### datashare.ready : `Promise.<Object>`

Get a promise that is resolved when the application is ready

**Kind**: instance property of [`Core`](./#Core)\
**Fullfil**: `Object` The actual application core instance.\


### ~~datashare.app :~~ [~~`Core`~~](./#Core)

_**Deprecated**_

The application core instance. Deprecated in favor or the `core` property.

**Kind**: instance property of [`Core`](./#Core)\


### datashare.core : [`Core`](./#Core)

The application core instance

**Kind**: instance property of [`Core`](./#Core)\


### datashare.localVue : `Vue`

The Vue class to instantiate the application with

**Kind**: instance property of [`Core`](./#Core)\


### datashare.store : `Vuex.Store`

The Vuex instance

**Kind**: instance property of [`Core`](./#Core)\


### datashare.auth : `Auth`

The Auth module instance

**Kind**: instance property of [`Core`](./#Core)\


### datashare.config : `Object`

The configuration object provided by Murmur

**Kind**: instance property of [`Core`](./#Core)\


### datashare.api : `Api`

The Datashare api interface

**Kind**: instance property of [`Core`](./#Core)\


### datashare.use(Plugin, options) ⇒ [`Core`](./#Core)

Add a Vue plugin to the instance's LocalVue

**Kind**: instance method of [`Core`](./#Core)\
**Returns**: [`Core`](./#Core) - the current instance of Core

| Param   | Type     | Description                  |
| ------- | -------- | ---------------------------- |
| Plugin  | `Object` | The actual Vue plugin class  |
| options | `Object` | Option to pass to the plugin |

### datashare.useAll() ⇒ [`Core`](./#Core)

Configure all default Vue plugins for this application

**Kind**: instance method of [`Core`](./#Core)\
**Returns**: [`Core`](./#Core) - the current instance of Core\


### datashare.useI18n() ⇒ [`Core`](./#Core)

Configure vue-i18n plugin

**Kind**: instance method of [`Core`](./#Core)\
**Returns**: [`Core`](./#Core) - the current instance of Core\


### datashare.useBootstrapVue() ⇒ [`Core`](./#Core)

Configure bootstrap-vue plugin

**Kind**: instance method of [`Core`](./#Core)\
**Returns**: [`Core`](./#Core) - the current instance of Core\


### datashare.useRouter() ⇒ [`Core`](./#Core)

Configure vue-router plugin

**Kind**: instance method of [`Core`](./#Core)\
**Returns**: [`Core`](./#Core) - the current instance of Core\


### datashare.useCommons() ⇒ [`Core`](./#Core)

Configure most common Vue plugins (Murmur, VueProgressBar, VueShortkey, VueScrollTo and VueCalendar)

**Kind**: instance method of [`Core`](./#Core)\
**Returns**: [`Core`](./#Core) - the current instance of Core\


### datashare.useWait() ⇒ [`Core`](./#Core)

Configure vue-wait plugin

**Kind**: instance method of [`Core`](./#Core)\
**Returns**: [`Core`](./#Core) - the current instance of Core\


### datashare.useCore() ⇒ [`Core`](./#Core)

Add a $core property to the instance's Vue

**Kind**: instance method of [`Core`](./#Core)\
**Returns**: [`Core`](./#Core) - the current instance of Core\


### datashare.configure() ⇒ `Promise.<Object>`

Load settings from the server and instantiate most the application configuration.

**Kind**: instance method of [`Core`](./#Core)\
**Fullfil**: [`Core`](./#Core) - The instance of the core application\
**Reject**: `Object` - The Error object\


### datashare.mount(\[selector]) ⇒ `Vue`

Mount the instance's vue application

**Kind**: instance method of [`Core`](./#Core)\
**Returns**: `Vue` - The instantiated Vue

| Param       | Type     | Default | Description                          |
| ----------- | -------- | ------- | ------------------------------------ |
| \[selector] | `String` | `#app`  | Query selector to the mounting point |

### datashare.defer()

Build a promise to be resolved when the application is configured.

**Kind**: instance method of [`Core`](./#Core)\


### datashare.dispatch(name, ...args) ⇒ [`Core`](./#Core)

Dispatch an event from the document root, passing the core application through event message.

**Kind**: instance method of [`Core`](./#Core)\
**Returns**: [`Core`](./#Core) - the current instance of Core

| Param   | Type     | Description                            |
| ------- | -------- | -------------------------------------- |
| name    | `String` | Name of the event to fire              |
| ...args | `Mixed`  | Additional params to pass to the event |

### datashare.getUser() : `Promise.<Object>`

Get the current signed user.

**Kind**: instance method of [`Core`](./#Core)\
**Fullfil**: `Object` Current user\


### datashare.setPageTitle(title, \[suffix])

Append the given title to the page title

**Kind**: instance method of [`Core`](./#Core)

| Param     | Type     | Default     | Description                 |
| --------- | -------- | ----------- | --------------------------- |
| title     | `String` |             | Title to append to the page |
| \[suffix] | `String` | `Datashare` | Suffix to the title         |

### Core.init(...options) ⇒ [`Core`](./#Core)

instantiate a Core class (useful for chaining usage or mapping)

**Kind**: static method of [`Core`](./#Core)

| Param      | Type    | Description                             |
| ---------- | ------- | --------------------------------------- |
| ...options | `Mixed` | Options to pass to the Core constructor |

## FiltersMixin

Mixin class extending the core to add helpers for filters.

**Kind**: global mixin

* [FiltersMixin](./#FiltersMixin)
  * [.registerFilter(...args)](./#FiltersMixin+registerFilter)
  * [.unregisterFilter(name)](./#FiltersMixin+unregisterFilter)
  * [.registerFilterForProject(name, ...args)](./#FiltersMixin+registerFilterForProject)
  * [.unregisterFilterForProject(name, name)](./#FiltersMixin+unregisterFilterForProject)

### datashare.registerFilter(...args)

Register a filter

**Kind**: instance method of [`FiltersMixin`](./#FiltersMixin)

| Param                             | Type       | Default   | Description                                                               |
| --------------------------------- | ---------- | --------- | ------------------------------------------------------------------------- |
| ...args                           | `Mixed`    |           | Filter's params.                                                          |
| args.type                         | `String`   |           | Type of the filter.                                                       |
| args.options                      | `Object`   |           | Options to pass to the filter constructor.                                |
| args.options.name                 | `String`   |           | Name of the filter.                                                       |
| args.options.key                  | `String`   |           | Key of the filter. Typically ElasticSearch field name.                    |
| \[args.options.icon]              | `String`   |           | Icon of the filter.                                                       |
| \[args.options.isSearchable]      | `Boolean`  | `false`   | Set if this filter should be searchable or not.                           |
| \[args.options.alternativeSearch] | `function` | `()=>{})` | Set a function about how to transform query term before searching for it. |
| \[args.options.order]             | `Number`   |           | Order of the filter. Will be added as last filter by default.             |

### datashare.unregisterFilter(name)

Unregister a filter

**Kind**: instance method of [`FiltersMixin`](./#FiltersMixin)

| Param | Type     | Description                      |
| ----- | -------- | -------------------------------- |
| name  | `String` | Name of the filter to unregister |

### datashare.registerFilterForProject(name, ...args)

Register a filter only for a specific project

**Kind**: instance method of [`FiltersMixin`](./#FiltersMixin)

| Param        | Type     | Description                               |
| ------------ | -------- | ----------------------------------------- |
| name         | `String` | Name of the project                       |
| ...args      | `Mixed`  | Filter's options.                         |
| args.name    | `String` | Name of the filter                        |
| args.type    | `String` | Type of the filter.                       |
| args.options | `Object` | Options to pass to the filter constructor |

### datashare.unregisterFilterForProject(name, name)

Unregister a filter only for a specific project

**Kind**: instance method of [`FiltersMixin`](./#FiltersMixin)

| Param | Type     | Description         |
| ----- | -------- | ------------------- |
| name  | `String` | Name of the project |
| name  | `String` | Name of the filter  |

## HooksMixin

Mixin class extending the core to add helpers for hooks.

**Kind**: global mixin

* [HooksMixin](./#HooksMixin)
  * [.registerHook(...args)](./#HooksMixin+registerHook)
  * [.unregisterHook(name)](./#HooksMixin+unregisterHook)
  * [.resetHook(name)](./#HooksMixin+resetHook)
  * [.resetHooks()](./#HooksMixin+resetHooks)
  * [.registerHookForProject(project, options)](./#HooksMixin+registerHookForProject)

### datashare.registerHook(...args)

Register a hook

**Kind**: instance method of [`HooksMixin`](./#HooksMixin)

| Param           | Type     | Description                             |
| --------------- | -------- | --------------------------------------- |
| ...args         | `Mixed`  | Hook's options                          |
| args.name       | `String` | Name of the hook                        |
| args.target     | `String` | Target of the hook                      |
| args.order      | `Number` | Priority of the hook                    |
| args.definition | `Object` | Options to pass to the hook constructor |

### datashare.unregisterHook(name)

Unregister a specific hook

**Kind**: instance method of [`HooksMixin`](./#HooksMixin)

| Param | Type     | Description      |
| ----- | -------- | ---------------- |
| name  | `String` | Name of the hook |

### datashare.resetHook(name)

Unregister all hooks from a target

**Kind**: instance method of [`HooksMixin`](./#HooksMixin)

| Param | Type     | Description        |
| ----- | -------- | ------------------ |
| name  | `String` | Name of the target |

### datashare.resetHooks()

Unregister all hooks, on every targets

**Kind**: instance method of [`HooksMixin`](./#HooksMixin)\


### datashare.registerHookForProject(project, options)

Register a hook for a specific project

**Kind**: instance method of [`HooksMixin`](./#HooksMixin)

| Param              | Type     | Description                             |
| ------------------ | -------- | --------------------------------------- |
| project            | `String` | Project to add this hook to             |
| options            | `Object` | Hook's options                          |
| options.name       | `String` | Name of the hook                        |
| options.target     | `String` | Target of the hook                      |
| options.order      | `Number` | Priority of the hook                    |
| options.definition | `Object` | Options to pass to the hook constructor |

## I18nMixin

Mixin class extending the core to add helpers for i18n.

**Kind**: global mixin

* [I18nMixin](./#I18nMixin)
  * [.initializeI18n()](./#I18nMixin+initializeI18n) ⇒ `Promise`
  * [.setI18nLocale(locale)](./#I18nMixin+setI18nLocale) ⇒ `String`
  * [.hasI18Locale(locale)](./#I18nMixin+hasI18Locale) ⇒ `Boolean`
  * [.loadI18Locale(locale)](./#I18nMixin+loadI18Locale) ⇒ `Promise`

### datashare.initializeI18n() ⇒ `Promise`

Initialize i18N using the local storage and load the necessary locale's messages

**Kind**: instance method of [`I18nMixin`](./#I18nMixin)\


### datashare.setI18nLocale(locale) ⇒ `String`

Set the active locale both in local stoage and VueI18n.

**Kind**: instance method of [`I18nMixin`](./#I18nMixin)

| Param  | Type     | Description                            |
| ------ | -------- | -------------------------------------- |
| locale | `String` | Key of the local (fr, de, en, ja, ...) |

### datashare.hasI18Locale(locale) ⇒ `Boolean`

Check the given locale storage was loaded.

**Kind**: instance method of [`I18nMixin`](./#I18nMixin)

| Param  | Type     | Description                            |
| ------ | -------- | -------------------------------------- |
| locale | `String` | Key of the local (fr, de, en, ja, ...) |

### datashare.loadI18Locale(locale) ⇒ `Promise`

Load i18n messages for the given locale (if needed) and set it as the current locale.

**Kind**: instance method of [`I18nMixin`](./#I18nMixin)

| Param  | Type     | Description                            |
| ------ | -------- | -------------------------------------- |
| locale | `String` | Key of the local (fr, de, en, ja, ...) |

## PipelinesMixin

Mixin class extending the core to add helpers for pipelines.

**Kind**: global mixin

* [PipelinesMixin](./#PipelinesMixin)
  * [.registerPipeline(...args, category)](./#PipelinesMixin+registerPipeline)
  * [.unregisterPipeline(name)](./#PipelinesMixin+unregisterPipeline)
  * [.registerPipelineForProject(project, ...args, category)](./#PipelinesMixin+registerPipelineForProject)
  * [.unregisterPipelineForProject(project, name)](./#PipelinesMixin+unregisterPipelineForProject)

### datashare.registerPipeline(...args, category)

Register a pipeline

**Kind**: instance method of [`PipelinesMixin`](./#PipelinesMixin)

| Param     | Type                   | Description            |
| --------- | ---------------------- | ---------------------- |
| ...args   | `Mixed`                | Pipeline's options.    |
| args.name | `String`               | Name of the pipeline   |
| args.type | `String` \| `function` | Type of the pipeline.  |
| category  | `String`               | The pipeline to target |

### datashare.unregisterPipeline(name)

Unregister a pipeline

**Kind**: instance method of [`PipelinesMixin`](./#PipelinesMixin)

| Param | Type     | Description          |
| ----- | -------- | -------------------- |
| name  | `String` | Name of the pipeline |

### datashare.registerPipelineForProject(project, ...args, category)

Register a pipeline for a specific project

**Kind**: instance method of [`PipelinesMixin`](./#PipelinesMixin)

| Param     | Type                   | Description            |
| --------- | ---------------------- | ---------------------- |
| project   | `String`               | Name of the project    |
| ...args   | `Mixed`                | Pipeline's options.    |
| args.name | `String`               | Name of the pipeline   |
| args.type | `String` \| `function` | Type of the pipeline.  |
| category  | `String`               | The pipeline to target |

### datashare.unregisterPipelineForProject(project, name)

Unregister a pipeline for a specific project

**Kind**: instance method of [`PipelinesMixin`](./#PipelinesMixin)

| Param   | Type     | Description          |
| ------- | -------- | -------------------- |
| project | `String` | Name of the project  |
| name    | `String` | Name of the pipeline |

## ProjectsMixin

Mixin class extending the core to add helpers for projects.

**Kind**: global mixin

* [ProjectsMixin](./#ProjectsMixin)
  * [.toggleForProject(name, withFn, withoutFn, mutationType, storePath)](./#ProjectsMixin+toggleForProject)
  * [.createDefaultProject()](./#ProjectsMixin+createDefaultProject) ⇒ `Promise:Object`

### datashare.toggleForProject(name, withFn, withoutFn, mutationType, storePath)

Call a function when a project is selected

**Kind**: instance method of [`ProjectsMixin`](./#ProjectsMixin)

| Param        | Type       | Description                                     |
| ------------ | ---------- | ----------------------------------------------- |
| name         | `String`   | Name of the project                             |
| withFn       | `function` | Function to call when the project is selected   |
| withoutFn    | `function` | Function to call when the project is unselected |
| mutationType | `String`   | Mutation type that will be watched for changes. |
| storePath    | `String`   | Path to the project in the store                |

### datashare.createDefaultProject() ⇒ `Promise:Object`

Create a default project on Datashare using the API

**Kind**: instance method of [`ProjectsMixin`](./#ProjectsMixin)\
**Returns**: `Promise:Object` - The HTTP response object\


## WidgetsMixin

Mixin class extending the core to add helpers for widgets.

**Kind**: global mixin

* [WidgetsMixin](./#WidgetsMixin)
  * [.registerWidget(...args)](./#WidgetsMixin+registerWidget)
  * [.unregisterWidget(name)](./#WidgetsMixin+unregisterWidget)
  * [.clearWidgets()](./#WidgetsMixin+clearWidgets)
  * [.registerWidgetForProject(project, options)](./#WidgetsMixin+registerWidgetForProject)
  * [.replaceWidget(name, options)](./#WidgetsMixin+replaceWidget)
  * [.replaceWidgetForProject(project, name, options)](./#WidgetsMixin+replaceWidgetForProject)

### datashare.registerWidget(...args)

Register a widget

**Kind**: instance method of [`WidgetsMixin`](./#WidgetsMixin)

| Param        | Type      | Default       | Description                                                           |
| ------------ | --------- | ------------- | --------------------------------------------------------------------- |
| ...args      | `Mixed`   |               | Widget's options passed to widget constructor                         |
| args.name    | `String`  |               | Name of the widget                                                    |
| args.card    | `Boolean` |               | Either or not this widget should be a `card` component from Boostrap. |
| args.cols    | `Number`  |               | Number of columns to fill in the grid (from 1 to 12)                  |
| \[args.type] | `String`  | `WidgetEmpty` | Type of the widget                                                    |

### datashare.unregisterWidget(name)

Unregister a widget

**Kind**: instance method of [`WidgetsMixin`](./#WidgetsMixin)

| Param | Type     | Description                      |
| ----- | -------- | -------------------------------- |
| name  | `String` | Name of the widget to unregister |

### datashare.clearWidgets()

Unregister all widgets

**Kind**: instance method of [`WidgetsMixin`](./#WidgetsMixin)\


### datashare.registerWidgetForProject(project, options)

Register a widget for a specific project

**Kind**: instance method of [`WidgetsMixin`](./#WidgetsMixin)

| Param           | Type      | Default       | Description                                                          |
| --------------- | --------- | ------------- | -------------------------------------------------------------------- |
| project         | `String`  |               | Name of the project to add this widget to                            |
| options         | `Object`  |               | Widget's options passed to widget constructor                        |
| options.name    | `String`  |               | Name of the widget                                                   |
| options.card    | `Boolean` |               | Either or not this widget should be a `card` component from Boostrap |
| options.cols    | `Number`  |               | Number of columns to fill in the grid (from 1 to 12)                 |
| \[options.type] | `String`  | `WidgetEmpty` | Type of the widget                                                   |

### datashare.replaceWidget(name, options)

Replace an existing widget

**Kind**: instance method of [`WidgetsMixin`](./#WidgetsMixin)

| Param           | Type      | Default       | Description                                                          |
| --------------- | --------- | ------------- | -------------------------------------------------------------------- |
| name            | `String`  |               | Name of the widget to replace                                        |
| options         | `Object`  |               | Widget's options passed to widget constructor.                       |
| options.card    | `Boolean` |               | Either or not this widget should be a `card` component from Boostrap |
| options.cols    | `Number`  |               | Number of columns to fill in the grid (from 1 to 12)                 |
| \[options.type] | `String`  | `WidgetEmpty` | Type of the widget                                                   |

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

### datashare.replaceWidgetForProject(project, name, options)

Replace an existing widget for a specific project

**Kind**: instance method of [`WidgetsMixin`](./#WidgetsMixin)

| Param           | Type      | Default       | Description                                                                                         |
| --------------- | --------- | ------------- | --------------------------------------------------------------------------------------------------- |
| project         | `String`  |               | Name of the project to add this widget to                                                           |
| name            | `String`  |               | Name of the widget to replace                                                                       |
| options         | `Object`  |               | Widget's options passed to widget constructor. Each widget class can define its own default values. |
| options.card    | `Boolean` |               | Either or not this widget should be a `card` component from Boostrap                                |
| options.cols    | `Number`  |               | Number of columns to fill in the grid (from 1 to 12)                                                |
| \[options.type] | `String`  | `WidgetEmpty` | Type of the widget                                                                                  |

## projects ⇒ `Array:String`

List all projects this user has access to.

**Kind**: global variable

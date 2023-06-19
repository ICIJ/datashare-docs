# Frontend API

This documentation is intended to help you create plugins for Datashare client.
All methods currently exposed in the [Core](#Core) class are available to a
global variable called `datashare`.

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

<a id="core"></a>

## Core

Class representing the core application with public methods for plugins.

**Kind**: global class  
**Mixes**: [`FiltersMixin`](#filtersmixin), [`HooksMixin`](#hooksmixin), [`I18nMixin`](#i-nmixin), [`PipelinesMixin`](#pipelinesmixin), [`ProjectsMixin`](#projectsmixin), [`WidgetsMixin`](#widgetsmixin)  

* [Core](#core)
    * [new Core(LocalVue, api, mode)](#new-core-new)
    * _instance_
        * [.ready](#core-ready) : Promise.&lt;Object&gt;
        * <del>[.app](#core-app) : [`Core`](#core)</del>
        * [.core](#core-core) : [`Core`](#core)
        * [.localVue](#core-localvue) : Vue
        * [.store](#core-store) : Vuex.Store
        * [.auth](#core-auth) : Auth
        * [.config](#core-config) : Object
        * [.api](#core-api) : Api
        * [.use(Plugin, options)](#core-use) ⇒ [`Core`](#core)
        * [.useAll()](#core-useall) ⇒ [`Core`](#core)
        * [.useI18n()](#core-usei-n) ⇒ [`Core`](#core)
        * [.useBootstrapVue()](#core-usebootstrapvue) ⇒ [`Core`](#core)
        * [.useRouter()](#core-userouter) ⇒ [`Core`](#core)
        * [.useCommons()](#core-usecommons) ⇒ [`Core`](#core)
        * [.useWait()](#core-usewait) ⇒ [`Core`](#core)
        * [.useCore()](#core-usecore) ⇒ [`Core`](#core)
        * [.configure()](#core-configure) ⇒ Promise.&lt;Object&gt;
        * [.mount([selector])](#core-mount) ⇒ Vue
        * [.defer()](#core-defer)
        * [.dispatch(name, ...args)](#core-dispatch) ⇒ [`Core`](#core)
        * [.getUser()](#core-getuser) : Promise.&lt;Object&gt;
        * [.setPageTitle(title, [suffix])](#core-setpagetitle)
    * _static_
        * [.init(...options)](#core-init) ⇒ [`Core`](#core)


*****

<a id="new-core-new"></a>

### new Core(LocalVue, api, mode)

Create an application

<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>LocalVue</td><td>Object</td><td><p>The Vue class to instantiate the application with.</p>
</td>
    </tr><tr>
    <td>api</td><td></td><td><p>Datashare api interface</p>
</td>
    </tr><tr>
    <td>mode</td><td></td><td><p>mode of authentication (&#39;local&#39; or &#39;server&#39;</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="core-ready"></a>

### datashare.ready : Promise.&lt;Object&gt;

Get a promise that is resolved when the application is ready

**Kind**: instance property of [`Core`](#core)  
**Fullfil**: Object The actual application core instance.  

*****

<a id="core-app"></a>

### <del>datashare.app : [`Core`](#core)</del>

***Deprecated***

The application core instance. Deprecated in favor or the `core` property.

**Kind**: instance property of [`Core`](#core)  

*****

<a id="core-core"></a>

### datashare.core : [`Core`](#core)

The application core instance

**Kind**: instance property of [`Core`](#core)  

*****

<a id="core-localvue"></a>

### datashare.localVue : Vue

The Vue class to instantiate the application with

**Kind**: instance property of [`Core`](#core)  

*****

<a id="core-store"></a>

### datashare.store : Vuex.Store

The Vuex instance

**Kind**: instance property of [`Core`](#core)  

*****

<a id="core-auth"></a>

### datashare.auth : Auth

The Auth module instance

**Kind**: instance property of [`Core`](#core)  

*****

<a id="core-config"></a>

### datashare.config : Object

The configuration object provided by Murmur

**Kind**: instance property of [`Core`](#core)  

*****

<a id="core-api"></a>

### datashare.api : Api

The Datashare api interface

**Kind**: instance property of [`Core`](#core)  

*****

<a id="core-use"></a>

### datashare.use(Plugin, options) ⇒ [`Core`](#core)

Add a Vue plugin to the instance's LocalVue

**Kind**: instance method of [`Core`](#core)  
**Returns**: [`Core`](#core) - the current instance of Core  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>Plugin</td><td>Object</td><td><p>The actual Vue plugin class</p>
</td>
    </tr><tr>
    <td>options</td><td>Object</td><td><p>Option to pass to the plugin</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="core-useall"></a>

### datashare.useAll() ⇒ [`Core`](#core)

Configure all default Vue plugins for this application

**Kind**: instance method of [`Core`](#core)  
**Returns**: [`Core`](#core) - the current instance of Core  

*****

<a id="core-usei-n"></a>

### datashare.useI18n() ⇒ [`Core`](#core)

Configure vue-i18n plugin

**Kind**: instance method of [`Core`](#core)  
**Returns**: [`Core`](#core) - the current instance of Core  

*****

<a id="core-usebootstrapvue"></a>

### datashare.useBootstrapVue() ⇒ [`Core`](#core)

Configure bootstrap-vue plugin

**Kind**: instance method of [`Core`](#core)  
**Returns**: [`Core`](#core) - the current instance of Core  

*****

<a id="core-userouter"></a>

### datashare.useRouter() ⇒ [`Core`](#core)

Configure vue-router plugin

**Kind**: instance method of [`Core`](#core)  
**Returns**: [`Core`](#core) - the current instance of Core  

*****

<a id="core-usecommons"></a>

### datashare.useCommons() ⇒ [`Core`](#core)

Configure most common Vue plugins (Murmur, VueProgressBar, VueShortkey, VueScrollTo and VueCalendar)

**Kind**: instance method of [`Core`](#core)  
**Returns**: [`Core`](#core) - the current instance of Core  

*****

<a id="core-usewait"></a>

### datashare.useWait() ⇒ [`Core`](#core)

Configure vue-wait plugin

**Kind**: instance method of [`Core`](#core)  
**Returns**: [`Core`](#core) - the current instance of Core  

*****

<a id="core-usecore"></a>

### datashare.useCore() ⇒ [`Core`](#core)

Add a $core property to the instance's Vue

**Kind**: instance method of [`Core`](#core)  
**Returns**: [`Core`](#core) - the current instance of Core  

*****

<a id="core-configure"></a>

### datashare.configure() ⇒ Promise.&lt;Object&gt;

Load settings from the server and instantiate most the application configuration.

**Kind**: instance method of [`Core`](#core)  
**Fullfil**: [`Core`](#core) - The instance of the core application  
**Reject**: Object - The Error object  

*****

<a id="core-mount"></a>

### datashare.mount([selector]) ⇒ Vue

Mount the instance's vue application

**Kind**: instance method of [`Core`](#core)  
**Returns**: Vue - The instantiated Vue  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>[selector]</td><td>String</td><td><code>#app</code></td><td><p>Query selector to the mounting point</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="core-defer"></a>

### datashare.defer()

Build a promise to be resolved when the application is configured.

**Kind**: instance method of [`Core`](#core)  

*****

<a id="core-dispatch"></a>

### datashare.dispatch(name, ...args) ⇒ [`Core`](#core)

Dispatch an event from the document root, passing the core application through event message.

**Kind**: instance method of [`Core`](#core)  
**Returns**: [`Core`](#core) - the current instance of Core  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td>String</td><td><p>Name of the event to fire</p>
</td>
    </tr><tr>
    <td>...args</td><td>Mixed</td><td><p>Additional params to pass to the event</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="core-getuser"></a>

### datashare.getUser() : Promise.&lt;Object&gt;

Get the current signed user.

**Kind**: instance method of [`Core`](#core)  
**Fullfil**: Object Current user  

*****

<a id="core-setpagetitle"></a>

### datashare.setPageTitle(title, [suffix])

Append the given title to the page title

**Kind**: instance method of [`Core`](#core)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>title</td><td>String</td><td><code></code></td><td><p>Title to append to the page</p>
</td>
    </tr><tr>
    <td>[suffix]</td><td>String</td><td><code>Datashare</code></td><td><p>Suffix to the title</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="core-init"></a>

### Core.init(...options) ⇒ [`Core`](#core)

instantiate a Core class (useful for chaining usage or mapping)

**Kind**: static method of [`Core`](#core)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>...options</td><td>Mixed</td><td><p>Options to pass to the Core constructor</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="filtersmixin"></a>

## FiltersMixin

Mixin class extending the core to add helpers for filters.

**Kind**: global mixin  

* [FiltersMixin](#filtersmixin)
    * [.registerFilter(...args)](#filtersmixin-registerfilter)
    * [.unregisterFilter(name)](#filtersmixin-unregisterfilter)
    * [.registerFilterForProject(name, ...args)](#filtersmixin-registerfilterforproject)
    * [.unregisterFilterForProject(name, name)](#filtersmixin-unregisterfilterforproject)


*****

<a id="filtersmixin-registerfilter"></a>

### datashare.registerFilter(...args)

Register a filter

**Kind**: instance method of [`FiltersMixin`](#filtersmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>...args</td><td>Mixed</td><td></td><td><p>Filter&#39;s params.</p>
</td>
    </tr><tr>
    <td>args.type</td><td>String</td><td></td><td><p>Type of the filter.</p>
</td>
    </tr><tr>
    <td>args.options</td><td>Object</td><td></td><td><p>Options to pass to the filter constructor.</p>
</td>
    </tr><tr>
    <td>args.options.name</td><td>String</td><td></td><td><p>Name of the filter.</p>
</td>
    </tr><tr>
    <td>args.options.key</td><td>String</td><td></td><td><p>Key of the filter. Typically ElasticSearch field name.</p>
</td>
    </tr><tr>
    <td>[args.options.icon]</td><td>String</td><td><code></code></td><td><p>Icon of the filter.</p>
</td>
    </tr><tr>
    <td>[args.options.isSearchable]</td><td>Boolean</td><td><code>false</code></td><td><p>Set if this filter should be searchable or not.</p>
</td>
    </tr><tr>
    <td>[args.options.alternativeSearch]</td><td>function</td><td><code>()&#x3D;&gt;{})</code></td><td><p>Set a function about how to transform query term before searching for it.</p>
</td>
    </tr><tr>
    <td>[args.options.order]</td><td>Number</td><td><code></code></td><td><p>Order of the filter. Will be added as last filter by default.</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="filtersmixin-unregisterfilter"></a>

### datashare.unregisterFilter(name)

Unregister a filter

**Kind**: instance method of [`FiltersMixin`](#filtersmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td>String</td><td><p>Name of the filter to unregister</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="filtersmixin-registerfilterforproject"></a>

### datashare.registerFilterForProject(name, ...args)

Register a filter only for a specific project

**Kind**: instance method of [`FiltersMixin`](#filtersmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td>String</td><td><p>Name of the project</p>
</td>
    </tr><tr>
    <td>...args</td><td>Mixed</td><td><p>Filter&#39;s options.</p>
</td>
    </tr><tr>
    <td>args.name</td><td>String</td><td><p>Name of the filter</p>
</td>
    </tr><tr>
    <td>args.type</td><td>String</td><td><p>Type of the filter.</p>
</td>
    </tr><tr>
    <td>args.options</td><td>Object</td><td><p>Options to pass to the filter constructor</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="filtersmixin-unregisterfilterforproject"></a>

### datashare.unregisterFilterForProject(name, name)

Unregister a filter only for a specific project

**Kind**: instance method of [`FiltersMixin`](#filtersmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td>String</td><td><p>Name of the project</p>
</td>
    </tr><tr>
    <td>name</td><td>String</td><td><p>Name of the filter</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="hooksmixin"></a>

## HooksMixin

Mixin class extending the core to add helpers for hooks.

**Kind**: global mixin  

* [HooksMixin](#hooksmixin)
    * [.registerHook(...args)](#hooksmixin-registerhook)
    * [.unregisterHook(name)](#hooksmixin-unregisterhook)
    * [.resetHook(name)](#hooksmixin-resethook)
    * [.resetHooks()](#hooksmixin-resethooks)
    * [.registerHookForProject(project, options)](#hooksmixin-registerhookforproject)


*****

<a id="hooksmixin-registerhook"></a>

### datashare.registerHook(...args)

Register a hook

**Kind**: instance method of [`HooksMixin`](#hooksmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>...args</td><td>Mixed</td><td><p>Hook&#39;s options</p>
</td>
    </tr><tr>
    <td>args.name</td><td>String</td><td><p>Name of the hook</p>
</td>
    </tr><tr>
    <td>args.target</td><td>String</td><td><p>Target of the hook</p>
</td>
    </tr><tr>
    <td>args.order</td><td>Number</td><td><p>Priority of the hook</p>
</td>
    </tr><tr>
    <td>args.definition</td><td>Object</td><td><p>Options to pass to the hook constructor</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="hooksmixin-unregisterhook"></a>

### datashare.unregisterHook(name)

Unregister a specific hook

**Kind**: instance method of [`HooksMixin`](#hooksmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td>String</td><td><p>Name of the hook</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="hooksmixin-resethook"></a>

### datashare.resetHook(name)

Unregister all hooks from a target

**Kind**: instance method of [`HooksMixin`](#hooksmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td>String</td><td><p>Name of the target</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="hooksmixin-resethooks"></a>

### datashare.resetHooks()

Unregister all hooks, on every targets

**Kind**: instance method of [`HooksMixin`](#hooksmixin)  

*****

<a id="hooksmixin-registerhookforproject"></a>

### datashare.registerHookForProject(project, options)

Register a hook for a specific project

**Kind**: instance method of [`HooksMixin`](#hooksmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>project</td><td>String</td><td><p>Project to add this hook to</p>
</td>
    </tr><tr>
    <td>options</td><td>Object</td><td><p>Hook&#39;s options</p>
</td>
    </tr><tr>
    <td>options.name</td><td>String</td><td><p>Name of the hook</p>
</td>
    </tr><tr>
    <td>options.target</td><td>String</td><td><p>Target of the hook</p>
</td>
    </tr><tr>
    <td>options.order</td><td>Number</td><td><p>Priority of the hook</p>
</td>
    </tr><tr>
    <td>options.definition</td><td>Object</td><td><p>Options to pass to the hook constructor</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="i-nmixin"></a>

## I18nMixin

Mixin class extending the core to add helpers for i18n.

**Kind**: global mixin  

* [I18nMixin](#i-nmixin)
    * [.initializeI18n()](#i-nmixin-initializei-n) ⇒ Promise
    * [.setI18nLocale(locale)](#i-nmixin-seti-nlocale) ⇒ String
    * [.hasI18Locale(locale)](#i-nmixin-hasi-locale) ⇒ Boolean
    * [.loadI18Locale(locale)](#i-nmixin-loadi-locale) ⇒ Promise


*****

<a id="i-nmixin-initializei-n"></a>

### datashare.initializeI18n() ⇒ Promise

Initialize i18N using the local storage and load
the necessary locale's messages

**Kind**: instance method of [`I18nMixin`](#i-nmixin)  

*****

<a id="i-nmixin-seti-nlocale"></a>

### datashare.setI18nLocale(locale) ⇒ String

Set the active locale both in local stoage and VueI18n.

**Kind**: instance method of [`I18nMixin`](#i-nmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>locale</td><td>String</td><td><p>Key of the local (fr, de, en, ja, ...)</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="i-nmixin-hasi-locale"></a>

### datashare.hasI18Locale(locale) ⇒ Boolean

Check the given locale storage was loaded.

**Kind**: instance method of [`I18nMixin`](#i-nmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>locale</td><td>String</td><td><p>Key of the local (fr, de, en, ja, ...)</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="i-nmixin-loadi-locale"></a>

### datashare.loadI18Locale(locale) ⇒ Promise

Load i18n messages for the given locale (if needed)
and set it as the current locale.

**Kind**: instance method of [`I18nMixin`](#i-nmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>locale</td><td>String</td><td><p>Key of the local (fr, de, en, ja, ...)</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="pipelinesmixin"></a>

## PipelinesMixin

Mixin class extending the core to add helpers for pipelines.

**Kind**: global mixin  

* [PipelinesMixin](#pipelinesmixin)
    * [.registerPipeline(...args, category)](#pipelinesmixin-registerpipeline)
    * [.unregisterPipeline(name)](#pipelinesmixin-unregisterpipeline)
    * [.registerPipelineForProject(project, ...args, category)](#pipelinesmixin-registerpipelineforproject)
    * [.unregisterPipelineForProject(project, name)](#pipelinesmixin-unregisterpipelineforproject)


*****

<a id="pipelinesmixin-registerpipeline"></a>

### datashare.registerPipeline(...args, category)

Register a pipeline

**Kind**: instance method of [`PipelinesMixin`](#pipelinesmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>...args</td><td>Mixed</td><td><p>Pipeline&#39;s options.</p>
</td>
    </tr><tr>
    <td>args.name</td><td>String</td><td><p>Name of the pipeline</p>
</td>
    </tr><tr>
    <td>args.type</td><td>String | function</td><td><p>Type of the pipeline.</p>
</td>
    </tr><tr>
    <td>category</td><td>String</td><td><p>The pipeline to target</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="pipelinesmixin-unregisterpipeline"></a>

### datashare.unregisterPipeline(name)

Unregister a pipeline

**Kind**: instance method of [`PipelinesMixin`](#pipelinesmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td>String</td><td><p>Name of the pipeline</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="pipelinesmixin-registerpipelineforproject"></a>

### datashare.registerPipelineForProject(project, ...args, category)

Register a pipeline for a specific project

**Kind**: instance method of [`PipelinesMixin`](#pipelinesmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>project</td><td>String</td><td><p>Name of the project</p>
</td>
    </tr><tr>
    <td>...args</td><td>Mixed</td><td><p>Pipeline&#39;s options.</p>
</td>
    </tr><tr>
    <td>args.name</td><td>String</td><td><p>Name of the pipeline</p>
</td>
    </tr><tr>
    <td>args.type</td><td>String | function</td><td><p>Type of the pipeline.</p>
</td>
    </tr><tr>
    <td>category</td><td>String</td><td><p>The pipeline to target</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="pipelinesmixin-unregisterpipelineforproject"></a>

### datashare.unregisterPipelineForProject(project, name)

Unregister a pipeline for a specific project

**Kind**: instance method of [`PipelinesMixin`](#pipelinesmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>project</td><td>String</td><td><p>Name of the project</p>
</td>
    </tr><tr>
    <td>name</td><td>String</td><td><p>Name of the pipeline</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="projectsmixin"></a>

## ProjectsMixin

Mixin class extending the core to add helpers for projects.

**Kind**: global mixin  

* [ProjectsMixin](#projectsmixin)
    * [.toggleForProject(name, withFn, withoutFn, mutationType, storePath)](#projectsmixin-toggleforproject)
    * [.createDefaultProject()](#projectsmixin-createdefaultproject) ⇒ Promise:Object


*****

<a id="projectsmixin-toggleforproject"></a>

### datashare.toggleForProject(name, withFn, withoutFn, mutationType, storePath)

Call a function when a project is selected

**Kind**: instance method of [`ProjectsMixin`](#projectsmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td>String</td><td><p>Name of the project</p>
</td>
    </tr><tr>
    <td>withFn</td><td>function</td><td><p>Function to call when the project is selected</p>
</td>
    </tr><tr>
    <td>withoutFn</td><td>function</td><td><p>Function to call when the project is unselected</p>
</td>
    </tr><tr>
    <td>mutationType</td><td>String</td><td><p>Mutation type that will be watched for changes.</p>
</td>
    </tr><tr>
    <td>storePath</td><td>String</td><td><p>Path to the project in the store</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="projectsmixin-createdefaultproject"></a>

### datashare.createDefaultProject() ⇒ Promise:Object

Create a default project on Datashare using the API

**Kind**: instance method of [`ProjectsMixin`](#projectsmixin)  
**Returns**: Promise:Object - The HTTP response object  

*****

<a id="widgetsmixin"></a>

## WidgetsMixin

Mixin class extending the core to add helpers for widgets.

**Kind**: global mixin  

* [WidgetsMixin](#widgetsmixin)
    * [.registerWidget(...args)](#widgetsmixin-registerwidget)
    * [.unregisterWidget(name)](#widgetsmixin-unregisterwidget)
    * [.clearWidgets()](#widgetsmixin-clearwidgets)
    * [.registerWidgetForProject(project, options)](#widgetsmixin-registerwidgetforproject)
    * [.replaceWidget(name, options)](#widgetsmixin-replacewidget)
    * [.replaceWidgetForProject(project, name, options)](#widgetsmixin-replacewidgetforproject)


*****

<a id="widgetsmixin-registerwidget"></a>

### datashare.registerWidget(...args)

Register a widget

**Kind**: instance method of [`WidgetsMixin`](#widgetsmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>...args</td><td>Mixed</td><td></td><td><p>Widget&#39;s options passed to widget constructor</p>
</td>
    </tr><tr>
    <td>args.name</td><td>String</td><td></td><td><p>Name of the widget</p>
</td>
    </tr><tr>
    <td>args.card</td><td>Boolean</td><td></td><td><p>Either or not this widget should be a <code>card</code> component from Boostrap.</p>
</td>
    </tr><tr>
    <td>args.cols</td><td>Number</td><td></td><td><p>Number of columns to fill in the grid (from 1 to 12)</p>
</td>
    </tr><tr>
    <td>[args.type]</td><td>String</td><td><code>WidgetEmpty</code></td><td><p>Type of the widget</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="widgetsmixin-unregisterwidget"></a>

### datashare.unregisterWidget(name)

Unregister a widget

**Kind**: instance method of [`WidgetsMixin`](#widgetsmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td>String</td><td><p>Name of the widget to unregister</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="widgetsmixin-clearwidgets"></a>

### datashare.clearWidgets()

Unregister all widgets

**Kind**: instance method of [`WidgetsMixin`](#widgetsmixin)  

*****

<a id="widgetsmixin-registerwidgetforproject"></a>

### datashare.registerWidgetForProject(project, options)

Register a widget for a specific project

**Kind**: instance method of [`WidgetsMixin`](#widgetsmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>project</td><td>String</td><td></td><td><p>Name of the project to add this widget to</p>
</td>
    </tr><tr>
    <td>options</td><td>Object</td><td></td><td><p>Widget&#39;s options passed to widget constructor</p>
</td>
    </tr><tr>
    <td>options.name</td><td>String</td><td></td><td><p>Name of the widget</p>
</td>
    </tr><tr>
    <td>options.card</td><td>Boolean</td><td></td><td><p>Either or not this widget should be a <code>card</code> component from Boostrap</p>
</td>
    </tr><tr>
    <td>options.cols</td><td>Number</td><td></td><td><p>Number of columns to fill in the grid (from 1 to 12)</p>
</td>
    </tr><tr>
    <td>[options.type]</td><td>String</td><td><code>WidgetEmpty</code></td><td><p>Type of the widget</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="widgetsmixin-replacewidget"></a>

### datashare.replaceWidget(name, options)

Replace an existing widget

**Kind**: instance method of [`WidgetsMixin`](#widgetsmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td>String</td><td></td><td><p>Name of the widget to replace</p>
</td>
    </tr><tr>
    <td>options</td><td>Object</td><td></td><td><p>Widget&#39;s options passed to widget constructor.</p>
</td>
    </tr><tr>
    <td>options.card</td><td>Boolean</td><td></td><td><p>Either or not this widget should be a <code>card</code> component from Boostrap</p>
</td>
    </tr><tr>
    <td>options.cols</td><td>Number</td><td></td><td><p>Number of columns to fill in the grid (from 1 to 12)</p>
</td>
    </tr><tr>
    <td>[options.type]</td><td>String</td><td><code>WidgetEmpty</code></td><td><p>Type of the widget</p>
</td>
    </tr>  </tbody>
</table>

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

*****

<a id="widgetsmixin-replacewidgetforproject"></a>

### datashare.replaceWidgetForProject(project, name, options)

Replace an existing widget for a specific project

**Kind**: instance method of [`WidgetsMixin`](#widgetsmixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>project</td><td>String</td><td></td><td><p>Name of the project to add this widget to</p>
</td>
    </tr><tr>
    <td>name</td><td>String</td><td></td><td><p>Name of the widget to replace</p>
</td>
    </tr><tr>
    <td>options</td><td>Object</td><td></td><td><p>Widget&#39;s options passed to widget constructor. Each widget class can define its own default values.</p>
</td>
    </tr><tr>
    <td>options.card</td><td>Boolean</td><td></td><td><p>Either or not this widget should be a <code>card</code> component from Boostrap</p>
</td>
    </tr><tr>
    <td>options.cols</td><td>Number</td><td></td><td><p>Number of columns to fill in the grid (from 1 to 12)</p>
</td>
    </tr><tr>
    <td>[options.type]</td><td>String</td><td><code>WidgetEmpty</code></td><td><p>Type of the widget</p>
</td>
    </tr>  </tbody>
</table>


*****

<a id="projects"></a>

## projects ⇒ Array:String

List all projects this user has access to.

**Kind**: global variable  

*****


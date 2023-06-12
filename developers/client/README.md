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

<a id="Core"></a>

## CoreClass representing the core application with public methods for plugins.

**Kind**: global class  
**Mixes**: [`FiltersMixin`](#FiltersMixin), [`HooksMixin`](#HooksMixin), [`I18nMixin`](#I18nMixin), [`PipelinesMixin`](#PipelinesMixin), [`ProjectsMixin`](#ProjectsMixin), [`WidgetsMixin`](#WidgetsMixin)  

* [Core](#Core)
    * [new Core(LocalVue, api, mode)](#new_Core_new)
    * _instance_
        * [.ready](#Core+ready) : Promise.&lt;Object&gt;
        * <del>[.app](#Core+app) : [`Core`](#Core)</del>
        * [.core](#Core+core) : [`Core`](#Core)
        * [.localVue](#Core+localVue) : Vue
        * [.store](#Core+store) : Vuex.Store
        * [.auth](#Core+auth) : Auth
        * [.config](#Core+config) : Object
        * [.api](#Core+api) : Api
        * [.use(Plugin, options)](#Core+use) ⇒ [`Core`](#Core)
        * [.useAll()](#Core+useAll) ⇒ [`Core`](#Core)
        * [.useI18n()](#Core+useI18n) ⇒ [`Core`](#Core)
        * [.useBootstrapVue()](#Core+useBootstrapVue) ⇒ [`Core`](#Core)
        * [.useRouter()](#Core+useRouter) ⇒ [`Core`](#Core)
        * [.useCommons()](#Core+useCommons) ⇒ [`Core`](#Core)
        * [.useWait()](#Core+useWait) ⇒ [`Core`](#Core)
        * [.useCore()](#Core+useCore) ⇒ [`Core`](#Core)
        * [.configure()](#Core+configure) ⇒ Promise.&lt;Object&gt;
        * [.mount([selector])](#Core+mount) ⇒ Vue
        * [.defer()](#Core+defer)
        * [.dispatch(name, ...args)](#Core+dispatch) ⇒ [`Core`](#Core)
        * [.getUser()](#Core+getUser) : Promise.&lt;Object&gt;
        * [.setPageTitle(title, [suffix])](#Core+setPageTitle)
    * _static_
        * [.init(...options)](#Core.init) ⇒ [`Core`](#Core)


*****

%<a id="new_Core_new"></a>

### new Core(LocalVue, api, mode)Create an application

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

%<a id="Core+ready"></a>

### datashare.ready : Promise.&lt;Object&gt;Get a promise that is resolved when the application is ready

**Kind**: instance property of [`Core`](#Core)  
**Fullfil**: Object The actual application core instance.  

*****

%<a id="Core+app"></a>

### <del>datashare.app : [`Core`](#Core)</del>***Deprecated***

The application core instance. Deprecated in favor or the `core` property.

**Kind**: instance property of [`Core`](#Core)  

*****

%<a id="Core+core"></a>

### datashare.core : [`Core`](#Core)The application core instance

**Kind**: instance property of [`Core`](#Core)  

*****

%<a id="Core+localVue"></a>

### datashare.localVue : VueThe Vue class to instantiate the application with

**Kind**: instance property of [`Core`](#Core)  

*****

%<a id="Core+store"></a>

### datashare.store : Vuex.StoreThe Vuex instance

**Kind**: instance property of [`Core`](#Core)  

*****

%<a id="Core+auth"></a>

### datashare.auth : AuthThe Auth module instance

**Kind**: instance property of [`Core`](#Core)  

*****

%<a id="Core+config"></a>

### datashare.config : ObjectThe configuration object provided by Murmur

**Kind**: instance property of [`Core`](#Core)  

*****

%<a id="Core+api"></a>

### datashare.api : ApiThe Datashare api interface

**Kind**: instance property of [`Core`](#Core)  

*****

%<a id="Core+use"></a>

### datashare.use(Plugin, options) ⇒ [`Core`](#Core)Add a Vue plugin to the instance's LocalVue

**Kind**: instance method of [`Core`](#Core)  
**Returns**: [`Core`](#Core) - the current instance of Core  
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

%<a id="Core+useAll"></a>

### datashare.useAll() ⇒ [`Core`](#Core)Configure all default Vue plugins for this application

**Kind**: instance method of [`Core`](#Core)  
**Returns**: [`Core`](#Core) - the current instance of Core  

*****

%<a id="Core+useI18n"></a>

### datashare.useI18n() ⇒ [`Core`](#Core)Configure vue-i18n plugin

**Kind**: instance method of [`Core`](#Core)  
**Returns**: [`Core`](#Core) - the current instance of Core  

*****

%<a id="Core+useBootstrapVue"></a>

### datashare.useBootstrapVue() ⇒ [`Core`](#Core)Configure bootstrap-vue plugin

**Kind**: instance method of [`Core`](#Core)  
**Returns**: [`Core`](#Core) - the current instance of Core  

*****

%<a id="Core+useRouter"></a>

### datashare.useRouter() ⇒ [`Core`](#Core)Configure vue-router plugin

**Kind**: instance method of [`Core`](#Core)  
**Returns**: [`Core`](#Core) - the current instance of Core  

*****

%<a id="Core+useCommons"></a>

### datashare.useCommons() ⇒ [`Core`](#Core)Configure most common Vue plugins (Murmur, VueProgressBar, VueShortkey, VueScrollTo and VueCalendar)

**Kind**: instance method of [`Core`](#Core)  
**Returns**: [`Core`](#Core) - the current instance of Core  

*****

%<a id="Core+useWait"></a>

### datashare.useWait() ⇒ [`Core`](#Core)Configure vue-wait plugin

**Kind**: instance method of [`Core`](#Core)  
**Returns**: [`Core`](#Core) - the current instance of Core  

*****

%<a id="Core+useCore"></a>

### datashare.useCore() ⇒ [`Core`](#Core)Add a $core property to the instance's Vue

**Kind**: instance method of [`Core`](#Core)  
**Returns**: [`Core`](#Core) - the current instance of Core  

*****

%<a id="Core+configure"></a>

### datashare.configure() ⇒ Promise.&lt;Object&gt;Load settings from the server and instantiate most the application configuration.

**Kind**: instance method of [`Core`](#Core)  
**Fullfil**: [`Core`](#Core) - The instance of the core application  
**Reject**: Object - The Error object  

*****

%<a id="Core+mount"></a>

### datashare.mount([selector]) ⇒ VueMount the instance's vue application

**Kind**: instance method of [`Core`](#Core)  
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

%<a id="Core+defer"></a>

### datashare.defer()Build a promise to be resolved when the application is configured.

**Kind**: instance method of [`Core`](#Core)  

*****

%<a id="Core+dispatch"></a>

### datashare.dispatch(name, ...args) ⇒ [`Core`](#Core)Dispatch an event from the document root, passing the core application through event message.

**Kind**: instance method of [`Core`](#Core)  
**Returns**: [`Core`](#Core) - the current instance of Core  
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

%<a id="Core+getUser"></a>

### datashare.getUser() : Promise.&lt;Object&gt;Get the current signed user.

**Kind**: instance method of [`Core`](#Core)  
**Fullfil**: Object Current user  

*****

%<a id="Core+setPageTitle"></a>

### datashare.setPageTitle(title, [suffix])Append the given title to the page title

**Kind**: instance method of [`Core`](#Core)  
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

%<a id="Core.init"></a>

### Core.init(...options) ⇒ [`Core`](#Core)instantiate a Core class (useful for chaining usage or mapping)

**Kind**: static method of [`Core`](#Core)  
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

%<a id="FiltersMixin"></a>

## FiltersMixinMixin class extending the core to add helpers for filters.

**Kind**: global mixin  

* [FiltersMixin](#FiltersMixin)
    * [.registerFilter(...args)](#FiltersMixin+registerFilter)
    * [.unregisterFilter(name)](#FiltersMixin+unregisterFilter)
    * [.registerFilterForProject(name, ...args)](#FiltersMixin+registerFilterForProject)
    * [.unregisterFilterForProject(name, name)](#FiltersMixin+unregisterFilterForProject)


*****

%<a id="FiltersMixin+registerFilter"></a>

### datashare.registerFilter(...args)Register a filter

**Kind**: instance method of [`FiltersMixin`](#FiltersMixin)  
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

%<a id="FiltersMixin+unregisterFilter"></a>

### datashare.unregisterFilter(name)Unregister a filter

**Kind**: instance method of [`FiltersMixin`](#FiltersMixin)  
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

%<a id="FiltersMixin+registerFilterForProject"></a>

### datashare.registerFilterForProject(name, ...args)Register a filter only for a specific project

**Kind**: instance method of [`FiltersMixin`](#FiltersMixin)  
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

%<a id="FiltersMixin+unregisterFilterForProject"></a>

### datashare.unregisterFilterForProject(name, name)Unregister a filter only for a specific project

**Kind**: instance method of [`FiltersMixin`](#FiltersMixin)  
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

%<a id="HooksMixin"></a>

## HooksMixinMixin class extending the core to add helpers for hooks.

**Kind**: global mixin  

* [HooksMixin](#HooksMixin)
    * [.registerHook(...args)](#HooksMixin+registerHook)
    * [.unregisterHook(name)](#HooksMixin+unregisterHook)
    * [.resetHook(name)](#HooksMixin+resetHook)
    * [.resetHooks()](#HooksMixin+resetHooks)
    * [.registerHookForProject(project, options)](#HooksMixin+registerHookForProject)


*****

%<a id="HooksMixin+registerHook"></a>

### datashare.registerHook(...args)Register a hook

**Kind**: instance method of [`HooksMixin`](#HooksMixin)  
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

%<a id="HooksMixin+unregisterHook"></a>

### datashare.unregisterHook(name)Unregister a specific hook

**Kind**: instance method of [`HooksMixin`](#HooksMixin)  
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

%<a id="HooksMixin+resetHook"></a>

### datashare.resetHook(name)Unregister all hooks from a target

**Kind**: instance method of [`HooksMixin`](#HooksMixin)  
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

%<a id="HooksMixin+resetHooks"></a>

### datashare.resetHooks()Unregister all hooks, on every targets

**Kind**: instance method of [`HooksMixin`](#HooksMixin)  

*****

%<a id="HooksMixin+registerHookForProject"></a>

### datashare.registerHookForProject(project, options)Register a hook for a specific project

**Kind**: instance method of [`HooksMixin`](#HooksMixin)  
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

%<a id="I18nMixin"></a>

## I18nMixinMixin class extending the core to add helpers for i18n.

**Kind**: global mixin  

* [I18nMixin](#I18nMixin)
    * [.initializeI18n()](#I18nMixin+initializeI18n) ⇒ Promise
    * [.setI18nLocale(locale)](#I18nMixin+setI18nLocale) ⇒ String
    * [.hasI18Locale(locale)](#I18nMixin+hasI18Locale) ⇒ Boolean
    * [.loadI18Locale(locale)](#I18nMixin+loadI18Locale) ⇒ Promise


*****

%<a id="I18nMixin+initializeI18n"></a>

### datashare.initializeI18n() ⇒ PromiseInitialize i18N using the local storage and load
the necessary locale's messages

**Kind**: instance method of [`I18nMixin`](#I18nMixin)  

*****

%<a id="I18nMixin+setI18nLocale"></a>

### datashare.setI18nLocale(locale) ⇒ StringSet the active locale both in local stoage and VueI18n.

**Kind**: instance method of [`I18nMixin`](#I18nMixin)  
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

%<a id="I18nMixin+hasI18Locale"></a>

### datashare.hasI18Locale(locale) ⇒ BooleanCheck the given locale storage was loaded.

**Kind**: instance method of [`I18nMixin`](#I18nMixin)  
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

%<a id="I18nMixin+loadI18Locale"></a>

### datashare.loadI18Locale(locale) ⇒ PromiseLoad i18n messages for the given locale (if needed)
and set it as the current locale.

**Kind**: instance method of [`I18nMixin`](#I18nMixin)  
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

%<a id="PipelinesMixin"></a>

## PipelinesMixinMixin class extending the core to add helpers for pipelines.

**Kind**: global mixin  

* [PipelinesMixin](#PipelinesMixin)
    * [.registerPipeline(...args, category)](#PipelinesMixin+registerPipeline)
    * [.unregisterPipeline(name)](#PipelinesMixin+unregisterPipeline)
    * [.registerPipelineForProject(project, ...args, category)](#PipelinesMixin+registerPipelineForProject)
    * [.unregisterPipelineForProject(project, name)](#PipelinesMixin+unregisterPipelineForProject)


*****

%<a id="PipelinesMixin+registerPipeline"></a>

### datashare.registerPipeline(...args, category)Register a pipeline

**Kind**: instance method of [`PipelinesMixin`](#PipelinesMixin)  
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

%<a id="PipelinesMixin+unregisterPipeline"></a>

### datashare.unregisterPipeline(name)Unregister a pipeline

**Kind**: instance method of [`PipelinesMixin`](#PipelinesMixin)  
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

%<a id="PipelinesMixin+registerPipelineForProject"></a>

### datashare.registerPipelineForProject(project, ...args, category)Register a pipeline for a specific project

**Kind**: instance method of [`PipelinesMixin`](#PipelinesMixin)  
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

%<a id="PipelinesMixin+unregisterPipelineForProject"></a>

### datashare.unregisterPipelineForProject(project, name)Unregister a pipeline for a specific project

**Kind**: instance method of [`PipelinesMixin`](#PipelinesMixin)  
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

%<a id="ProjectsMixin"></a>

## ProjectsMixinMixin class extending the core to add helpers for projects.

**Kind**: global mixin  

* [ProjectsMixin](#ProjectsMixin)
    * [.toggleForProject(name, withFn, withoutFn, mutationType, storePath)](#ProjectsMixin+toggleForProject)
    * [.createDefaultProject()](#ProjectsMixin+createDefaultProject) ⇒ Promise:Object


*****

%<a id="ProjectsMixin+toggleForProject"></a>

### datashare.toggleForProject(name, withFn, withoutFn, mutationType, storePath)Call a function when a project is selected

**Kind**: instance method of [`ProjectsMixin`](#ProjectsMixin)  
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

%<a id="ProjectsMixin+createDefaultProject"></a>

### datashare.createDefaultProject() ⇒ Promise:ObjectCreate a default project on Datashare using the API

**Kind**: instance method of [`ProjectsMixin`](#ProjectsMixin)  
**Returns**: Promise:Object - The HTTP response object  

*****

%<a id="WidgetsMixin"></a>

## WidgetsMixinMixin class extending the core to add helpers for widgets.

**Kind**: global mixin  

* [WidgetsMixin](#WidgetsMixin)
    * [.registerWidget(...args)](#WidgetsMixin+registerWidget)
    * [.unregisterWidget(name)](#WidgetsMixin+unregisterWidget)
    * [.clearWidgets()](#WidgetsMixin+clearWidgets)
    * [.registerWidgetForProject(project, options)](#WidgetsMixin+registerWidgetForProject)
    * [.replaceWidget(name, options)](#WidgetsMixin+replaceWidget)
    * [.replaceWidgetForProject(project, name, options)](#WidgetsMixin+replaceWidgetForProject)


*****

%<a id="WidgetsMixin+registerWidget"></a>

### datashare.registerWidget(...args)Register a widget

**Kind**: instance method of [`WidgetsMixin`](#WidgetsMixin)  
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

%<a id="WidgetsMixin+unregisterWidget"></a>

### datashare.unregisterWidget(name)Unregister a widget

**Kind**: instance method of [`WidgetsMixin`](#WidgetsMixin)  
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

%<a id="WidgetsMixin+clearWidgets"></a>

### datashare.clearWidgets()Unregister all widgets

**Kind**: instance method of [`WidgetsMixin`](#WidgetsMixin)  

*****

%<a id="WidgetsMixin+registerWidgetForProject"></a>

### datashare.registerWidgetForProject(project, options)Register a widget for a specific project

**Kind**: instance method of [`WidgetsMixin`](#WidgetsMixin)  
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

%<a id="WidgetsMixin+replaceWidget"></a>

### datashare.replaceWidget(name, options)Replace an existing widget

**Kind**: instance method of [`WidgetsMixin`](#WidgetsMixin)  
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

%<a id="WidgetsMixin+replaceWidgetForProject"></a>

### datashare.replaceWidgetForProject(project, name, options)Replace an existing widget for a specific project

**Kind**: instance method of [`WidgetsMixin`](#WidgetsMixin)  
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

%<a id="projects"></a>

## projects ⇒ Array:StringList all projects this user has access to.

**Kind**: global variable  

*****

%
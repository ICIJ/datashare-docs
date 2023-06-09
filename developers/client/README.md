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

## Classes

<dl>
<dt><a href="#Core">Core</a></dt>
<dd><p>Class representing the core application with public methods for plugins.</p>
</dd>
</dl>

## Mixins

<dl>
<dt><a href="#FiltersMixin">FiltersMixin</a></dt>
<dd><p>Mixin class extending the core to add helpers for filters.</p>
</dd>
<dt><a href="#HooksMixin">HooksMixin</a></dt>
<dd><p>Mixin class extending the core to add helpers for hooks.</p>
</dd>
<dt><a href="#I18nMixin">I18nMixin</a></dt>
<dd><p>Mixin class extending the core to add helpers for i18n.</p>
</dd>
<dt><a href="#PipelinesMixin">PipelinesMixin</a></dt>
<dd><p>Mixin class extending the core to add helpers for pipelines.</p>
</dd>
<dt><a href="#ProjectsMixin">ProjectsMixin</a></dt>
<dd><p>Mixin class extending the core to add helpers for projects.</p>
</dd>
<dt><a href="#WidgetsMixin">WidgetsMixin</a></dt>
<dd><p>Mixin class extending the core to add helpers for widgets.</p>
</dd>
</dl>

## Members

<dl>
<dt><a href="#projects">projects</a> ⇒ <code>Array:String</code></dt>
<dd><p>List all projects this user has access to.</p>
</dd>
</dl>

<a name="Core"></a>

## Core
Class representing the core application with public methods for plugins.

**Kind**: global class  
**Mixes**: [<code>FiltersMixin</code>](#FiltersMixin), [<code>HooksMixin</code>](#HooksMixin), [<code>I18nMixin</code>](#I18nMixin), [<code>PipelinesMixin</code>](#PipelinesMixin), [<code>ProjectsMixin</code>](#ProjectsMixin), [<code>WidgetsMixin</code>](#WidgetsMixin)  

* [Core](#Core)
    * [new Core(LocalVue, api, mode)](#new_Core_new)
    * _instance_
        * [.ready](#Core+ready) : <code>Promise.&lt;Object&gt;</code>
        * <del>[.app](#Core+app) : [<code>Core</code>](#Core)</del>
        * [.core](#Core+core) : [<code>Core</code>](#Core)
        * [.localVue](#Core+localVue) : <code>Vue</code>
        * [.store](#Core+store) : <code>Vuex.Store</code>
        * [.auth](#Core+auth) : <code>Auth</code>
        * [.config](#Core+config) : <code>Object</code>
        * [.api](#Core+api) : <code>Api</code>
        * [.use(Plugin, options)](#Core+use) ⇒ [<code>Core</code>](#Core)
        * [.useAll()](#Core+useAll) ⇒ [<code>Core</code>](#Core)
        * [.useI18n()](#Core+useI18n) ⇒ [<code>Core</code>](#Core)
        * [.useBootstrapVue()](#Core+useBootstrapVue) ⇒ [<code>Core</code>](#Core)
        * [.useRouter()](#Core+useRouter) ⇒ [<code>Core</code>](#Core)
        * [.useCommons()](#Core+useCommons) ⇒ [<code>Core</code>](#Core)
        * [.useWait()](#Core+useWait) ⇒ [<code>Core</code>](#Core)
        * [.useCore()](#Core+useCore) ⇒ [<code>Core</code>](#Core)
        * [.configure()](#Core+configure) ⇒ <code>Promise.&lt;Object&gt;</code>
        * [.mount([selector])](#Core+mount) ⇒ <code>Vue</code>
        * [.defer()](#Core+defer)
        * [.dispatch(name, ...args)](#Core+dispatch) ⇒ [<code>Core</code>](#Core)
        * [.getUser()](#Core+getUser) : <code>Promise.&lt;Object&gt;</code>
        * [.setPageTitle(title, [suffix])](#Core+setPageTitle)
    * _static_
        * [.init(...options)](#Core.init) ⇒ [<code>Core</code>](#Core)


* * *

<a name="new_Core_new"></a>

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
    <td>LocalVue</td><td><code>Object</code></td><td><p>The Vue class to instantiate the application with.</p>
</td>
    </tr><tr>
    <td>api</td><td></td><td><p>Datashare api interface</p>
</td>
    </tr><tr>
    <td>mode</td><td></td><td><p>mode of authentication (&#39;local&#39; or &#39;server&#39;</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="Core+ready"></a>

### datashare.ready : <code>Promise.&lt;Object&gt;</code>
Get a promise that is resolved when the application is ready

**Kind**: instance property of [<code>Core</code>](#Core)  
**Fullfil**: <code>Object</code> The actual application core instance.  

* * *

<a name="Core+app"></a>

### <del>datashare.app : [<code>Core</code>](#Core)</del>
***Deprecated***

The application core instance. Deprecated in favor or the `core` property.

**Kind**: instance property of [<code>Core</code>](#Core)  

* * *

<a name="Core+core"></a>

### datashare.core : [<code>Core</code>](#Core)
The application core instance

**Kind**: instance property of [<code>Core</code>](#Core)  

* * *

<a name="Core+localVue"></a>

### datashare.localVue : <code>Vue</code>
The Vue class to instantiate the application with

**Kind**: instance property of [<code>Core</code>](#Core)  

* * *

<a name="Core+store"></a>

### datashare.store : <code>Vuex.Store</code>
The Vuex instance

**Kind**: instance property of [<code>Core</code>](#Core)  

* * *

<a name="Core+auth"></a>

### datashare.auth : <code>Auth</code>
The Auth module instance

**Kind**: instance property of [<code>Core</code>](#Core)  

* * *

<a name="Core+config"></a>

### datashare.config : <code>Object</code>
The configuration object provided by Murmur

**Kind**: instance property of [<code>Core</code>](#Core)  

* * *

<a name="Core+api"></a>

### datashare.api : <code>Api</code>
The Datashare api interface

**Kind**: instance property of [<code>Core</code>](#Core)  

* * *

<a name="Core+use"></a>

### datashare.use(Plugin, options) ⇒ [<code>Core</code>](#Core)
Add a Vue plugin to the instance's LocalVue

**Kind**: instance method of [<code>Core</code>](#Core)  
**Returns**: [<code>Core</code>](#Core) - the current instance of Core  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>Plugin</td><td><code>Object</code></td><td><p>The actual Vue plugin class</p>
</td>
    </tr><tr>
    <td>options</td><td><code>Object</code></td><td><p>Option to pass to the plugin</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="Core+useAll"></a>

### datashare.useAll() ⇒ [<code>Core</code>](#Core)
Configure all default Vue plugins for this application

**Kind**: instance method of [<code>Core</code>](#Core)  
**Returns**: [<code>Core</code>](#Core) - the current instance of Core  

* * *

<a name="Core+useI18n"></a>

### datashare.useI18n() ⇒ [<code>Core</code>](#Core)
Configure vue-i18n plugin

**Kind**: instance method of [<code>Core</code>](#Core)  
**Returns**: [<code>Core</code>](#Core) - the current instance of Core  

* * *

<a name="Core+useBootstrapVue"></a>

### datashare.useBootstrapVue() ⇒ [<code>Core</code>](#Core)
Configure bootstrap-vue plugin

**Kind**: instance method of [<code>Core</code>](#Core)  
**Returns**: [<code>Core</code>](#Core) - the current instance of Core  

* * *

<a name="Core+useRouter"></a>

### datashare.useRouter() ⇒ [<code>Core</code>](#Core)
Configure vue-router plugin

**Kind**: instance method of [<code>Core</code>](#Core)  
**Returns**: [<code>Core</code>](#Core) - the current instance of Core  

* * *

<a name="Core+useCommons"></a>

### datashare.useCommons() ⇒ [<code>Core</code>](#Core)
Configure most common Vue plugins (Murmur, VueProgressBar, VueShortkey, VueScrollTo and VueCalendar)

**Kind**: instance method of [<code>Core</code>](#Core)  
**Returns**: [<code>Core</code>](#Core) - the current instance of Core  

* * *

<a name="Core+useWait"></a>

### datashare.useWait() ⇒ [<code>Core</code>](#Core)
Configure vue-wait plugin

**Kind**: instance method of [<code>Core</code>](#Core)  
**Returns**: [<code>Core</code>](#Core) - the current instance of Core  

* * *

<a name="Core+useCore"></a>

### datashare.useCore() ⇒ [<code>Core</code>](#Core)
Add a $core property to the instance's Vue

**Kind**: instance method of [<code>Core</code>](#Core)  
**Returns**: [<code>Core</code>](#Core) - the current instance of Core  

* * *

<a name="Core+configure"></a>

### datashare.configure() ⇒ <code>Promise.&lt;Object&gt;</code>
Load settings from the server and instantiate most the application configuration.

**Kind**: instance method of [<code>Core</code>](#Core)  
**Fullfil**: [<code>Core</code>](#Core) - The instance of the core application  
**Reject**: <code>Object</code> - The Error object  

* * *

<a name="Core+mount"></a>

### datashare.mount([selector]) ⇒ <code>Vue</code>
Mount the instance's vue application

**Kind**: instance method of [<code>Core</code>](#Core)  
**Returns**: <code>Vue</code> - The instantiated Vue  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>[selector]</td><td><code>String</code></td><td><code>#app</code></td><td><p>Query selector to the mounting point</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="Core+defer"></a>

### datashare.defer()
Build a promise to be resolved when the application is configured.

**Kind**: instance method of [<code>Core</code>](#Core)  

* * *

<a name="Core+dispatch"></a>

### datashare.dispatch(name, ...args) ⇒ [<code>Core</code>](#Core)
Dispatch an event from the document root, passing the core application through event message.

**Kind**: instance method of [<code>Core</code>](#Core)  
**Returns**: [<code>Core</code>](#Core) - the current instance of Core  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td><code>String</code></td><td><p>Name of the event to fire</p>
</td>
    </tr><tr>
    <td>...args</td><td><code>Mixed</code></td><td><p>Additional params to pass to the event</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="Core+getUser"></a>

### datashare.getUser() : <code>Promise.&lt;Object&gt;</code>
Get the current signed user.

**Kind**: instance method of [<code>Core</code>](#Core)  
**Fullfil**: <code>Object</code> Current user  

* * *

<a name="Core+setPageTitle"></a>

### datashare.setPageTitle(title, [suffix])
Append the given title to the page title

**Kind**: instance method of [<code>Core</code>](#Core)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>title</td><td><code>String</code></td><td><code></code></td><td><p>Title to append to the page</p>
</td>
    </tr><tr>
    <td>[suffix]</td><td><code>String</code></td><td><code>Datashare</code></td><td><p>Suffix to the title</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="Core.init"></a>

### Core.init(...options) ⇒ [<code>Core</code>](#Core)
instantiate a Core class (useful for chaining usage or mapping)

**Kind**: static method of [<code>Core</code>](#Core)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>...options</td><td><code>Mixed</code></td><td><p>Options to pass to the Core constructor</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="FiltersMixin"></a>

## FiltersMixin
Mixin class extending the core to add helpers for filters.

**Kind**: global mixin  

* [FiltersMixin](#FiltersMixin)
    * [.registerFilter(...args)](#FiltersMixin+registerFilter)
    * [.unregisterFilter(name)](#FiltersMixin+unregisterFilter)
    * [.registerFilterForProject(name, ...args)](#FiltersMixin+registerFilterForProject)
    * [.unregisterFilterForProject(name, name)](#FiltersMixin+unregisterFilterForProject)


* * *

<a name="FiltersMixin+registerFilter"></a>

### datashare.registerFilter(...args)
Register a filter

**Kind**: instance method of [<code>FiltersMixin</code>](#FiltersMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>...args</td><td><code>Mixed</code></td><td></td><td><p>Filter&#39;s params.</p>
</td>
    </tr><tr>
    <td>args.type</td><td><code>String</code></td><td></td><td><p>Type of the filter.</p>
</td>
    </tr><tr>
    <td>args.options</td><td><code>Object</code></td><td></td><td><p>Options to pass to the filter constructor.</p>
</td>
    </tr><tr>
    <td>args.options.name</td><td><code>String</code></td><td></td><td><p>Name of the filter.</p>
</td>
    </tr><tr>
    <td>args.options.key</td><td><code>String</code></td><td></td><td><p>Key of the filter. Typically ElasticSearch field name.</p>
</td>
    </tr><tr>
    <td>[args.options.icon]</td><td><code>String</code></td><td><code></code></td><td><p>Icon of the filter.</p>
</td>
    </tr><tr>
    <td>[args.options.isSearchable]</td><td><code>Boolean</code></td><td><code>false</code></td><td><p>Set if this filter should be searchable or not.</p>
</td>
    </tr><tr>
    <td>[args.options.alternativeSearch]</td><td><code>function</code></td><td><code>()&#x3D;&gt;{})</code></td><td><p>Set a function about how to transform query term before searching for it.</p>
</td>
    </tr><tr>
    <td>[args.options.order]</td><td><code>Number</code></td><td><code></code></td><td><p>Order of the filter. Will be added as last filter by default.</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="FiltersMixin+unregisterFilter"></a>

### datashare.unregisterFilter(name)
Unregister a filter

**Kind**: instance method of [<code>FiltersMixin</code>](#FiltersMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td><code>String</code></td><td><p>Name of the filter to unregister</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="FiltersMixin+registerFilterForProject"></a>

### datashare.registerFilterForProject(name, ...args)
Register a filter only for a specific project

**Kind**: instance method of [<code>FiltersMixin</code>](#FiltersMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td><code>String</code></td><td><p>Name of the project</p>
</td>
    </tr><tr>
    <td>...args</td><td><code>Mixed</code></td><td><p>Filter&#39;s options.</p>
</td>
    </tr><tr>
    <td>args.name</td><td><code>String</code></td><td><p>Name of the filter</p>
</td>
    </tr><tr>
    <td>args.type</td><td><code>String</code></td><td><p>Type of the filter.</p>
</td>
    </tr><tr>
    <td>args.options</td><td><code>Object</code></td><td><p>Options to pass to the filter constructor</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="FiltersMixin+unregisterFilterForProject"></a>

### datashare.unregisterFilterForProject(name, name)
Unregister a filter only for a specific project

**Kind**: instance method of [<code>FiltersMixin</code>](#FiltersMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td><code>String</code></td><td><p>Name of the project</p>
</td>
    </tr><tr>
    <td>name</td><td><code>String</code></td><td><p>Name of the filter</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="HooksMixin"></a>

## HooksMixin
Mixin class extending the core to add helpers for hooks.

**Kind**: global mixin  

* [HooksMixin](#HooksMixin)
    * [.registerHook(...args)](#HooksMixin+registerHook)
    * [.unregisterHook(name)](#HooksMixin+unregisterHook)
    * [.resetHook(name)](#HooksMixin+resetHook)
    * [.resetHooks()](#HooksMixin+resetHooks)
    * [.registerHookForProject(project, options)](#HooksMixin+registerHookForProject)


* * *

<a name="HooksMixin+registerHook"></a>

### datashare.registerHook(...args)
Register a hook

**Kind**: instance method of [<code>HooksMixin</code>](#HooksMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>...args</td><td><code>Mixed</code></td><td><p>Hook&#39;s options</p>
</td>
    </tr><tr>
    <td>args.name</td><td><code>String</code></td><td><p>Name of the hook</p>
</td>
    </tr><tr>
    <td>args.target</td><td><code>String</code></td><td><p>Target of the hook</p>
</td>
    </tr><tr>
    <td>args.order</td><td><code>Number</code></td><td><p>Priority of the hook</p>
</td>
    </tr><tr>
    <td>args.definition</td><td><code>Object</code></td><td><p>Options to pass to the hook constructor</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="HooksMixin+unregisterHook"></a>

### datashare.unregisterHook(name)
Unregister a specific hook

**Kind**: instance method of [<code>HooksMixin</code>](#HooksMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td><code>String</code></td><td><p>Name of the hook</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="HooksMixin+resetHook"></a>

### datashare.resetHook(name)
Unregister all hooks from a target

**Kind**: instance method of [<code>HooksMixin</code>](#HooksMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td><code>String</code></td><td><p>Name of the target</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="HooksMixin+resetHooks"></a>

### datashare.resetHooks()
Unregister all hooks, on every targets

**Kind**: instance method of [<code>HooksMixin</code>](#HooksMixin)  

* * *

<a name="HooksMixin+registerHookForProject"></a>

### datashare.registerHookForProject(project, options)
Register a hook for a specific project

**Kind**: instance method of [<code>HooksMixin</code>](#HooksMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>project</td><td><code>String</code></td><td><p>Project to add this hook to</p>
</td>
    </tr><tr>
    <td>options</td><td><code>Object</code></td><td><p>Hook&#39;s options</p>
</td>
    </tr><tr>
    <td>options.name</td><td><code>String</code></td><td><p>Name of the hook</p>
</td>
    </tr><tr>
    <td>options.target</td><td><code>String</code></td><td><p>Target of the hook</p>
</td>
    </tr><tr>
    <td>options.order</td><td><code>Number</code></td><td><p>Priority of the hook</p>
</td>
    </tr><tr>
    <td>options.definition</td><td><code>Object</code></td><td><p>Options to pass to the hook constructor</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="I18nMixin"></a>

## I18nMixin
Mixin class extending the core to add helpers for i18n.

**Kind**: global mixin  

* [I18nMixin](#I18nMixin)
    * [.initializeI18n()](#I18nMixin+initializeI18n) ⇒ <code>Promise</code>
    * [.setI18nLocale(locale)](#I18nMixin+setI18nLocale) ⇒ <code>String</code>
    * [.hasI18Locale(locale)](#I18nMixin+hasI18Locale) ⇒ <code>Boolean</code>
    * [.loadI18Locale(locale)](#I18nMixin+loadI18Locale) ⇒ <code>Promise</code>


* * *

<a name="I18nMixin+initializeI18n"></a>

### datashare.initializeI18n() ⇒ <code>Promise</code>
Initialize i18N using the local storage and load
the necessary locale's messages

**Kind**: instance method of [<code>I18nMixin</code>](#I18nMixin)  

* * *

<a name="I18nMixin+setI18nLocale"></a>

### datashare.setI18nLocale(locale) ⇒ <code>String</code>
Set the active locale both in local stoage and VueI18n.

**Kind**: instance method of [<code>I18nMixin</code>](#I18nMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>locale</td><td><code>String</code></td><td><p>Key of the local (fr, de, en, ja, ...)</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="I18nMixin+hasI18Locale"></a>

### datashare.hasI18Locale(locale) ⇒ <code>Boolean</code>
Check the given locale storage was loaded.

**Kind**: instance method of [<code>I18nMixin</code>](#I18nMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>locale</td><td><code>String</code></td><td><p>Key of the local (fr, de, en, ja, ...)</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="I18nMixin+loadI18Locale"></a>

### datashare.loadI18Locale(locale) ⇒ <code>Promise</code>
Load i18n messages for the given locale (if needed)
and set it as the current locale.

**Kind**: instance method of [<code>I18nMixin</code>](#I18nMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>locale</td><td><code>String</code></td><td><p>Key of the local (fr, de, en, ja, ...)</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="PipelinesMixin"></a>

## PipelinesMixin
Mixin class extending the core to add helpers for pipelines.

**Kind**: global mixin  

* [PipelinesMixin](#PipelinesMixin)
    * [.registerPipeline(...args, category)](#PipelinesMixin+registerPipeline)
    * [.unregisterPipeline(name)](#PipelinesMixin+unregisterPipeline)
    * [.registerPipelineForProject(project, ...args, category)](#PipelinesMixin+registerPipelineForProject)
    * [.unregisterPipelineForProject(project, name)](#PipelinesMixin+unregisterPipelineForProject)


* * *

<a name="PipelinesMixin+registerPipeline"></a>

### datashare.registerPipeline(...args, category)
Register a pipeline

**Kind**: instance method of [<code>PipelinesMixin</code>](#PipelinesMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>...args</td><td><code>Mixed</code></td><td><p>Pipeline&#39;s options.</p>
</td>
    </tr><tr>
    <td>args.name</td><td><code>String</code></td><td><p>Name of the pipeline</p>
</td>
    </tr><tr>
    <td>args.type</td><td><code>String</code> | <code>function</code></td><td><p>Type of the pipeline.</p>
</td>
    </tr><tr>
    <td>category</td><td><code>String</code></td><td><p>The pipeline to target</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="PipelinesMixin+unregisterPipeline"></a>

### datashare.unregisterPipeline(name)
Unregister a pipeline

**Kind**: instance method of [<code>PipelinesMixin</code>](#PipelinesMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td><code>String</code></td><td><p>Name of the pipeline</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="PipelinesMixin+registerPipelineForProject"></a>

### datashare.registerPipelineForProject(project, ...args, category)
Register a pipeline for a specific project

**Kind**: instance method of [<code>PipelinesMixin</code>](#PipelinesMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>project</td><td><code>String</code></td><td><p>Name of the project</p>
</td>
    </tr><tr>
    <td>...args</td><td><code>Mixed</code></td><td><p>Pipeline&#39;s options.</p>
</td>
    </tr><tr>
    <td>args.name</td><td><code>String</code></td><td><p>Name of the pipeline</p>
</td>
    </tr><tr>
    <td>args.type</td><td><code>String</code> | <code>function</code></td><td><p>Type of the pipeline.</p>
</td>
    </tr><tr>
    <td>category</td><td><code>String</code></td><td><p>The pipeline to target</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="PipelinesMixin+unregisterPipelineForProject"></a>

### datashare.unregisterPipelineForProject(project, name)
Unregister a pipeline for a specific project

**Kind**: instance method of [<code>PipelinesMixin</code>](#PipelinesMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>project</td><td><code>String</code></td><td><p>Name of the project</p>
</td>
    </tr><tr>
    <td>name</td><td><code>String</code></td><td><p>Name of the pipeline</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="ProjectsMixin"></a>

## ProjectsMixin
Mixin class extending the core to add helpers for projects.

**Kind**: global mixin  

* [ProjectsMixin](#ProjectsMixin)
    * [.toggleForProject(name, withFn, withoutFn, mutationType, storePath)](#ProjectsMixin+toggleForProject)
    * [.createDefaultProject()](#ProjectsMixin+createDefaultProject) ⇒ <code>Promise:Object</code>


* * *

<a name="ProjectsMixin+toggleForProject"></a>

### datashare.toggleForProject(name, withFn, withoutFn, mutationType, storePath)
Call a function when a project is selected

**Kind**: instance method of [<code>ProjectsMixin</code>](#ProjectsMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td><code>String</code></td><td><p>Name of the project</p>
</td>
    </tr><tr>
    <td>withFn</td><td><code>function</code></td><td><p>Function to call when the project is selected</p>
</td>
    </tr><tr>
    <td>withoutFn</td><td><code>function</code></td><td><p>Function to call when the project is unselected</p>
</td>
    </tr><tr>
    <td>mutationType</td><td><code>String</code></td><td><p>Mutation type that will be watched for changes.</p>
</td>
    </tr><tr>
    <td>storePath</td><td><code>String</code></td><td><p>Path to the project in the store</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="ProjectsMixin+createDefaultProject"></a>

### datashare.createDefaultProject() ⇒ <code>Promise:Object</code>
Create a default project on Datashare using the API

**Kind**: instance method of [<code>ProjectsMixin</code>](#ProjectsMixin)  
**Returns**: <code>Promise:Object</code> - The HTTP response object  

* * *

<a name="WidgetsMixin"></a>

## WidgetsMixin
Mixin class extending the core to add helpers for widgets.

**Kind**: global mixin  

* [WidgetsMixin](#WidgetsMixin)
    * [.registerWidget(...args)](#WidgetsMixin+registerWidget)
    * [.unregisterWidget(name)](#WidgetsMixin+unregisterWidget)
    * [.clearWidgets()](#WidgetsMixin+clearWidgets)
    * [.registerWidgetForProject(project, options)](#WidgetsMixin+registerWidgetForProject)
    * [.replaceWidget(name, options)](#WidgetsMixin+replaceWidget)
    * [.replaceWidgetForProject(project, name, options)](#WidgetsMixin+replaceWidgetForProject)


* * *

<a name="WidgetsMixin+registerWidget"></a>

### datashare.registerWidget(...args)
Register a widget

**Kind**: instance method of [<code>WidgetsMixin</code>](#WidgetsMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>...args</td><td><code>Mixed</code></td><td></td><td><p>Widget&#39;s options passed to widget constructor</p>
</td>
    </tr><tr>
    <td>args.name</td><td><code>String</code></td><td></td><td><p>Name of the widget</p>
</td>
    </tr><tr>
    <td>args.card</td><td><code>Boolean</code></td><td></td><td><p>Either or not this widget should be a <code>card</code> component from Boostrap.</p>
</td>
    </tr><tr>
    <td>args.cols</td><td><code>Number</code></td><td></td><td><p>Number of columns to fill in the grid (from 1 to 12)</p>
</td>
    </tr><tr>
    <td>[args.type]</td><td><code>String</code></td><td><code>WidgetEmpty</code></td><td><p>Type of the widget</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="WidgetsMixin+unregisterWidget"></a>

### datashare.unregisterWidget(name)
Unregister a widget

**Kind**: instance method of [<code>WidgetsMixin</code>](#WidgetsMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td><code>String</code></td><td><p>Name of the widget to unregister</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="WidgetsMixin+clearWidgets"></a>

### datashare.clearWidgets()
Unregister all widgets

**Kind**: instance method of [<code>WidgetsMixin</code>](#WidgetsMixin)  

* * *

<a name="WidgetsMixin+registerWidgetForProject"></a>

### datashare.registerWidgetForProject(project, options)
Register a widget for a specific project

**Kind**: instance method of [<code>WidgetsMixin</code>](#WidgetsMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>project</td><td><code>String</code></td><td></td><td><p>Name of the project to add this widget to</p>
</td>
    </tr><tr>
    <td>options</td><td><code>Object</code></td><td></td><td><p>Widget&#39;s options passed to widget constructor</p>
</td>
    </tr><tr>
    <td>options.name</td><td><code>String</code></td><td></td><td><p>Name of the widget</p>
</td>
    </tr><tr>
    <td>options.card</td><td><code>Boolean</code></td><td></td><td><p>Either or not this widget should be a <code>card</code> component from Boostrap</p>
</td>
    </tr><tr>
    <td>options.cols</td><td><code>Number</code></td><td></td><td><p>Number of columns to fill in the grid (from 1 to 12)</p>
</td>
    </tr><tr>
    <td>[options.type]</td><td><code>String</code></td><td><code>WidgetEmpty</code></td><td><p>Type of the widget</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="WidgetsMixin+replaceWidget"></a>

### datashare.replaceWidget(name, options)
Replace an existing widget

**Kind**: instance method of [<code>WidgetsMixin</code>](#WidgetsMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>name</td><td><code>String</code></td><td></td><td><p>Name of the widget to replace</p>
</td>
    </tr><tr>
    <td>options</td><td><code>Object</code></td><td></td><td><p>Widget&#39;s options passed to widget constructor.</p>
</td>
    </tr><tr>
    <td>options.card</td><td><code>Boolean</code></td><td></td><td><p>Either or not this widget should be a <code>card</code> component from Boostrap</p>
</td>
    </tr><tr>
    <td>options.cols</td><td><code>Number</code></td><td></td><td><p>Number of columns to fill in the grid (from 1 to 12)</p>
</td>
    </tr><tr>
    <td>[options.type]</td><td><code>String</code></td><td><code>WidgetEmpty</code></td><td><p>Type of the widget</p>
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

* * *

<a name="WidgetsMixin+replaceWidgetForProject"></a>

### datashare.replaceWidgetForProject(project, name, options)
Replace an existing widget for a specific project

**Kind**: instance method of [<code>WidgetsMixin</code>](#WidgetsMixin)  
<table>
  <thead>
    <tr>
      <th>Param</th><th>Type</th><th>Default</th><th>Description</th>
    </tr>
  </thead>
  <tbody>
<tr>
    <td>project</td><td><code>String</code></td><td></td><td><p>Name of the project to add this widget to</p>
</td>
    </tr><tr>
    <td>name</td><td><code>String</code></td><td></td><td><p>Name of the widget to replace</p>
</td>
    </tr><tr>
    <td>options</td><td><code>Object</code></td><td></td><td><p>Widget&#39;s options passed to widget constructor. Each widget class can define its own default values.</p>
</td>
    </tr><tr>
    <td>options.card</td><td><code>Boolean</code></td><td></td><td><p>Either or not this widget should be a <code>card</code> component from Boostrap</p>
</td>
    </tr><tr>
    <td>options.cols</td><td><code>Number</code></td><td></td><td><p>Number of columns to fill in the grid (from 1 to 12)</p>
</td>
    </tr><tr>
    <td>[options.type]</td><td><code>String</code></td><td><code>WidgetEmpty</code></td><td><p>Type of the widget</p>
</td>
    </tr>  </tbody>
</table>


* * *

<a name="projects"></a>

## projects ⇒ <code>Array:String</code>
List all projects this user has access to.

**Kind**: global variable  

* * *


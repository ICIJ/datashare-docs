---
description: >-
  What if you want to integrate text translations to Datashare’s interface? Or
  make it display tweets scraped with Twint? Ask no more: there is plugins for
  that!
---

# Write plugins

Since [version 5.6.1](https://github.com/ICIJ/datashare/releases/tag/5.6.1), instead of modifying Datashare directly, you can now isolate your code with a specific set of features and then configure Datashare to use it. Each Datashare user could pick the plugins they need or want, and have a fully customized installation of our search platform.

### Getting started

When starting, Datashare can receive a `pluginsDir` option, pointing to your plugins' directory. In this example, this directory is called `~/Datashare Plugins`:

```bash
mkdir ~/Datashare\ Plugins
datashare --pluginsDir=~/Datashare\ Plugins
```

### Installing and Removing registered plugins

#### Listing

You can list official Datashare plugins like this :

```bash
$ datashare -m CLI --pluginList ".*"
2020-07-24 10:04:59,767 [main] INFO  Main - Running datashare 
plugin datashare-plugin-site-alert
        Site Alert
        v1.2.0
        https://github.com/ICIJ/datashare-plugin-site-alert
        A plugin to display an alert banner on the Datashare demo instance.
...
```

The string given to `--pluginList` is a [regular expression](https://docs.oracle.com/javase/8/docs/api/java/util/regex/Pattern.html). You can filter the plugin list if you know what you are looking for.

#### Installing

You can install a plugin with its id and providing where the Datashare plugins are stored:

```
$ datashare -m CLI --pluginInstall datashare-plugin-site-alert --pluginsDir "~/Datashare Plugins"
2020-07-24 10:15:46,732 [main] INFO  Main - Running datashare 
2020-07-24 10:15:50,202 [main] INFO  PluginService - downloading from url https://github.com/ICIJ/datashare-plugin-site-alert/archive/v1.2.0.tar.gz
2020-07-24 10:15:50,503 [main] INFO  PluginService - installing plugin from file /tmp/tmp7747128158158548092.gz into /home/dev/Datashare Plugins
```

Then if you launch Datashare with the same plugin location, the plugin will be loaded.

#### Removing

When you want to stop using a plugin, you can either remove by hand the directory inside the plugins folder or remove it with `datashare --pluginDelete` :

```
$ datashare -m CLI --pluginDelete datashare-plugin-site-alert --pluginsDir "~/Datashare Plugins"
2020-07-24 10:20:43,431 [main] INFO  Main - Running datashare 
2020-07-24 10:20:43,640 [main] INFO  PluginService - removing plugin base directory /home/dev/Datashare Plugins/datashare-plugin-site-alert-1.2.0
```

### Create your first plugin

To inject plugins, Datashare will look for a Node-compatible module in `~/Datashare Plugins`. This way we can rely on NPM/Yarn to handle built packages. As described in [NPM documentation](https://docs.npmjs.com/about-packages-and-modules#about-modules), it can be:

```
* A folder with a package.json file containing a "main" field.
* A folder with an index.js file in it.
```

Datashare will read the content of each module in the plugins directory to automatically inject them in the user interface. The backend will serve the plugin files. The entrypoint of each plugin (usually the main property of [package.json](https://docs.npmjs.com/files/package.json)) is injected with a `<script>` tag, right before the closing `</body>` tag.

Create a `hello-world` directory with a single `index.js`:

```bash
mkdir ~/Datashare\ Plugins/hello-world
echo "console.log('Welcome to %s', datashare.config.get('app.name'))" > ~/Datashare\ Plugins/hello-world/index.js
```

Reload the page, open the console: et voilà 🔮! Easy, right?

### Installing and Removing your custom Plugin

Now you would like to develop your plugin in your repository and not necessarily in `Datashare Plugins` folder.

You can have your code under, say `~/src/my-plugin` and deploy it into Datashare with the plugin API. To do so, you'll need to make a zip or a tarball, for example in `~/src/my-plugin/dist/my-plugin.tgz`.

The tarball could contain :

```
$ tar tvzf ~/src/my-plugin/dist/my-plugin.tgz 
drwxr-xr-x dev/dev           0 2020-07-22 11:51 my-plugin/
-rw-r--r-- dev/dev          31 2020-07-21 14:07 my-plugin/main.js
-rw-r--r-- dev/dev          19 2020-07-21 14:07 my-plugin/package.json
```

Then you can install it with:

```
$ datashare -m CLI --pluginInstall ~/src/my-plugin/dist/my-plugin.tgz --pluginsDir "~/Datashare Plugins"
2020-07-27 10:02:32,381 [main] INFO  Main - Running datashare 
2020-07-27 10:02:32,596 [main] INFO  PluginService - installing plugin from file ~/src/my-plugin/dist/my-plugin.tgz into ~/Datashare Plugins
```

And remove it:

```
$ datashare -m CLI --pluginDelete my-plugin --pluginsDir "~/Datashare Plugins"
2020-07-27 10:02:32,381 [main] INFO  Main - Running datashare 
2020-07-27 10:02:32,596 [main] INFO  PluginService - installing plugin from file ~/src/my-plugin/dist/my-plugin.tgz into ~/Datashare Plugins
```

In that case `my-plugin` is the base directory of the plugin (the one that is in the tarball).

###

### Adding elements to the Datashare user interface

To allow external developers to add their own components, we added markers in strategic locations of the user interface where a user can define new [Vue Component](https://vuejs.org/v2/guide/components.html). These markers are called "hooks":

<figure><img src="https://camo.githubusercontent.com/2561dd6d7ce728f32ab1f89153341c816de07ad055770f00b407772af2378352/68747470733a2f2f692e696d6775722e636f6d2f6a70587434336a2e706e67" alt=""><figcaption><p>Note: You can make all hooks visible by changing the config variables with plugins:<br> <code>datashare.config.set('hooksDebug', true)</code>.</p></figcaption></figure>

To register a new component to a hook, use the following method:

```javascript
// `datashare` is a global variable
datashare.registerHook({ target: 'app-sidebar.menu:before', definition: 'This is a message written with a plugin' })
```

Or with a more complex example:

```javascript
// It's usualy safer to wait for the app to be ready
document.addEventListener('datashare:ready', ({ detail }) => {

  // Alert is a Vue component meaning it can have computed properties, methods, etc...
  const Alert = {
    computed: {
      weekday () {
        const today = new Date()
        return today.toLocaleDateString('en-US', { weekday: 'long' })  
      }
    },
    template: `<div class="text-center bg-info p-2 width-100">
      It's {{ weekday }}, have a lovely day!
    </div>`
  }

  // This is the most important part of this snippet: 
  // we register the component on the a given `target`
  // using the core method `registerHook`. 
  detail.core.registerHook({ target: 'landing.form:before', definition: Alert })

})
```

# Write extensions

What if you want to add features to Datashare backend?

Unlike [plugins](../../local-mode/plugins-and-extensions.md) that are providing a way to modify the Datashare frontend, extensions have been created to extend the backend functionalities. There are two extension points that have been defined :

* NLP pipelines : you can add a new java NLP pipeline to Datashare
* HTTP API : you can add HTTP endpoints to Datashare and call the Java API you need in those endpoints

Since [version 7.5.0](https://github.com/ICIJ/datashare/releases/tag/7.5.0), instead of modifying Datashare directly, you can now isolate your code with a specific set of features and then configure Datashare to use it. Each Datashare user could pick the extensions they need or want, and have a fully customized installation of our search platform.

### Getting started

When starting, Datashare can receive an `extensionsDir` option, pointing to your extensions' directory. In this example, let's call it `/home/user/extensions`:

```
mkdir /home/user/extensions
datashare --extensionsDir=/home/user/extensions
```

### Installing and Removing registered extensions

#### Listing

You can list official Datashare extensions like this :

```bash
$ datashare extension list
extension datashare-extension-nlp-opennlp
        OPENNLP Pipeline
        7.0.0
        https://github.com/ICIJ/datashare-extension-nlp-opennlp/releases/download/7.0.0/datashare-nlp-opennlp-7.0.0-jar-with-dependencies.jar
        Extension to extract NER entities with OPENNLP
        NLP
...
```

You can filter by name: `datashare extension list nlp`

#### Installing

You can install an extension with its id and providing where the Datashare extensions are stored:

```bash
$ datashare extension install datashare-extension-nlp-mitie
```

Note: if a custom `--extensionsDir` is needed, it goes before the subcommand:

```bash
$ datashare --extensionsDir /home/user/extensions extension install datashare-extension-nlp-mitie
```

Then if you launch Datashare with the same extension location, the extension will be loaded.

#### Removing

When you want to stop using an extension, you can either remove by hand the jar inside the extensions folder or remove it with `datashare extension delete` :

```bash
$ datashare extension delete datashare-extension-nlp-mitie
```

### Create your first extension

#### NLP extension

You can create a "simple" java project like [https://github.com/ICIJ/datashare-extension-nlp-opennlp](https://github.com/ICIJ/datashare-extension-nlp-opennlp) (as simple as a java project can be right), with you preferred build tool.

You will have to add a dependency to the last version of [datashare-api.jar](https://search.maven.org/artifact/org.icij.datashare/datashare-api) to be able to implement your NLP pipeline.

With the datashare API dependency you can then create a class implementing [Pipeline](https://github.com/ICIJ/datashare-api/blob/master/src/main/java/org/icij/datashare/text/nlp/Pipeline.java) or extending [AbstractPipeline](https://github.com/ICIJ/datashare-api/blob/master/src/main/java/org/icij/datashare/text/nlp/AbstractPipeline.java). When Datashare will load the jar, it will look for a `Pipeline` interface.

Unfortunately, you'll have also to make a pull request to datashare-api to add a new type of pipeline. We [will remove](https://github.com/ICIJ/datashare-api/issues/2) this step in the future.

Build the jar with its dependencies, and install it in the `/home/user/extensions` then start datashare with the `extensionsDir` set to `/home/user/extensions`. Your plugin will be loaded by datashare.

Finally, your pipeline will be listed in the available pipelines in the UI, when [doing NER](../../local-mode/install-datashare-on-linux/add-documents-to-datashare-on-linux.md).

#### HTTP extension

For making a HTTP extension it will be the same as NLP, you'll have to make a java project that will build a jar. The only dependency that you will need is [fluent-http](https://github.com/CodeStory/fluent-http) because datashare will look for fluent http annotations `@Get, @Post, @Put...`

For example, we can create a small class like :

```bash
package org.myorg;

import net.codestory.http.annotations.Get;
import net.codestory.http.annotations.Prefix;

@Prefix("myorg")
public class FooResource {
    @Get("foo")
    public String getFoo() {
        return "hello from foo extension";
    }
}
```

Build the jar, copy it to the `/home/user/extensions` then start datashare:

```bash
$ datashare --extensionsDir /home/user/extensions/
# ... starting logs
2020-08-29 11:03:59,776 [Thread-0] INFO  ExtensionLoader - loading jar /home/user/extensions/my-extension.jar
2020-08-29 11:03:59,779 [Thread-0] INFO  CorsFilter - adding Cross-Origin Request filter allows *
2020-08-29 11:04:00,314 [Thread-0] INFO  Fluent - Production mode
2020-08-29 11:04:00,331 [Thread-0] INFO  Fluent - Server started on port 8080
```

et voilà 🔮 ! You can query your new endpoint. Easy, right?

```bash
$ curl localhost:8080/myorg/foo
hello from foo extension
```

### Installing and Removing your custom Extension

You can also install and remove extensions with the Datashare CLI.

Then you can install it with:

```bash
$ datashare extension install /home/user/src/my-extension/dist/my-extension.jar
```

And remove it:

```bash
$ datashare extension delete my-extension.jar
```

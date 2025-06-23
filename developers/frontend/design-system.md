# Design System

Datashare's frontend is build with Vue 3 and Bootstrap 5. We document all component of the interface on a dedicated Storybook:

{% embed url="https://icij.github.io/datashare-client/" %}

To facile the creation of plugin, each component can be imported directly from the core:

```javascript
// It's usualy safer to wait for the app to be ready
document.addEventListener('datashare:ready', async () => {
    // This load the ButtonIcon component asynchronously
    const ButtonIcon = await datashare.findComponent('Button/ButtonIcon')
    // Than we create a dummy component. For the sake of simplicity we use
    // Vue 3's option API but we strongly encourage you to build your plugins
    // with Vite and use the option API.
    const definition = {
        components: {
            ButtonIcon,
        },
        methods: {
            sayHi() {
                alert('Hi!')
            }
        },
        template: `
            <button-icon @click="sayHi()" icon-left="hand-waving">
                Say hi
            </button-icon>
        `
    }
    
    // Finally, we register the component's definition in a hook.
    datashare.registerHook({ target: 'app-sidebar-sections:before', definition })
})
```

In the example you learn that:

* Datashare launch must be awaited with "datashare:ready"
* You can asynchronously import components with `datashare.findComponent`
* Component can be registered on targeted locations with a "hook"
* All icons from [Phosphor](https://phosphoricons.com/) are available and loaded automatically


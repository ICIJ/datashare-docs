# Hook

> Create a Hook slot. Hooks are registered on-the-fly by plugins to insert arbitrary components.

> functional

## Props

| Prop name | Description                                                              | Type   | Values | Default     |
| --------- | ------------------------------------------------------------------------ | ------ | ------ | ----------- |
| name      | Name of the hook (targeted by plugins).                                  | string | -      |             |
| debugTag  | Specify the HTML tag to render the debug tag instead of the default tag. | string | -      | 'span'      |
| bind      | Properties to pass to each hooks.                                        | object | -      | () =&gt; {} |

---

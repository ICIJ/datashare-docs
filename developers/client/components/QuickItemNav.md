# QuickItemNav

> A simple component to display a next/previous pair of buttons to navigate
> between items (including keyboard shortcut).

## Props

| Prop name       | Description                                                                               | Type    | Values | Default        |
| --------------- | ----------------------------------------------------------------------------------------- | ------- | ------ | -------------- |
| shortkeyScope   | Name of the scope for the shortkey settings.<br/>`@default` Name of the current component | string  | -      | 'QuickItemNav' |
| v-model         | The index of the current item.                                                            | number  | -      | 0              |
| totalItems      | The total number of items in the list.                                                    | number  | -      | 0              |
| hasNextItem     | Enable the "next" button explicitely (regardless of the current `index`).                 | boolean | -      | null           |
| hasPreviousItem | Enable the "preview" button explicitely (regardless of the current `index`).              | boolean | -      | null           |

## Events

| Event name | Properties | Description                                         |
| ---------- | ---------- | --------------------------------------------------- |
| previous   |            | Triggered when user click on the `previous` button. |
| next       |            | Triggered when user click on the `next` button.     |
| input      |            | Triggered when the value of `index` changes.        |

---

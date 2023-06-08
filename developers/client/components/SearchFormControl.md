# SearchFormControl

> A search input with pill layout.

## Props

| Prop name       | Description                                                                         | Type           | Values | Default |
| --------------- | ----------------------------------------------------------------------------------- | -------------- | ------ | ------- |
| v-model         | Input value<br/>`@model` true                                                       | string\|number | -      |         |
| placeholder     | Optional placeholder text                                                           | string         | -      |         |
| submitLabel     | Text to use in the submit button<br/>`@default` $t('searchFormControl.submitLabel') | string         | -      |         |
| fillSubmit      | Fill the submit button with primary color                                           | boolean        | -      |         |
| showSubmitLabel | Show the text in the submit button (only visible for screen-readers by default)     | boolean        | -      |         |
| noIcon          | Hide the magnifying glass icon                                                      | boolean        | -      |         |
| autofocus       | Set the autofocus on the search bar on load                                         | boolean        | -      | true    |
| rounded         | Round the border of the input                                                       | boolean        | -      | true    |
| loading         | Change the state of the input to "loading" (with a spinner)                         | boolean        | -      | false   |
| dark            | Display the input and button on a dark background                                   | boolean        | -      | false   |

## Events

| Event name | Properties | Description |
| ---------- | ---------- | ----------- |
| submit     |            |
| input      |            |

---

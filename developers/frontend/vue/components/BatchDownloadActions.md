# BatchDownloadActions

## Props

| Prop name | Description                        | Type   | Values | Default |
| --------- | ---------------------------------- | ------ | ------ | ------- |
| id        | id of the batch download's task    | string | -      |         |
| name      | Name of the batch download's task  | string | -      |         |
| state     | State of the batch download's task | string | -      | ''      |
| value     | Attributes of the batch download   | object | -      | {}      |

## Events

| Event name     | Properties | Description                                    |
| -------------- | ---------- | ---------------------------------------------- |
| relaunched     |            | The batch download was relaunched successfully |
| relaunchFailed |            | The batch download couldn't be relaunched      |
| deleted        |            | The batch download was deleted successfully    |
| deleteFailed   |            | The batch download couldn't be deleted         |

---

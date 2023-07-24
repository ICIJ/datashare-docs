# UserDisplay

> A component to display usernames.

## Props

| Prop name           | Description                               | Type           | Values | Default                 |
| ------------------- | ----------------------------------------- | -------------- | ------ | ----------------------- |
| avatarHeight        | Default height of the avatar              | string         | -      | '1.75em'                |
| avatarPipeline      | Pipeline name to transform the avatar src | string         | -      | 'user-display-avatar'   |
| fallbackAvatarColor | Color of the fallback avatar              | string         | -      | '#aaa'                  |
| linkFallback        | Fallback of the user link                 | string         | -      | null                    |
| linkPipeline        | Pipeline name to transform the user link  | string         | -      | 'user-display-link'     |
| hideAvatar          | Hide the avatar                           | boolean        | -      |                         |
| hideLink            | Hide the user link                        | boolean        | -      |                         |
| tag                 | Root tag to use for this component        | string\|object | -      | 'span'                  |
| username            | Username to display                       | string         | -      |                         |
| usernamePipeline    | Pipeline name to transform the username   | string         | -      | 'user-display-username' |


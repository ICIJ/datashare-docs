# EllipseStatus

> Draw a badge depending on the status with an ellipse progress diagram.

## Props

| Prop name           | Description                                                                                                                     | Type    | Values                 | Default          |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ------- | ---------------------- | ---------------- |
| status              | Status of the badge.                                                                                                            | string  | -                      | 'warning'        |
| progress            | <p>Progress percentage. If none is specificed while the status is<br>"running", the components passes to a "loading" state.</p> | number  | -                      | null             |
| horizontal          | Dispaly the badge and the progress horizontaly.                                                                                 | boolean | -                      |                  |
| noBadge             | Hide the badge (and show only the ellipse)                                                                                      | boolean | -                      |                  |
| animation           | Default animation for "running" progress.                                                                                       | string  | -                      | 'default 1000 0' |
| ellipseSize         | Size of the ellipse progress.                                                                                                   | number  | -                      | 25               |
| ellipseThickness    | Thickness of the ellipse progress.                                                                                              | number  | -                      | 2                |
| ellipseSizeFontSize | Font size of the legend in the ellipse progress.                                                                                | string  | -                      | '0.5em'          |
| errorModalSize      | Size of the error modal. Can be: 'sm', 'md', 'lg' (default), or 'xl'.                                                           | string  | `sm`, `md`, `lg`, `xl` | 'lg'             |

## Slots

| Name    | Description | Bindings |
| ------- | ----------- | -------- |
| default |             |          |
| error   |             |          |


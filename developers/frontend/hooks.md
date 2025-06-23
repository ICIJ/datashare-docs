# Plugin hooks

To allow external developers to add their own components, we added markers called "hooks" in strategic locations on the user interface where a user can define new Vue Component through plugins.

## Hooks locations

| Component                                                                                                                      | Name                               |
| ------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------- |
| [components/AppNav.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppNav.vue#L3)                     | `search.nav:before`                |
| [components/AppNav.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppNav.vue#L12)                    | `search.nav:after`                 |
| [components/AppSidebar.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L15)            | `app-sidebar.menu:before`          |
| [components/AppSidebar.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L85)            | `app-sidebar.menu:after`           |
| [components/AppSidebar.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L86)            | `app-sidebar.help:before`          |
| [components/AppSidebar.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L117)           | `app-sidebar.help:after`           |
| [components/AppSidebar.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L118)           | `app-sidebar.guides:before`        |
| [components/AppSidebar.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L180)           | `app-sidebar.guides:after`         |
| [components/AppSidebar.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L181)           | `app-sidebar.locales:before`       |
| [components/AppSidebar.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L227)           | `app-sidebar.locales:after`        |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L332) | `document.content:before`          |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L334) | `document.content.toolbox:before`  |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L365) | `document.content.toolbox:after`   |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L371) | `document.content.ner:before`      |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L372) | `document.content.togglers:before` |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L373) | `document.content.togglers:after`  |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L374) | `document.content.ner:after`       |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L377) | `document.content.body:before`     |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L387) | `document.content.body:after`      |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L390) | `document.content:after`           |
| [components/FiltersPanel.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L4)         | `filters-panel:before`             |
| [components/FiltersPanel.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L6)         | `filters-panel.toolbar:before`     |
| [components/FiltersPanel.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L23)        | `filters-panel.toolbar:after`      |
| [components/FiltersPanel.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L25)        | `filters-panel.filters:before`     |
| [components/FiltersPanel.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L34)        | `filters-panel.filters:after`      |
| [components/FiltersPanel.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L35)        | `filters-panel:after`              |
| [pages/App.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/App.vue#L3)                                     | `app:before`                       |
| [pages/App.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/App.vue#L16)                                    | `app:after`                        |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L14)                  | `document.header:before`           |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L16)                  | `document.header.name:before`      |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L21)                  | `document.header.name:after`       |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L23)                  | `document.header.tags:before`      |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L32)                  | `document.header.tags:after`       |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L33)                  | `document.header.nav:before`       |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L35)                  | `document.header.nav.items:before` |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L54)                  | `document.header.nav.items:after`  |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L56)                  | `document.header.nav:after`        |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L57)                  | `document.header:after`            |
| [pages/Landing.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L3)                             | `landing.form:before`              |
| [pages/Landing.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L5)                             | `landing.form.heading:before`      |
| [pages/Landing.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L9)                             | `landing.form.heading:after`       |
| [pages/Landing.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L12)                            | `landing.form:after`               |
| [pages/Landing.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L13)                            | `landing.form.project:before`      |
| [pages/Landing.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L17)                            | `landing.form.project:after`       |
| [pages/Search.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Search.vue#L3)                               | `search:before`                    |
| [pages/Search.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Search.vue#L21)                              | `search.body:before`               |
| [pages/Search.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Search.vue#L48)                              | `search.body:after`                |
| [pages/Search.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Search.vue#L50)                              | `search:after`                     |

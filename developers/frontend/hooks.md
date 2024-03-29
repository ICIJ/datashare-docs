# Plugin hooks

To allow external developers to add their own components, we added markers
called "hooks" in strategic locations on the user interface  where a user can
define new Vue Component through plugins.

## Hooks locations

| Component | Name |
| --- | --- |
| [components/AppNav.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppNav.vue#L3) | `search.nav:before` |
| [components/AppNav.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppNav.vue#L12) | `search.nav:after` |
| [components/AppSidebar.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L15) | `app-sidebar.menu:before` |
| [components/AppSidebar.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L84) | `app-sidebar.menu:after` |
| [components/AppSidebar.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L85) | `app-sidebar.help:before` |
| [components/AppSidebar.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L116) | `app-sidebar.help:after` |
| [components/AppSidebar.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L117) | `app-sidebar.guides:before` |
| [components/AppSidebar.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L175) | `app-sidebar.guides:after` |
| [components/AppSidebar.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L176) | `app-sidebar.locales:before` |
| [components/AppSidebar.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L222) | `app-sidebar.locales:after` |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L328) | `document.content:before` |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L330) | `document.content.toolbox:before` |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L361) | `document.content.toolbox:after` |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L367) | `document.content.ner:before` |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L376) | `document.content.ner:after` |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L379) | `document.content.body:before` |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L389) | `document.content.body:after` |
| [components/DocumentContent.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L392) | `document.content:after` |
| [components/FiltersPanel.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L4) | `filters-panel:before` |
| [components/FiltersPanel.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L6) | `filters-panel.toolbar:before` |
| [components/FiltersPanel.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L23) | `filters-panel.toolbar:after` |
| [components/FiltersPanel.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L25) | `filters-panel.filters:before` |
| [components/FiltersPanel.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L34) | `filters-panel.filters:after` |
| [components/FiltersPanel.vue](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L35) | `filters-panel:after` |
| [pages/App.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/App.vue#L3) | `app:before` |
| [pages/App.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/App.vue#L27) | `app:after` |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L12) | `document.header:before` |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L14) | `document.header.name:before` |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L19) | `document.header.name:after` |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L21) | `document.header.tags:before` |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L30) | `document.header.tags:after` |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L31) | `document.header.nav:before` |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L34) | `document.header.nav.items:before` |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L59) | `document.header.nav.items:after` |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L62) | `document.header.nav:after` |
| [pages/DocumentView.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L63) | `document.header:after` |
| [pages/Landing.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L3) | `landing.form:before` |
| [pages/Landing.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L5) | `landing.form.heading:before` |
| [pages/Landing.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L9) | `landing.form.heading:after` |
| [pages/Landing.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L12) | `landing.form:after` |
| [pages/Landing.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L14) | `landing.form.project:before` |
| [pages/Landing.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L17) | `landing.form.project:after` |
| [pages/Search.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Search.vue#L3) | `search:before` |
| [pages/Search.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Search.vue#L21) | `search.body:before` |
| [pages/Search.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Search.vue#L48) | `search.body:after` |
| [pages/Search.vue](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Search.vue#L50) | `search:after` |

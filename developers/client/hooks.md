# Plugin hooks

To allow external developers to add their own components, we added markers
called "hooks" in strategic locations on the user interface  where a user can
define new Vue Component through plugins.

## Hooks locations

| Component | Name |
| --- | --- |
| [src/components/AppNav.vue](components/AppNav.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppNav.vue#L3) | `search.nav:before` |
| [src/components/AppNav.vue](components/AppNav.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppNav.vue#L12) | `search.nav:after` |
| [src/components/AppSidebar.vue](components/AppSidebar.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L15) | `app-sidebar.menu:before` |
| [src/components/AppSidebar.vue](components/AppSidebar.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L84) | `app-sidebar.menu:after` |
| [src/components/AppSidebar.vue](components/AppSidebar.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L85) | `app-sidebar.help:before` |
| [src/components/AppSidebar.vue](components/AppSidebar.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L116) | `app-sidebar.help:after` |
| [src/components/AppSidebar.vue](components/AppSidebar.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L117) | `app-sidebar.guides:before` |
| [src/components/AppSidebar.vue](components/AppSidebar.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L175) | `app-sidebar.guides:after` |
| [src/components/AppSidebar.vue](components/AppSidebar.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L176) | `app-sidebar.locales:before` |
| [src/components/AppSidebar.vue](components/AppSidebar.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/AppSidebar.vue#L222) | `app-sidebar.locales:after` |
| [src/components/DocumentContent.vue](components/DocumentContent.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L338) | `document.content:before` |
| [src/components/DocumentContent.vue](components/DocumentContent.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L340) | `document.content.toolbox:before` |
| [src/components/DocumentContent.vue](components/DocumentContent.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L370) | `document.content.toolbox:after` |
| [src/components/DocumentContent.vue](components/DocumentContent.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L376) | `document.content.ner:before` |
| [src/components/DocumentContent.vue](components/DocumentContent.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L385) | `document.content.ner:after` |
| [src/components/DocumentContent.vue](components/DocumentContent.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L388) | `document.content.body:before` |
| [src/components/DocumentContent.vue](components/DocumentContent.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L398) | `document.content.body:after` |
| [src/components/DocumentContent.vue](components/DocumentContent.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/DocumentContent.vue#L401) | `document.content:after` |
| [src/components/FiltersPanel.vue](components/FiltersPanel.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L4) | `filters-panel:before` |
| [src/components/FiltersPanel.vue](components/FiltersPanel.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L6) | `filters-panel.toolbar:before` |
| [src/components/FiltersPanel.vue](components/FiltersPanel.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L23) | `filters-panel.toolbar:after` |
| [src/components/FiltersPanel.vue](components/FiltersPanel.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L25) | `filters-panel.filters:before` |
| [src/components/FiltersPanel.vue](components/FiltersPanel.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L34) | `filters-panel.filters:after` |
| [src/components/FiltersPanel.vue](components/FiltersPanel.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/components/FiltersPanel.vue#L35) | `filters-panel:after` |
| [src/pages/App.vue](pages/App.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/App.vue#L3) | `app:before` |
| [src/pages/App.vue](pages/App.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/App.vue#L27) | `app:after` |
| [src/pages/DocumentView.vue](pages/DocumentView.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L12) | `document.header:before` |
| [src/pages/DocumentView.vue](pages/DocumentView.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L14) | `document.header.name:before` |
| [src/pages/DocumentView.vue](pages/DocumentView.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L19) | `document.header.name:after` |
| [src/pages/DocumentView.vue](pages/DocumentView.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L21) | `document.header.tags:before` |
| [src/pages/DocumentView.vue](pages/DocumentView.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L30) | `document.header.tags:after` |
| [src/pages/DocumentView.vue](pages/DocumentView.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L31) | `document.header.nav:before` |
| [src/pages/DocumentView.vue](pages/DocumentView.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L34) | `document.header.nav.items:before` |
| [src/pages/DocumentView.vue](pages/DocumentView.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L56) | `document.header.nav.items:after` |
| [src/pages/DocumentView.vue](pages/DocumentView.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L59) | `document.header.nav:after` |
| [src/pages/DocumentView.vue](pages/DocumentView.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/DocumentView.vue#L60) | `document.header:after` |
| [src/pages/Landing.vue](pages/Landing.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L3) | `landing.form:before` |
| [src/pages/Landing.vue](pages/Landing.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L5) | `landing.form.heading:before` |
| [src/pages/Landing.vue](pages/Landing.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L9) | `landing.form.heading:after` |
| [src/pages/Landing.vue](pages/Landing.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L11) | `landing.form.project:before` |
| [src/pages/Landing.vue](pages/Landing.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L20) | `landing.form.project:after` |
| [src/pages/Landing.vue](pages/Landing.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Landing.vue#L22) | `landing.form:after` |
| [src/pages/Search.vue](pages/Search.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Search.vue#L3) | `search:before` |
| [src/pages/Search.vue](pages/Search.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Search.vue#L21) | `search.body:before` |
| [src/pages/Search.vue](pages/Search.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Search.vue#L48) | `search.body:after` |
| [src/pages/Search.vue](pages/Search.md) — [source](https://github.com/ICIJ/datashare-client/blob/master/src/pages/Search.vue#L50) | `search:after` |

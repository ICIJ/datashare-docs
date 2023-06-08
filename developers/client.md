# Frontend API (Vue.js)

This project uses [Vue.js](https://vuejs.org) framework. Here are all the components used in this application.

### Widgets

These widgets are used on the insights page.

* [WidgetDiskUsage](client/components/widget/WidgetDiskUsage.md)\
  — _Widget to display the disk space occupied by indexed files on the insights page._
* [WidgetDocumentsByCreationDate](client/components/widget/WidgetDocumentsByCreationDate.md)\
  — _Widget to display the number of file by creation date on the insights page._
* [WidgetDocumentsByCreationDateByPath](client/components/widget/WidgetDocumentsByCreationDateByPath.md)\
  — _Widget to display number of files by creation date by path_
* [WidgetDuplicate](client/components/widget/WidgetDuplicates.md)\
  — _A widget for the insights page indicating the proportion of duplicates in the data._
* [WidgetEmpty](client/components/widget/WidgetEmpty.md)\
  — _A placeholder widget for the insights page. This widget is not intended to be used directly._
* [WidgetEntities](client/components/widget/WidgetEntities.md)\
  — _Widget to display a summary of entities_
* [WidgetFileBarometer](client/components/widget/WidgetFileBarometer.md)\
  — _Widget to display the number of indexed files on the insights page._
* [WidgetListGroup](client/components/widget/WidgetListGroup.md)\
  — _Widget to display a list of items or links on the insights page._
* [WidgetText](client/components/widget/WidgetText.md)\
  — _Widget to display text on the insights page._
* [WidgetTreeMap](client/components/widget/WidgetTreeMap.md)\
  — _Widget to display a tree map on the insights page._

### Filters

These filters are used on the search filters panel.

* [FilterAbstract](client/components/filter/types/FilterAbstract.md)\
  — _A Filter component to list unique text values._
* [FilterDate](client/components/filter/types/FilterDate.md)\
  — _A Filter component to list unique date values by month._
* [FilterDateRange](client/components/filter/types/FilterDateRange.md)\
  — _A Filter component to pick a date range._
* [FilterNamedEntity](client/components/filter/types/FilterNamedEntity.md)\
  — _A Filter component to list named entities for a specific type._
* [FilterPath](client/components/filter/types/FilterPath.md)\
  — _A Filter component to list unique directory paths._
* [FilterProject](client/components/filter/types/FilterProject.md)\
  — _A Filter component to list projects._
* [FilterRecommendedBy](client/components/filter/types/FilterRecommendedBy.md)\
  — _A Filter component to list number of documents recommended by each user._
* [FilterStarred](client/components/filter/types/FilterStarred.md)\
  — _A Filter component to boolean values. Currently used for the "starred" filter but should be made generic in future versions._
* [FilterText](client/components/filter/types/FilterText.md)\
  — _A Filter component to list unique text values._

### Pages

All pages components.

* [App](client/pages/App.md)
* [BatchDownload](client/pages/BatchDownload.md)\
  — _This mixin provides an unified way to poll data from an arbitrary source_
* [BatchSearches](client/pages/BatchSearch.md)
* [BatchSearchResults](client/pages/BatchSearchResults.md)\
  — _This page will list all the results of a batch search._
* [DocumentModal](client/pages/DocumentModal.md)
* [DocumentStandalone](client/pages/DocumentStandalone.md)
* [DocumentView](client/pages/DocumentView.md)
* [Error](client/pages/Error.md)
* [Indexing](client/pages/Indexing.md)\
  — _This mixin provides an unified way to poll data from an arbitrary source_
* [Insights](client/pages/Insights.md)
* [Landing](client/pages/Landing.md)
* [Login](client/pages/Login.md)
* [Search](client/pages/Search.md)
* [Settings](client/pages/Settings.md)
* [Tasks](client/pages/Tasks.md)
* [UserHistory](client/pages/UserHistory.md)
* [UserHistoryDocument](client/pages/UserHistoryDocument.md)
* [UserHistorySearch](client/pages/UserHistorySearch.md)

### Others

* [Api](client/components/Api.md)\
  — _A page to manage user's API keys._
* [AppliedSearchFilters](client/components/AppliedSearchFilters.md)\
  — _A list of applied search filters._
* [AppliedSearchFiltersItem](client/components/AppliedSearchFiltersItem.md)\
  — _The filter applied to the search._
* [AppNav](client/components/AppNav.md)\
  — _The global app navigation bar._
* [AppSidebar](client/components/AppSidebar.md)\
  — _The global app sidebar._
* [BatchDownloadActions](client/components/BatchDownloadActions.md)
* [BatchSearchActions](client/components/BatchSearchActions.md)\
  — _A set of buttons to manage a batch search_
* [BatchSearchClearFilters](client/components/BatchSearchClearFilters.md)
* [BatchSearchAction](client/components/BatchSearchCopyForm.md)\
  — _A form to copy batch search_
* [BatchSearchFilterDate](client/components/BatchSearchFilterDate.md)
* [BatchSearchFilterQuery](client/components/BatchSearchFilterQuery.md)
* [BatchSearchForm](client/components/BatchSearchForm.md)\
  — _A form to create a new batch search._
* [BatchSearchResultsFilters](client/components/BatchSearchResultsFilters.md)\
  — _Form to filter a batch search results by query_
* [BatchSearchStatus](client/components/BatchSearchStatus.md)\
  — _A badge to display batch search status._
* [BatchSearchTable](client/components/BatchSearchTable.md)\
  — _This mixin provides an unified way to poll data from an arbitrary source_
* [ColumnFilter](client/components/ColumnFilter.md)
* [ColumnFilterBadge](client/components/ColumnFilterBadge.md)
* [ColumnFilterDropdown](client/components/ColumnFilterDropdown.md)
* [ContentTypeBadge](client/components/ContentTypeBadge.md)\
  — _A small badge to display content type nicely._
* [DocumentActions](client/components/DocumentActions.md)\
  — _A list actions to apply to a document_
* [DocumentAttachments](client/components/DocumentAttachments.md)\
  — _A list of attachments for a document (usually, it's child documents)_
* [DocumentContent](client/components/DocumentContent.md)\
  — _Display a document's extract text after applying a series of transformation with a pipeline._
* [DocumentContentSlice](client/components/DocumentContentSlice.md)
* [DocumentContentSlicePlaceholder](client/components/DocumentContentSlicePlaceholder.md)
* [DocumentContentSlices](client/components/DocumentContentSlices.md)
* [DocumentGlobalSearchTermsTags](client/components/DocumentGlobalSearchTermsTags.md)\
  — _A list of search terms tags._
* [DocumentLocalSearchInput](client/components/DocumentLocalSearchInput.md)\
  — _A form to search for terms inside the current document._
* [DocumentSlicedName](client/components/DocumentSlicedName.md)\
  — _Display a document name in a sliced manner (to include parents)._
* [DocumentTagsForm](client/components/DocumentTagsForm.md)\
  — _A small form to add tags to one or several documents._
* [DocumentThread](client/components/DocumentThread.md)\
  — _Display a document's thread (for emails)_
* [DocumentThumbnail](client/components/DocumentThumbnail.md)\
  — _The document's thumbnail (using the preview) server_
* [DocumentTranslatedContent](client/components/DocumentTranslatedContent.md)\
  — _Displayed document text content and it's translated alternatives._
* [DocumentTypeCard](client/components/DocumentTypeCard.md)\
  — _A small card to display information about the content-type of a document._
* [EllipseStatus](client/components/EllipseStatus.md)\
  — _Draw a badge depending on the status with an ellipse progress diagram._
* [EmailString](client/components/EmailString.md)\
  — _Rich email display with shortcuts to the global search._
* [Extensions](client/components/Extensions.md)\
  — _A list of available extensions._
* [ExtractingForm](client/components/ExtractingForm.md)\
  — _A form to start indexing documents in the data directory._
* [ExtractingFormOcrControl](client/components/ExtractingFormOcrControl.md)\
  — _A form-control to select the extracting language._
* [ExtractingLanguageFormControl](client/components/ExtractingLanguageFormControl.md)\
  — _A form-control to select the extracting language._
* [FiltersPanel](client/components/FiltersPanel.md)\
  — _A panel displaying all registered filters._
* [FindNamedEntitiesForm](client/components/FindNamedEntitiesForm.md)\
  — _A form to start indexing named entities in indexed documents._
* [Hook](client/components/Hook.md)\
  — _Create a Hook slot. Hooks are registered on-the-fly by plugins to insert arbitrary components._
* [InlineDirectoryPicker](client/components/InlineDirectoryPicker.md)
* [JsonFormatter](client/components/JsonFormatter.md)\
  — _Display an interactive preview of a JSON object_
* [LocalesMenu](client/components/LocalesMenu.md)\
  — _A button toggling a menu to select active locale._
* [MountedDataLocation](client/components/MountedDataLocation.md)\
  — _Disk path to the data directory mounted by Datashare._
* [NamedEntityInContext](client/components/NamedEntityInContext.md)\
  — _Display a named entity in context._
* [PageHeader](client/components/PageHeader.md)\
  — _The header to display on top of every page_
* [PageIcon](client/components/PageIcon.md)\
  — _A squared icon to display on every page title_
* [Pagination](client/components/Pagination.md)\
  — _Pagination links (previous, next, first and last) for the global search._
* [Plugins](client/components/Plugins.md)\
  — _A list of available plugins._
* [ProjectCards](client/components/ProjectCards.md)\
  — _List all the projects with cards linking to the search._
* [ProjectSelector](client/components/ProjectSelector.md)\
  — _A single-project selector input._
* [QuickItemNav](client/components/QuickItemNav.md)\
  — _A simple component to display a next/previous pair of buttons to navigate_
* [ResetFiltersButton](client/components/ResetFiltersButton.md)\
  — _Button to reset all search filters._
* [RouterLinkPopup](client/components/RouterLinkPopup.md)\
  — _A router-link that opens link in a popup._
* [ScrollTracker](client/components/ScrollTracker.md)\
  — _An contextual link to the "right" scroll position._
* [SearchBar](client/components/SearchBar.md)\
  — _The general search form._
* [SearchBarInput](client/components/SearchBarInput.md)\
  — _The general search input group with field options._
* [SearchBarInputDropdown](client/components/SearchBarInputDropdown.md)\
  — _The general search input dropdown._
* [SearchDocumentNavbar](client/components/SearchDocumentNavbar.md)\
  — _Document navbar in the context of a search._
* [SearchFormControl](client/components/SearchFormControl.md)\
  — _A search input with pill layout._
* [SearchLayoutSelector](client/components/SearchLayoutSelector.md)\
  — _Change the search results layout (grid, list or table)._
* [SearchResults](client/components/SearchResults.md)\
  — _Display the search results (from the store) in the selected layout._
* [SearchResultsGrid](client/components/SearchResultsGrid.md)\
  — _Display search results as grid._
* [SearchResultsHeader](client/components/SearchResultsHeader.md)\
  — _Search results header displaying sorting and page length options._
* [SearchResultsList](client/components/SearchResultsList.md)\
  — _Display search results as list._
* [SearchResultsLink](client/components/SearchResultsListLink.md)\
  — _A result link for the search results list._
* [SearchResultsTable](client/components/SearchResultsTable.md)\
  — _Display search results as table._
* [ServerSettings](client/components/ServerSettings.md)\
  — _A list of settings for the backend (only available in local mode)._
* [ShortkeysModal](client/components/ShortkeysModal.md)\
  — _A button to display global shortcuts in a modal._
* [TaskItemStatus](client/components/TaskItemStatus.md)\
  — _A badge to display batch search status._
* [TasksList](client/components/TasksList.md)
* [TreeBreadcrumb](client/components/TreeBreadcrumb.md)\
  — _A clickable path breadcrumb._
* [TreeView](client/components/TreeView.md)\
  — _A view listing directories from a specific path._
* [UserDisplay](client/components/UserDisplay.md)\
  — _A component to display usernames._
* [UserHistorySaveSearchForm](client/components/UserHistorySaveSearchForm.md)\
  — _A form to save the search in user history_
* [VersionNumber](client/components/VersionNumber.md)\
  — _Display Datashare's version number._

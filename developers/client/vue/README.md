# Vue components

This project uses [Vue.js](https://vuejs.org) framework. Here are all the components used in this application.

## Widgets

These widgets are used on the insights page.

* WidgetDiskUsage - [tmp](components/widget/WidgetDiskUsage.md)\
  — _Widget to display the disk space occupied by indexed files on the insights page._
* [WidgetDocumentsByCreationDate](components/widget/WidgetDocumentsByCreationDate.md)\
  — _Widget to display the number of file by creation date on the insights page._
* [WidgetDocumentsByCreationDateByPath](components/widget/WidgetDocumentsByCreationDateByPath.md)\
  — _Widget to display number of files by creation date by path_
* [WidgetDuplicate](components/widget/WidgetDuplicates.md)\
  — _A widget for the insights page indicating the proportion of duplicates in the data._
* [WidgetEmpty](components/widget/WidgetEmpty.md)\
  — _A placeholder widget for the insights page. This widget is not intended to be used directly._
* [WidgetEntities](components/widget/WidgetEntities.md)\
  — _Widget to display a summary of entities_
* [WidgetFileBarometer](components/widget/WidgetFileBarometer.md)\
  — _Widget to display the number of indexed files on the insights page._
* [WidgetListGroup](components/widget/WidgetListGroup.md)\
  — _Widget to display a list of items or links on the insights page._
* [WidgetText](components/widget/WidgetText.md)\
  — _Widget to display text on the insights page._
* [WidgetTreeMap](components/widget/WidgetTreeMap.md)\
  — _Widget to display a tree map on the insights page._

## Filters

These filters are used on the search filters panel.

* [FilterAbstract](components/filter/types/FilterAbstract.md)\
  — _A Filter component to list unique text values._
* [FilterDate](components/filter/types/FilterDate.md)\
  — _A Filter component to list unique date values by month._
* [FilterDateRange](components/filter/types/FilterDateRange.md)\
  — _A Filter component to pick a date range._
* [FilterNamedEntity](components/filter/types/FilterNamedEntity.md)\
  — _A Filter component to list named entities for a specific type._
* [FilterPath](components/filter/types/FilterPath.md)\
  — _A Filter component to list unique directory paths._
* [FilterProject](components/filter/types/FilterProject.md)\
  — _A Filter component to list projects._
* [FilterRecommendedBy](components/filter/types/FilterRecommendedBy.md)\
  — _A Filter component to list number of documents recommended by each user._
* [FilterStarred](components/filter/types/FilterStarred.md)\
  — _A Filter component to boolean values. Currently used for the "starred" filter but should be made generic in future versions._
* [FilterText](components/filter/types/FilterText.md)\
  — _A Filter component to list unique text values._

## Pages

All pages components.

* [App](pages/App.md)
* [BatchDownload](pages/BatchDownload.md)\
  — _This mixin provides an unified way to poll data from an arbitrary source_
* [BatchSearches](pages/BatchSearch.md)
* [BatchSearchResults](pages/BatchSearchResults.md)\
  — _This page will list all the results of a batch search._
* [DocumentModal](pages/DocumentModal.md)
* [DocumentStandalone](pages/DocumentStandalone.md)
* [DocumentView](pages/DocumentView.md)
* [Error](pages/Error.md)
* [Indexing](pages/Indexing.md)\
  — _This mixin provides an unified way to poll data from an arbitrary source_
* [Insights](pages/Insights.md)
* [Landing](pages/Landing.md)
* [Login](pages/Login.md)
* [Search](pages/Search.md)
* [Settings](pages/Settings.md)
* [Tasks](pages/Tasks.md)
* [UserHistory](pages/UserHistory.md)
* [UserHistoryDocument](pages/UserHistoryDocument.md)
* [UserHistorySearch](pages/UserHistorySearch.md)

## Others

* [Api](components/Api.md)\
  — _A page to manage user's API keys._
* [AppliedSearchFilters](components/AppliedSearchFilters.md)\
  — _A list of applied search filters._
* [AppliedSearchFiltersItem](components/AppliedSearchFiltersItem.md)\
  — _The filter applied to the search._
* [AppNav](components/AppNav.md)\
  — _The global app navigation bar._
* [AppSidebar](components/AppSidebar.md)\
  — _The global app sidebar._
* [BatchDownloadActions](components/BatchDownloadActions.md)
* [BatchSearchActions](components/BatchSearchActions.md)\
  — _A set of buttons to manage a batch search_
* [BatchSearchClearFilters](components/BatchSearchClearFilters.md)
* [BatchSearchAction](components/BatchSearchCopyForm.md)\
  — _A form to copy batch search_
* [BatchSearchFilterDate](components/BatchSearchFilterDate.md)
* [BatchSearchFilterQuery](components/BatchSearchFilterQuery.md)
* [BatchSearchForm](components/BatchSearchForm.md)\
  — _A form to create a new batch search._
* [BatchSearchResultsFilters](components/BatchSearchResultsFilters.md)\
  — _Form to filter a batch search results by query_
* [BatchSearchStatus](components/BatchSearchStatus.md)\
  — _A badge to display batch search status._
* [BatchSearchTable](components/BatchSearchTable.md)\
  — _This mixin provides an unified way to poll data from an arbitrary source_
* [ColumnFilter](components/ColumnFilter.md)
* [ColumnFilterBadge](components/ColumnFilterBadge.md)
* [ColumnFilterDropdown](components/ColumnFilterDropdown.md)
* [ContentTypeBadge](components/ContentTypeBadge.md)\
  — _A small badge to display content type nicely._
* [DocumentActions](components/DocumentActions.md)\
  — _A list actions to apply to a document_
* [DocumentAttachments](components/DocumentAttachments.md)\
  — _A list of attachments for a document (usually, it's child documents)_
* [DocumentContent](components/DocumentContent.md)\
  — _Display a document's extract text after applying a series of transformation with a pipeline._
* [DocumentContentSlice](components/DocumentContentSlice.md)
* [DocumentContentSlicePlaceholder](components/DocumentContentSlicePlaceholder.md)
* [DocumentContentSlices](components/DocumentContentSlices.md)
* [DocumentGlobalSearchTermsTags](components/DocumentGlobalSearchTermsTags.md)\
  — _A list of search terms tags._
* [DocumentLocalSearchInput](components/DocumentLocalSearchInput.md)\
  — _A form to search for terms inside the current document._
* [DocumentSlicedName](components/DocumentSlicedName.md)\
  — _Display a document name in a sliced manner (to include parents)._
* [DocumentTagsForm](components/DocumentTagsForm.md)\
  — _A small form to add tags to one or several documents._
* [DocumentThread](components/DocumentThread.md)\
  — _Display a document's thread (for emails)_
* [DocumentThumbnail](components/DocumentThumbnail.md)\
  — _The document's thumbnail (using the preview) server_
* [DocumentTranslatedContent](components/DocumentTranslatedContent.md)\
  — _Displayed document text content and it's translated alternatives._
* [DocumentTypeCard](components/DocumentTypeCard.md)\
  — _A small card to display information about the content-type of a document._
* [EllipseStatus](components/EllipseStatus.md)\
  — _Draw a badge depending on the status with an ellipse progress diagram._
* [EmailString](components/EmailString.md)\
  — _Rich email display with shortcuts to the global search._
* [Extensions](components/Extensions.md)\
  — _A list of available extensions._
* [ExtractingForm](components/ExtractingForm.md)\
  — _A form to start indexing documents in the data directory._
* [ExtractingFormOcrControl](components/ExtractingFormOcrControl.md)\
  — _A form-control to select the extracting language._
* [ExtractingLanguageFormControl](components/ExtractingLanguageFormControl.md)\
  — _A form-control to select the extracting language._
* [FiltersPanel](components/FiltersPanel.md)\
  — _A panel displaying all registered filters._
* [FindNamedEntitiesForm](components/FindNamedEntitiesForm.md)\
  — _A form to start indexing named entities in indexed documents._
* [Hook](components/Hook.md)\
  — _Create a Hook slot. Hooks are registered on-the-fly by plugins to insert arbitrary components._
* [InlineDirectoryPicker](components/InlineDirectoryPicker.md)
* [JsonFormatter](components/JsonFormatter.md)\
  — _Display an interactive preview of a JSON object_
* [LocalesMenu](components/LocalesMenu.md)\
  — _A button toggling a menu to select active locale._
* [MountedDataLocation](components/MountedDataLocation.md)\
  — _Disk path to the data directory mounted by Datashare._
* [NamedEntityInContext](components/NamedEntityInContext.md)\
  — _Display a named entity in context._
* [PageHeader](components/PageHeader.md)\
  — _The header to display on top of every page_
* [PageIcon](components/PageIcon.md)\
  — _A squared icon to display on every page title_
* [Pagination](components/Pagination.md)\
  — _Pagination links (previous, next, first and last) for the global search._
* [Plugins](components/Plugins.md)\
  — _A list of available plugins._
* [ProjectCards](components/ProjectCards.md)\
  — _List all the projects with cards linking to the search._
* [ProjectSelector](components/ProjectSelector.md)\
  — _A single-project selector input._
* [QuickItemNav](components/QuickItemNav.md)\
  — _A simple component to display a next/previous pair of buttons to navigate_
* [ResetFiltersButton](components/ResetFiltersButton.md)\
  — _Button to reset all search filters._
* [RouterLinkPopup](components/RouterLinkPopup.md)\
  — _A router-link that opens link in a popup._
* [ScrollTracker](components/ScrollTracker.md)\
  — _An contextual link to the "right" scroll position._
* [SearchBar](components/SearchBar.md)\
  — _The general search form._
* [SearchBarInput](components/SearchBarInput.md)\
  — _The general search input group with field options._
* [SearchBarInputDropdown](components/SearchBarInputDropdown.md)\
  — _The general search input dropdown._
* [SearchDocumentNavbar](components/SearchDocumentNavbar.md)\
  — _Document navbar in the context of a search._
* [SearchFormControl](components/SearchFormControl.md)\
  — _A search input with pill layout._
* [SearchLayoutSelector](components/SearchLayoutSelector.md)\
  — _Change the search results layout (grid, list or table)._
* [SearchResults](components/SearchResults.md)\
  — _Display the search results (from the store) in the selected layout._
* [SearchResultsGrid](components/SearchResultsGrid.md)\
  — _Display search results as grid._
* [SearchResultsHeader](components/SearchResultsHeader.md)\
  — _Search results header displaying sorting and page length options._
* [SearchResultsList](components/SearchResultsList.md)\
  — _Display search results as list._
* [SearchResultsLink](components/SearchResultsListLink.md)\
  — _A result link for the search results list._
* [SearchResultsTable](components/SearchResultsTable.md)\
  — _Display search results as table._
* [ServerSettings](components/ServerSettings.md)\
  — _A list of settings for the backend (only available in local mode)._
* [ShortkeysModal](components/ShortkeysModal.md)\
  — _A button to display global shortcuts in a modal._
* [TaskItemStatus](components/TaskItemStatus.md)\
  — _A badge to display batch search status._
* [TasksList](components/TasksList.md)
* [TreeBreadcrumb](components/TreeBreadcrumb.md)\
  — _A clickable path breadcrumb._
* [TreeView](components/TreeView.md)\
  — _A view listing directories from a specific path._
* [UserDisplay](components/UserDisplay.md)\
  — _A component to display usernames._
* [UserHistorySaveSearchForm](components/UserHistorySaveSearchForm.md)\
  — _A form to save the search in user history_
* [VersionNumber](components/VersionNumber.md)\
  — _Display Datashare's version number._

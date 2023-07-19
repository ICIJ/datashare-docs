# Vue components

This project uses [Vue.js](https://vuejs.org) framework. Here are all the
components used in this application.

## Widgets

These widgets are used on the insights page.

* [WidgetDiskUsage](components/widget/WidgetDiskUsage.md) <br />— _Widget to display the disk space occupied by indexed files on the insights page._
* [WidgetDocumentsByCreationDate](components/widget/WidgetDocumentsByCreationDate.md) <br />— _Widget to display the number of file by creation date on the insights page._
* [WidgetDocumentsByCreationDateByPath](components/widget/WidgetDocumentsByCreationDateByPath.md) <br />— _Widget to display number of files by creation date by path_
* [WidgetDuplicate](components/widget/WidgetDuplicates.md) <br />— _A widget for the insights page indicating the proportion of duplicates in the data._
* [WidgetEmpty](components/widget/WidgetEmpty.md) <br />— _A placeholder widget for the insights page. This widget is not intended to be used directly._
* [WidgetEntities](components/widget/WidgetEntities.md) <br />— _Widget to display a summary of entities_
* [WidgetFileBarometer](components/widget/WidgetFileBarometer.md) <br />— _Widget to display the number of indexed files on the insights page._
* [WidgetListGroup](components/widget/WidgetListGroup.md) <br />— _Widget to display a list of items or links on the insights page._
* [WidgetText](components/widget/WidgetText.md) <br />— _Widget to display text on the insights page._
* [WidgetTreeMap](components/widget/WidgetTreeMap.md) <br />— _Widget to display a tree map on the insights page._

## Filters

These filters are used on the search filters panel.

* [FilterAbstract](components/filter/types/FilterAbstract.md) <br />— _A Filter component to list unique text values._
* [FilterDate](components/filter/types/FilterDate.md) <br />— _A Filter component to list unique date values by month._
* [FilterDateRange](components/filter/types/FilterDateRange.md) <br />— _A Filter component to pick a date range._
* [FilterNamedEntity](components/filter/types/FilterNamedEntity.md) <br />— _A Filter component to list named entities for a specific type._
* [FilterPath](components/filter/types/FilterPath.md) <br />— _A Filter component to list unique directory paths._
* [FilterProject](components/filter/types/FilterProject.md) <br />— _A Filter component to list projects._
* [FilterRecommendedBy](components/filter/types/FilterRecommendedBy.md) <br />— _A Filter component to list number of documents recommended by each user._
* [FilterStarred](components/filter/types/FilterStarred.md) <br />— _A Filter component to boolean values. Currently used for the &quot;starred&quot; filter but should be made generic in future versions._
* [FilterText](components/filter/types/FilterText.md) <br />— _A Filter component to list unique text values._

## Pages

All pages components.

* [App](pages/App.md) 
* [BatchDownload](pages/BatchDownload.md) <br />— _This mixin provides an unified way to poll data from an arbitrary source_
* [BatchSearches](pages/BatchSearch.md) 
* [BatchSearchResults](pages/BatchSearchResults.md) <br />— _This page will list all the results of a batch search._
* [DocumentModal](pages/DocumentModal.md) 
* [DocumentStandalone](pages/DocumentStandalone.md) 
* [DocumentView](pages/DocumentView.md) 
* [Error](pages/Error.md) <br />— _This page display error._
* [Indexing](pages/Indexing.md) <br />— _This mixin provides an unified way to poll data from an arbitrary source_
* [Insights](pages/Insights.md) 
* [Landing](pages/Landing.md) 
* [Login](pages/Login.md) 
* [NewProject](pages/NewProject.md) <br />— _This page display a form to create a new project._
* [Project](pages/Project.md) 
* [Search](pages/Search.md) 
* [Settings](pages/Settings.md) 
* [Tasks](pages/Tasks.md) 
* [UserHistory](pages/UserHistory.md) 
* [UserHistoryDocument](pages/UserHistoryDocument.md) 
* [UserHistorySearch](pages/UserHistorySearch.md) 

## Others

* [Api](components/Api.md) <br />— _A page to manage user&#x27;s API keys._
* [AppliedSearchFilters](components/AppliedSearchFilters.md) <br />— _A list of applied search filters._
* [AppliedSearchFiltersItem](components/AppliedSearchFiltersItem.md) <br />— _The filter applied to the search._
* [AppNav](components/AppNav.md) <br />— _The global app navigation bar._
* [AppSidebar](components/AppSidebar.md) <br />— _The global app sidebar._
* [BatchDownloadActions](components/BatchDownloadActions.md) 
* [BatchSearchActions](components/BatchSearchActions.md) <br />— _A set of buttons to manage a batch search_
* [BatchSearchClearFilters](components/BatchSearchClearFilters.md) 
* [BatchSearchAction](components/BatchSearchCopyForm.md) <br />— _A form to copy batch search_
* [BatchSearchFilterDate](components/BatchSearchFilterDate.md) 
* [BatchSearchFilterQuery](components/BatchSearchFilterQuery.md) 
* [BatchSearchForm](components/BatchSearchForm.md) <br />— _A form to create a new batch search._
* [BatchSearchResultsFilters](components/BatchSearchResultsFilters.md) <br />— _Form to filter a batch search results by query_
* [BatchSearchStatus](components/BatchSearchStatus.md) <br />— _A badge to display batch search status._
* [BatchSearchTable](components/BatchSearchTable.md) <br />— _This mixin provides an unified way to poll data from an arbitrary source_
* [ColumnFilter](components/ColumnFilter.md) 
* [ColumnFilterBadge](components/ColumnFilterBadge.md) 
* [ColumnFilterDropdown](components/ColumnFilterDropdown.md) 
* [ContentTypeBadge](components/ContentTypeBadge.md) <br />— _A small badge to display content type nicely._
* [DocumentActions](components/DocumentActions.md) <br />— _A list actions to apply to a document_
* [DocumentAttachments](components/DocumentAttachments.md) <br />— _A list of attachments for a document (usually, it&#x27;s child documents)_
* [DocumentContent](components/DocumentContent.md) <br />— _Display a document&#x27;s extract text after applying a series of transformation with a pipeline._
* [DocumentContentSlice](components/DocumentContentSlice.md) 
* [DocumentContentSlicePlaceholder](components/DocumentContentSlicePlaceholder.md) 
* [DocumentContentSlices](components/DocumentContentSlices.md) 
* [DocumentGlobalSearchTermsTags](components/DocumentGlobalSearchTermsTags.md) <br />— _A list of search terms tags._
* [DocumentLocalSearchInput](components/DocumentLocalSearchInput.md) <br />— _A form to search for terms inside the current document._
* [DocumentSlicedName](components/DocumentSlicedName.md) <br />— _Display a document name in a sliced manner (to include parents)._
* [DocumentTagsForm](components/DocumentTagsForm.md) <br />— _A small form to add tags to one or several documents._
* [DocumentThread](components/DocumentThread.md) <br />— _Display a document&#x27;s thread (for emails)_
* [DocumentThumbnail](components/DocumentThumbnail.md) <br />— _The document&#x27;s thumbnail (using the preview) server_
* [DocumentTranslatedContent](components/DocumentTranslatedContent.md) <br />— _Displayed document text content and it&#x27;s translated alternatives._
* [DocumentTypeCard](components/DocumentTypeCard.md) <br />— _A small card to display information about the content-type of a document._
* [EllipseStatus](components/EllipseStatus.md) <br />— _Draw a badge depending on the status with an ellipse progress diagram._
* [EmailString](components/EmailString.md) <br />— _Rich email display with shortcuts to the global search._
* [Extensions](components/Extensions.md) <br />— _A list of available extensions._
* [ExtractingForm](components/ExtractingForm.md) <br />— _A form to start indexing documents in the data directory._
* [ExtractingFormOcrControl](components/ExtractingFormOcrControl.md) <br />— _A form-control to select the extracting language._
* [ExtractingLanguageFormControl](components/ExtractingLanguageFormControl.md) <br />— _A form-control to select the extracting language._
* [FiltersPanel](components/FiltersPanel.md) <br />— _A panel displaying all registered filters._
* [FindNamedEntitiesForm](components/FindNamedEntitiesForm.md) <br />— _A form to start indexing named entities in indexed documents._
* [Hook](components/Hook.md) <br />— _Create a Hook slot. Hooks are registered on-the-fly by plugins to insert arbitrary components._
* [InlineDirectoryPicker](components/InlineDirectoryPicker.md) 
* [JsonFormatter](components/JsonFormatter.md) <br />— _Display an interactive preview of a JSON object_
* [LocalesMenu](components/LocalesMenu.md) <br />— _A button toggling a menu to select active locale._
* [MountedDataLocation](components/MountedDataLocation.md) <br />— _Disk path to the data directory mounted by Datashare._
* [NamedEntityInContext](components/NamedEntityInContext.md) <br />— _Display a named entity in context._
* [PageHeader](components/PageHeader.md) <br />— _The header to display on top of every page_
* [PageIcon](components/PageIcon.md) <br />— _A squared icon to display on every page title_
* [Pagination](components/Pagination.md) <br />— _Pagination links (previous, next, first and last) for the global search._
* [Plugins](components/Plugins.md) <br />— _A list of available plugins._
* [ProjectCards](components/ProjectCards.md) <br />— _List all the projects with cards linking to the search._
* [ProjectForm](components/ProjectForm.md) <br />— _Build project form (to create or edit a project)._
* [ProjectSelector](components/ProjectSelector.md) <br />— _A single-project selector input._
* [QuickItemNav](components/QuickItemNav.md) <br />— _A simple component to display a next/previous pair of buttons to navigate_
* [ResetFiltersButton](components/ResetFiltersButton.md) <br />— _Button to reset all search filters._
* [RouterLinkPopup](components/RouterLinkPopup.md) <br />— _A router-link that opens link in a popup._
* [ScrollTracker](components/ScrollTracker.md) <br />— _An contextual link to the &quot;right&quot; scroll position._
* [SearchBar](components/SearchBar.md) <br />— _The general search form._
* [SearchBarInput](components/SearchBarInput.md) <br />— _The general search input group with field options._
* [SearchBarInputDropdown](components/SearchBarInputDropdown.md) <br />— _The general search input dropdown._
* [SearchDocumentNavbar](components/SearchDocumentNavbar.md) <br />— _Document navbar in the context of a search._
* [SearchFormControl](components/SearchFormControl.md) <br />— _A search input with pill layout._
* [SearchLayoutSelector](components/SearchLayoutSelector.md) <br />— _Change the search results layout (grid, list or table)._
* [SearchResults](components/SearchResults.md) <br />— _Display the search results (from the store) in the selected layout._
* [SearchResultsGrid](components/SearchResultsGrid.md) <br />— _Display search results as grid._
* [SearchResultsHeader](components/SearchResultsHeader.md) <br />— _Search results header displaying sorting and page length options._
* [SearchResultsList](components/SearchResultsList.md) <br />— _Display search results as list._
* [SearchResultsLink](components/SearchResultsListLink.md) <br />— _A result link for the search results list._
* [SearchResultsTable](components/SearchResultsTable.md) <br />— _Display search results as table._
* [ServerSettings](components/ServerSettings.md) <br />— _A list of settings for the backend (only available in local mode)._
* [ShortkeysModal](components/ShortkeysModal.md) <br />— _A button to display global shortcuts in a modal._
* [TaskItemStatus](components/TaskItemStatus.md) <br />— _A badge to display batch search status._
* [TasksList](components/TasksList.md) 
* [TreeBreadcrumb](components/TreeBreadcrumb.md) <br />— _A clickable path breadcrumb._
* [TreeView](components/TreeView.md) <br />— _A view listing directories from a specific path._
* [UserDisplay](components/UserDisplay.md) <br />— _A component to display usernames._
* [UserHistorySaveSearchForm](components/UserHistorySaveSearchForm.md) <br />— _A form to save the search in user history_
* [VersionNumber](components/VersionNumber.md) <br />— _Display Datashare&#x27;s version number._

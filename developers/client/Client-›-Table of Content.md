This project uses [Vue.js](https://vuejs.org) framework. Here are all the
components used in this application.

## Widgets

These widgets are used on the insights page.

* [WidgetDiskUsage](Client-›-Components-›-Widget-›-WidgetDiskUsage) <br />— _Widget to display the disk space occupied by indexed files on the insights page._
* [WidgetDocumentsByCreationDate](Client-›-Components-›-Widget-›-WidgetDocumentsByCreationDate) <br />— _Widget to display the number of file by creation date on the insights page._
* [WidgetDocumentsByCreationDateByPath](Client-›-Components-›-Widget-›-WidgetDocumentsByCreationDateByPath) <br />— _Widget to display number of files by creation date by path_
* [WidgetDuplicate](Client-›-Components-›-Widget-›-WidgetDuplicates) <br />— _A widget for the insights page indicating the proportion of duplicates in the data._
* [WidgetEmpty](Client-›-Components-›-Widget-›-WidgetEmpty) <br />— _A placeholder widget for the insights page. This widget is not intended to be used directly._
* [WidgetEntities](Client-›-Components-›-Widget-›-WidgetEntities) <br />— _Widget to display a summary of entities_
* [WidgetFileBarometer](Client-›-Components-›-Widget-›-WidgetFileBarometer) <br />— _Widget to display the number of indexed files on the insights page._
* [WidgetListGroup](Client-›-Components-›-Widget-›-WidgetListGroup) <br />— _Widget to display a list of items or links on the insights page._
* [WidgetText](Client-›-Components-›-Widget-›-WidgetText) <br />— _Widget to display text on the insights page._
* [WidgetTreeMap](Client-›-Components-›-Widget-›-WidgetTreeMap) <br />— _Widget to display a tree map on the insights page._

## Filters

These filters are used on the search filters panel.

* [FilterAbstract](Client-›-Components-›-Filter-›-Types-›-FilterAbstract) <br />— _A Filter component to list unique text values._
* [FilterDate](Client-›-Components-›-Filter-›-Types-›-FilterDate) <br />— _A Filter component to list unique date values by month._
* [FilterDateRange](Client-›-Components-›-Filter-›-Types-›-FilterDateRange) <br />— _A Filter component to pick a date range._
* [FilterNamedEntity](Client-›-Components-›-Filter-›-Types-›-FilterNamedEntity) <br />— _A Filter component to list named entities for a specific type._
* [FilterPath](Client-›-Components-›-Filter-›-Types-›-FilterPath) <br />— _A Filter component to list unique directory paths._
* [FilterProject](Client-›-Components-›-Filter-›-Types-›-FilterProject) <br />— _A Filter component to list projects._
* [FilterRecommendedBy](Client-›-Components-›-Filter-›-Types-›-FilterRecommendedBy) <br />— _A Filter component to list number of documents recommended by each user._
* [FilterStarred](Client-›-Components-›-Filter-›-Types-›-FilterStarred) <br />— _A Filter component to boolean values. Currently used for the &quot;starred&quot; filter but should be made generic in future versions._
* [FilterText](Client-›-Components-›-Filter-›-Types-›-FilterText) <br />— _A Filter component to list unique text values._

## Pages

All pages components.

* [App](Client-›-Pages-›-App) 
* [BatchDownload](Client-›-Pages-›-BatchDownload) <br />— _This mixin provides an unified way to poll data from an arbitrary source_
* [BatchSearches](Client-›-Pages-›-BatchSearch) 
* [BatchSearchResults](Client-›-Pages-›-BatchSearchResults) <br />— _This page will list all the results of a batch search._
* [DocumentModal](Client-›-Pages-›-DocumentModal) 
* [DocumentStandalone](Client-›-Pages-›-DocumentStandalone) 
* [DocumentView](Client-›-Pages-›-DocumentView) 
* [Error](Client-›-Pages-›-Error) 
* [Indexing](Client-›-Pages-›-Indexing) <br />— _This mixin provides an unified way to poll data from an arbitrary source_
* [Insights](Client-›-Pages-›-Insights) 
* [Landing](Client-›-Pages-›-Landing) 
* [Login](Client-›-Pages-›-Login) 
* [Search](Client-›-Pages-›-Search) 
* [Settings](Client-›-Pages-›-Settings) 
* [Tasks](Client-›-Pages-›-Tasks) 
* [UserHistory](Client-›-Pages-›-UserHistory) 
* [UserHistoryDocument](Client-›-Pages-›-UserHistoryDocument) 
* [UserHistorySearch](Client-›-Pages-›-UserHistorySearch) 

## Others

* [Api](Client-›-Components-›-Api) <br />— _A page to manage user&#x27;s API keys._
* [AppliedSearchFilters](Client-›-Components-›-AppliedSearchFilters) <br />— _A list of applied search filters._
* [AppliedSearchFiltersItem](Client-›-Components-›-AppliedSearchFiltersItem) <br />— _The filter applied to the search._
* [AppNav](Client-›-Components-›-AppNav) <br />— _The global app navigation bar._
* [AppSidebar](Client-›-Components-›-AppSidebar) <br />— _The global app sidebar._
* [BatchDownloadActions](Client-›-Components-›-BatchDownloadActions) 
* [BatchSearchActions](Client-›-Components-›-BatchSearchActions) <br />— _A set of buttons to manage a batch search_
* [BatchSearchClearFilters](Client-›-Components-›-BatchSearchClearFilters) 
* [BatchSearchAction](Client-›-Components-›-BatchSearchCopyForm) <br />— _A form to copy batch search_
* [BatchSearchFilterDate](Client-›-Components-›-BatchSearchFilterDate) 
* [BatchSearchFilterQuery](Client-›-Components-›-BatchSearchFilterQuery) 
* [BatchSearchForm](Client-›-Components-›-BatchSearchForm) <br />— _A form to create a new batch search._
* [BatchSearchResultsFilters](Client-›-Components-›-BatchSearchResultsFilters) <br />— _Form to filter a batch search results by query_
* [BatchSearchStatus](Client-›-Components-›-BatchSearchStatus) <br />— _A badge to display batch search status._
* [BatchSearchTable](Client-›-Components-›-BatchSearchTable) <br />— _This mixin provides an unified way to poll data from an arbitrary source_
* [ColumnFilter](Client-›-Components-›-ColumnFilter) 
* [ColumnFilterBadge](Client-›-Components-›-ColumnFilterBadge) 
* [ColumnFilterDropdown](Client-›-Components-›-ColumnFilterDropdown) 
* [ContentTypeBadge](Client-›-Components-›-ContentTypeBadge) <br />— _A small badge to display content type nicely._
* [DocumentNavbar](Client-›-Components-›-Document-›-DocumentNavbar) <br />— _Document navbar in the context of a search._
* [DocumentNotes](Client-›-Components-›-Document-›-DocumentNotes) <br />— _A list of notes related to a document&#x27;s path and provided by the backend_
* [DocumentTabDetails](Client-›-Components-›-Document-›-DocumentTabDetails) <br />— _A panel displaying details and metadata about an indexed document._
* [DocumentTabExtractedText](Client-›-Components-›-Document-›-DocumentTabExtractedText) <br />— _A panel displaying the extracted text of a document._
* [DocumentTabNamedEntities](Client-›-Components-›-Document-›-DocumentTabNamedEntities) <br />— _A panel to navigate through the named entities of a document_
* [DocumentTabPreview](Client-›-Components-›-Document-›-DocumentTabPreview) <br />— _A panel displaying a preview for a document._
* [AudioViewer](Client-›-Components-›-Document-›-Viewers-›-AudioViewer) <br />— _Display a preview video of the document._
* [ImageViewer](Client-›-Components-›-Document-›-Viewers-›-ImageViewer) <br />— _Display a preview image of the document._
* [JsonViewer](Client-›-Components-›-Document-›-Viewers-›-JsonViewer) <br />— _Display an interactive preview of JSON for a document._
* [LegacySpreadsheetViewer](Client-›-Components-›-Document-›-Viewers-›-LegacySpreadsheetViewer) <br />— _Display a legacy preview of spreadsheet for a document, using the XLXS library._
* [PaginatedViewer](Client-›-Components-›-Document-›-Viewers-›-PaginatedViewer) <br />— _Display a paginated preview of a document using the preview server._
* [SpreadsheetViewer](Client-›-Components-›-Document-›-Viewers-›-SpreadsheetViewer) <br />— _Display a spreadsheet preview of a document_
* [TiffViewer](Client-›-Components-›-Document-›-Viewers-›-TiffViewer) <br />— _Display a Tiff preview of a document_
* [VideoViewer](Client-›-Components-›-Document-›-Viewers-›-VideoViewer) <br />— _Display a preview video of the document._
* [DocumentActions](Client-›-Components-›-DocumentActions) <br />— _A list actions to apply to a document_
* [DocumentAttachments](Client-›-Components-›-DocumentAttachments) <br />— _A list of attachments for a document (usually, it&#x27;s child documents)_
* [DocumentContent](Client-›-Components-›-DocumentContent) <br />— _Display a document&#x27;s extract text after applying a series of transformation with a pipeline._
* [DocumentContentSlice](Client-›-Components-›-DocumentContentSlice) 
* [DocumentContentSlicePlaceholder](Client-›-Components-›-DocumentContentSlicePlaceholder) 
* [DocumentContentSlices](Client-›-Components-›-DocumentContentSlices) 
* [DocumentGlobalSearchTermsTags](Client-›-Components-›-DocumentGlobalSearchTermsTags) <br />— _A list of search terms tags._
* [DocumentLocalSearchInput](Client-›-Components-›-DocumentLocalSearchInput) <br />— _A form to search for terms inside the current document._
* [DocumentSlicedName](Client-›-Components-›-DocumentSlicedName) <br />— _Display a document name in a sliced manner (to include parents)._
* [DocumentTagsForm](Client-›-Components-›-DocumentTagsForm) <br />— _A small form to add tags to one or several documents._
* [DocumentThread](Client-›-Components-›-DocumentThread) <br />— _Display a document&#x27;s thread (for emails)_
* [DocumentThumbnail](Client-›-Components-›-DocumentThumbnail) <br />— _The document&#x27;s thumbnail (using the preview) server_
* [DocumentTranslatedContent](Client-›-Components-›-DocumentTranslatedContent) <br />— _Displayed document text content and it&#x27;s translated alternatives._
* [DocumentTypeCard](Client-›-Components-›-DocumentTypeCard) <br />— _A small card to display information about the content-type of a document._
* [EllipseStatus](Client-›-Components-›-EllipseStatus) <br />— _Draw a badge depending on the status with an ellipse progress diagram._
* [EmailString](Client-›-Components-›-EmailString) <br />— _Rich email display with shortcuts to the global search._
* [Extensions](Client-›-Components-›-Extensions) <br />— _A list of available extensions._
* [ExtractingForm](Client-›-Components-›-ExtractingForm) <br />— _A form to start indexing documents in the data directory._
* [ExtractingFormOcrControl](Client-›-Components-›-ExtractingFormOcrControl) <br />— _A form-control to select the extracting language._
* [ExtractingLanguageFormControl](Client-›-Components-›-ExtractingLanguageFormControl) <br />— _A form-control to select the extracting language._
* [FiltersPanel](Client-›-Components-›-FiltersPanel) <br />— _A panel displaying all registered filters._
* [FindNamedEntitiesForm](Client-›-Components-›-FindNamedEntitiesForm) <br />— _A form to start indexing named entities in indexed documents._
* [Hook](Client-›-Components-›-Hook) <br />— _Create a Hook slot. Hooks are registered on-the-fly by plugins to insert arbitrary components._
* [InlineDirectoryPicker](Client-›-Components-›-InlineDirectoryPicker) 
* [JsonFormatter](Client-›-Components-›-JsonFormatter) <br />— _Display an interactive preview of a JSON object_
* [LocalesMenu](Client-›-Components-›-LocalesMenu) <br />— _A button toggling a menu to select active locale._
* [MountedDataLocation](Client-›-Components-›-MountedDataLocation) <br />— _Disk path to the data directory mounted by Datashare._
* [NamedEntityInContext](Client-›-Components-›-NamedEntityInContext) <br />— _Display a named entity in context._
* [PageHeader](Client-›-Components-›-PageHeader) <br />— _The header to display on top of every page_
* [PageIcon](Client-›-Components-›-PageIcon) <br />— _A squared icon to display on every page title_
* [Pagination](Client-›-Components-›-Pagination) <br />— _Pagination links (previous, next, first and last) for the global search._
* [Plugins](Client-›-Components-›-Plugins) <br />— _A list of available plugins._
* [ProjectCards](Client-›-Components-›-ProjectCards) <br />— _List all the projects with cards linking to the search._
* [ProjectSelector](Client-›-Components-›-ProjectSelector) <br />— _A single-project selector input._
* [QuickItemNav](Client-›-Components-›-QuickItemNav) <br />— _A simple component to display a next/previous pair of buttons to navigate_
* [ResetFiltersButton](Client-›-Components-›-ResetFiltersButton) <br />— _Button to reset all search filters._
* [RouterLinkPopup](Client-›-Components-›-RouterLinkPopup) <br />— _A router-link that opens link in a popup._
* [ScrollTracker](Client-›-Components-›-ScrollTracker) <br />— _An contextual link to the &quot;right&quot; scroll position._
* [SearchBar](Client-›-Components-›-SearchBar) <br />— _The general search form._
* [SearchBarInput](Client-›-Components-›-SearchBarInput) <br />— _The general search input group with field options._
* [SearchBarInputDropdown](Client-›-Components-›-SearchBarInputDropdown) <br />— _The general search input dropdown._
* [SearchDocumentNavbar](Client-›-Components-›-SearchDocumentNavbar) <br />— _Document navbar in the context of a search._
* [SearchFormControl](Client-›-Components-›-SearchFormControl) <br />— _A search input with pill layout._
* [SearchLayoutSelector](Client-›-Components-›-SearchLayoutSelector) <br />— _Change the search results layout (grid, list or table)._
* [SearchResults](Client-›-Components-›-SearchResults) <br />— _Display the search results (from the store) in the selected layout._
* [SearchResultsGrid](Client-›-Components-›-SearchResultsGrid) <br />— _Display search results as grid._
* [SearchResultsHeader](Client-›-Components-›-SearchResultsHeader) <br />— _Search results header displaying sorting and page length options._
* [SearchResultsList](Client-›-Components-›-SearchResultsList) <br />— _Display search results as list._
* [SearchResultsLink](Client-›-Components-›-SearchResultsListLink) <br />— _A result link for the search results list._
* [SearchResultsTable](Client-›-Components-›-SearchResultsTable) <br />— _Display search results as table._
* [ServerSettings](Client-›-Components-›-ServerSettings) <br />— _A list of settings for the backend (only available in local mode)._
* [ShortkeysModal](Client-›-Components-›-ShortkeysModal) <br />— _A button to display global shortcuts in a modal._
* [TasksList](Client-›-Components-›-TasksList) 
* [TreeBreadcrumb](Client-›-Components-›-TreeBreadcrumb) <br />— _A clickable path breadcrumb._
* [TreeView](Client-›-Components-›-TreeView) <br />— _A view listing directories from a specific path._
* [UserDisplay](Client-›-Components-›-UserDisplay) <br />— _A component to display usernames._
* [UserHistorySaveSearchForm](Client-›-Components-›-UserHistorySaveSearchForm) <br />— _A form to save the search in user history_
* [VersionNumber](Client-›-Components-›-VersionNumber) <br />— _Display Datashare&#x27;s version number._

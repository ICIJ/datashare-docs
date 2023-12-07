# Vue app

This project uses [Vue.js](https://vuejs.org) framework. Here are all the components used in this application.

## Widgets

These widgets are used on the insights page.

* [WidgetDiskUsage](components/widget/widgetdiskusage.md)\
  — _Widget to display the disk space occupied by indexed files on the insights page._
* [WidgetDocumentsByCreationDate](components/widget/widgetdocumentsbycreationdate.md)\
  — _Widget to display the number of file by creation date on the insights page._
* [WidgetDocumentsByCreationDateByPath](components/widget/widgetdocumentsbycreationdatebypath.md)\
  — _Widget to display number of files by creation date by path_
* [WidgetDuplicate](components/widget/widgetduplicates.md)\
  — _A widget for the insights page indicating the proportion of duplicates in the data._
* [WidgetEmpty](components/widget/widgetempty.md)\
  — _A placeholder widget for the insights page. This widget is not intended to be used directly._
* [WidgetEntities](components/widget/widgetentities.md)\
  — _Widget to display a summary of entities_
* [WidgetListGroup](components/widget/widgetfieldfacets.md)\
  — _Widget to display a list of facets on the insights page._
* [WidgetFileBarometer](components/widget/widgetfilebarometer.md)\
  — _Widget to display the number of indexed files on the insights page._
* [WidgetListGroup](components/widget/widgetlistgroup.md)\
  — _Widget to display a list of items or links on the insights page._
* [WidgetNames](components/widget/widgetnames.md)\
  — _Widget to display a summary of names_
* [WidgetEmpty](components/widget/widgetnested.md)\
  — _A widget to include nested widget_
* [WidgetEmpty](components/widget/widgetproject.md)\
  — _A placeholder widget for the insights page. This widget is not intended to be used directly._
* [WidgetRecommendedBy](components/widget/widgetrecommendedby.md)\
  — _Widget to display a list of facets on the insights page._
* [WidgetSearchBar](components/widget/widgetsearchbar.md)\
  — _Widget to display a search bar_
* [WidgetText](components/widget/widgettext.md)\
  — _Widget to display text on the insights page._
* [WidgetTreeMap](components/widget/widgettreemap.md)\
  — _Widget to display a tree map on the insights page._

## Filters

These filters are used on the search filters panel.

* [FilterAbstract](components/filter/types/filterabstract.md)\
  — _A Filter component to list unique text values._
* [FilterDate](components/filter/types/filterdate.md)\
  — _A Filter component to list unique date values by month._
* [FilterDateRange](components/filter/types/filterdaterange.md)\
  — _A Filter component to pick a date range._
* [FilterNamedEntity](components/filter/types/filternamedentity.md)\
  — _A Filter component to list named entities for a specific type._
* [FilterPath](components/filter/types/filterpath.md)\
  — _A Filter component to list unique directory paths._
* [FilterProject](components/filter/types/filterproject.md)\
  — _A Filter component to list projects._
* [FilterRecommendedBy](components/filter/types/filterrecommendedby.md)\
  — _A Filter component to list number of documents recommended by each user._
* [FilterStarred](components/filter/types/filterstarred.md)\
  — _A Filter component to boolean values. Currently used for the "starred" filter but should be made generic in future versions._
* [FilterText](components/filter/types/filtertext.md)\
  — _A Filter component to list unique text values._

## Pages

All pages components.

* [App](pages/app.md)
* [DocumentModal](pages/documentmodal.md)
* [DocumentStandalone](pages/documentstandalone.md)
* [DocumentView](pages/documentview.md)
* [Error](pages/error.md)\
  — _This page display error._
* [Landing](pages/landing.md)
* [Login](pages/login.md)
* [Project](pages/project.md)
* [ProjectList](pages/projectlist.md)
* [ProjectNew](pages/projectnew.md)\
  — _This page display a form to create a new project._
* [ProjectView](pages/projectview.md)\
  — _Project view with insights_
* [ProjectViewAddDocuments](pages/projectviewadddocuments.md)\
  — _This page display a form to create a new project._
* [ProjectViewEdit](pages/projectviewedit.md)\
  — _Project edit form_
* [ProjectViewFindNamedEntities](pages/projectviewfindnamedentities.md)\
  — _This page displays a form to create a new project._
* [ProjectViewInsights](pages/projectviewinsights.md)
* [Search](pages/search.md)
* [Settings](pages/settings.md)
* [TaskAnalysis](pages/taskanalysis.md)
* [TaskAnalysisList](pages/taskanalysislist.md)\
  — _This mixin provides an unified way to poll data from an arbitrary source_
* [TaskBatchDownload](pages/taskbatchdownload.md)
* [TaskBatchDownloadList](pages/taskbatchdownloadlist.md)\
  — _This mixin provides an unified way to poll data from an arbitrary source_
* [TaskBatchSearch](pages/taskbatchsearch.md)
* [TaskBatchSearchList](pages/taskbatchsearchlist.md)
* [TaskBatchSearchNew](pages/taskbatchsearchnew.md)
* [TaskBatchSearchView](pages/taskbatchsearchview.md)
* [TaskBatchSearchViewResults](pages/taskbatchsearchviewresults.md)\
  — _This page will list all the results of a batch search._
* [Tasks](pages/tasks.md)
* [UserHistory](pages/userhistory.md)
* [UserHistoryDocumentList](pages/userhistorydocumentlist.md)
* [UserHistorySavedSearchList](pages/userhistorysavedsearchlist.md)

## Others

* [Api](components/api.md)\
  — _A page to manage user's API keys._
* [AppliedSearchFilters](components/appliedsearchfilters.md)\
  — _A list of applied search filters._
* [AppliedSearchFiltersItem](components/appliedsearchfiltersitem.md)\
  — _The filter applied to the search._
* [AppNav](components/appnav.md)\
  — _The global app navigation bar._
* [AppSidebar](components/appsidebar.md)\
  — _The global app sidebar._
* [BatchDownloadActions](components/batchdownloadactions.md)
* [BatchSearchActions](components/batchsearchactions.md)\
  — _A set of buttons to manage a batch search_
* [BatchSearchClearFilters](components/batchsearchclearfilters.md)
* [BatchSearchAction](components/batchsearchcopyform.md)\
  — _A form to copy batch search_
* [BatchSearchFilterDate](components/batchsearchfilterdate.md)
* [BatchSearchFilterQuery](components/batchsearchfilterquery.md)
* [BatchSearchForm](components/batchsearchform.md)\
  — _A form to create a new batch search._
* [BatchSearchResultsDetails](components/batchsearchresultsdetails.md)\
  — _This page will list all the results of a batch search._
* [BatchSearchResultsFilters](components/batchsearchresultsfilters.md)\
  — _Form to filter a batch search results by query_
* [BatchSearchResultsTable](components/batchsearchresultstable.md)\
  — _This page will list all the results of a batch search._
* [BatchSearchStatus](components/batchsearchstatus.md)\
  — _A badge to display batch search status._
* [BatchSearchTable](components/batchsearchtable.md)\
  — _This mixin provides an unified way to poll data from an arbitrary source_
* [ColumnChartPicker](components/columnchartpicker.md)\
  — _Widget to display the number of file by creation date on the insights page._
* [ColumnFilter](components/columnfilter.md)
* [ColumnFilterBadge](components/columnfilterbadge.md)
* [ColumnFilterDropdown](components/columnfilterdropdown.md)
* [ContentTypeBadge](components/contenttypebadge.md)\
  — _A small badge to display content type nicely._
* [DocumentActions](components/documentactions.md)\
  — _A list actions to apply to a document_
* [DocumentAttachments](components/documentattachments.md)\
  — _A list of attachments for a document (usually, it's child documents)_
* [DocumentContent](components/documentcontent.md)\
  — _Display a document's extract text after applying a series of transformation with a pipeline._
* [DocumentContentSlice](components/documentcontentslice.md)
* [DocumentContentSlicePlaceholder](components/documentcontentsliceplaceholder.md)
* [DocumentContentSlices](components/documentcontentslices.md)
* [DocumentGlobalSearchTermsTags](components/documentglobalsearchtermstags.md)\
  — _A list of search terms tags._
* [DocumentInModal](components/documentinmodal.md)
* [DocumentLocalSearchInput](components/documentlocalsearchinput.md)\
  — _A form to search for terms inside the current document._
* [DocumentSlicedName](components/documentslicedname.md)\
  — _Display a document name in a sliced manner (to include parents)._
* [DocumentTagsForm](components/documenttagsform.md)\
  — _A small form to add tags to one or several documents._
* [DocumentThread](components/documentthread.md)\
  — _Display a document's thread (for emails)_
* [DocumentThumbnail](components/documentthumbnail.md)\
  — _The document's thumbnail (using the preview) server_
* [DocumentTranslatedContent](components/documenttranslatedcontent.md)\
  — _Displayed document text content and it's translated alternatives._
* [DocumentTypeCard](components/documenttypecard.md)\
  — _A small card to display information about the content-type of a document._
* [EllipseStatus](components/ellipsestatus.md)\
  — _Draw a badge depending on the status with an ellipse progress diagram._
* [EmailString](components/emailstring.md)\
  — _Rich email display with shortcuts to the global search._
* [Extensions](components/extensions.md)\
  — _A list of available extensions._
* [ExtractingForm](components/extractingform.md)\
  — _A form to start indexing documents in the data directory._
* [ExtractingFormOcrControl](components/extractingformocrcontrol.md)\
  — _A form-control to select the extracting language._
* [ExtractingLanguageFormControl](components/extractinglanguageformcontrol.md)\
  — _A form-control to select the extracting language._
* [FiltersPanel](components/filterspanel.md)\
  — _A panel displaying all registered filters._
* [FindNamedEntitiesForm](components/findnamedentitiesform.md)\
  — _A form to start indexing named entities in indexed documents._
* [Hook](components/hook.md)\
  — _Create a Hook slot. Hooks are registered on-the-fly by plugins to insert arbitrary components._
* [InlineDirectoryPicker](components/inlinedirectorypicker.md)
* [JsonFormatter](components/jsonformatter.md)\
  — _Display an interactive preview of a JSON object_
* [LocalesMenu](components/localesmenu.md)\
  — _A button toggling a menu to select active locale._
* [MountedDataLocation](components/mounteddatalocation.md)\
  — _Disk path to the data directory mounted by Datashare._
* [NamedEntityInContext](components/namedentityincontext.md)\
  — _Display a named entity in context._
* [PageHeader](components/pageheader.md)\
  — _The header to display on top of every page_
* [PageIcon](components/pageicon.md)\
  — _A squared icon to display on every page title_
* [Pagination](components/pagination.md)\
  — _Pagination links (previous, next, first and last) for the global search._
* [Plugins](components/plugins.md)\
  — _A list of available plugins._
* [ProjectCards](components/projectcards.md)\
  — _List all the projects with cards linking to the search._
* [ProjectForm](components/projectform.md)\
  — _Build project form (to create or edit a project)._
* [ProjectLink](components/projectlink.md)\
  — _Generate a link to a project page_
* [ProjectSelector](components/projectselector.md)\
  — _A single-project selector input._
* [ProjectThumbnail](components/projectthumbnail.md)\
  — _Generates a thumbnail for a given project_
* [QuickItemNav](components/quickitemnav.md)\
  — _A simple component to display a next/previous pair of buttons to navigate_
* [ResetFiltersButton](components/resetfiltersbutton.md)\
  — _Button to reset all search filters._
* [RouterLinkPopup](components/routerlinkpopup.md)\
  — _A router-link that opens link in a popup._
* [ScrollTracker](components/scrolltracker.md)\
  — _An contextual link to the "right" scroll position._
* [SearchBar](components/searchbar.md)\
  — _The general search form._
* [SearchBarInput](components/searchbarinput.md)\
  — _The general search input group with field options._
* [SearchBarInputDropdown](components/searchbarinputdropdown.md)\
  — _The general search input dropdown._
* [SearchBarInputDropdownForField](components/searchbarinputdropdownforfield.md)
* [SearchBarInputDropdownForProjects](components/searchbarinputdropdownforprojects.md)
* [SearchDocumentNavbar](components/searchdocumentnavbar.md)\
  — _Document navbar in the context of a search._
* [SearchFormControl](components/searchformcontrol.md)\
  — _A search input with pill layout._
* [SearchLayoutSelector](components/searchlayoutselector.md)\
  — _Change the search results layout (grid, list or table)._
* [SearchResults](components/searchresults.md)\
  — _Display the search results (from the store) in the selected layout._
* [SearchResultsGrid](components/searchresultsgrid.md)\
  — _Display search results as grid._
* [SearchResultsHeader](components/searchresultsheader.md)\
  — _Search results header displaying sorting and page length options._
* [SearchResultsList](components/searchresultslist.md)\
  — _Display search results as list._
* [SearchResultsLink](components/searchresultslistlink.md)\
  — _A result link for the search results list._
* [SearchResultsTable](components/searchresultstable.md)\
  — _Display search results as table._
* [ServerSettings](components/serversettings.md)\
  — _A list of settings for the backend (only available in local mode)._
* [ShortkeysModal](components/shortkeysmodal.md)\
  — _A button to display global shortcuts in a modal._
* [TaskItemStatus](components/taskitemstatus.md)\
  — _A badge to display batch search status._
* [TasksList](components/taskslist.md)
* [TreeBreadcrumb](components/treebreadcrumb.md)\
  — _A clickable path breadcrumb._
* [TreeView](components/treeview.md)\
  — _A view listing directories from a specific path._
* [UserDisplay](components/userdisplay.md)\
  — _A component to display usernames._
* [UserHistorySaveSearchForm](components/userhistorysavesearchform.md)\
  — _A form to save the search in user history_
* [VersionNumber](components/versionnumber.md)\
  — _Display Datashare's version number._

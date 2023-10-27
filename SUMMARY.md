# Table of contents

* [About Datashare](README.md)
* [Ask for help](ask-for-help.md)
* [Concepts](concepts/README.md)
  * [Running modes](concepts/running-modes.md)
  * [CLI stages](concepts/cli-stages.md)
* [About ICIJ](https://www.icij.org/about/)
* [Github](https://github.com/ICIJ/datashare)

## 💻 On your computer <a href="#local-mode" id="local-mode"></a>

* [About the local mode](local-mode/about-the-local-mode.md)
* [Install on Mac](local-mode/install-datashare-on-mac/README.md)
  * [Start Datashare](local-mode/install-datashare-on-mac/open-datashare-on-mac.md)
  * [Add documents to Datashare](local-mode/install-datashare-on-mac/add-documents-to-datashare-on-mac.md)
* [Install on Windows](local-mode/install-datashare-on-windows/README.md)
  * [Start Datashare](local-mode/install-datashare-on-windows/open-datashare-on-windows.md)
  * [Add documents to Datashare](local-mode/install-datashare-on-windows/add-documents-to-datashare-on-windows.md)
* [Install on Linux](local-mode/install-datashare-on-linux/README.md)
  * [Start Datashare](local-mode/install-datashare-on-linux/open-datashare-on-linux.md)
  * [Add documents to Datashare](local-mode/install-datashare-on-linux/add-documents-to-datashare-on-linux.md)
* [Install with Docker](local-mode/install-with-docker.md)
* [Add documents](local-mode/analyze-documents.md)
* [Add more languages](local-mode/add-more-languages.md)
* [Install plugins and extensions](local-mode/plugins-and-extensions.md)

## 🌐 On your server <a href="#server-mode" id="server-mode"></a>

* [About the server mode](server-mode/about-the-server-mode.md)
* [Install with Docker](server-mode/install-with-docker.md)
* [Add documents from the CLI](server-mode/add-documents-from-the-cli.md)
* [Add entities from the CLI](server-mode/add-entities-from-the-cli.md)
* [Authentication providers](server-mode/authentication-providers/README.md)
  * [OAuth2](server-mode/authentication-providers/oauth2.md)
  * [Basic with a database](server-mode/authentication-providers/basic-with-a-database.md)
  * [Basic with Redis](server-mode/authentication-providers/basic-with-redis.md)
  * [Dummy](server-mode/authentication-providers/dummy.md)

## ⚡ Usage

* [Search documents](usage/search-documents.md)
* [Search documents in batch](usage/batch-search-documents.md)
* [Search with operators / Regex](usage/search-with-operators.md)
* [Filter documents](usage/filter-documents.md)
* [Sort documents](usage/sort-documents-by-dates-relevance-etc..md)
* [Explore a document](usage/explore-a-document.md)
* [Star documents](usage/star-documents.md)
* [Tag documents](usage/tag-documents.md)
* [Recommend documents](usage/recommend-documents.md)
* [Keyboard shortcuts](usage/use-keyboard-shortcuts.md)
* [FAQ](usage/faq/README.md)
  * [General](usage/faq/general/README.md)
    * [Can I use Datashare with no internet connection?](usage/faq/general/can-i-use-datashare-with-no-internet-connection.md)
    * [Can I download a document from Datashare?](usage/faq/general/can-i-download-a-document.md)
    * [Can I remove document(s) from Datashare?](usage/faq/general/can-i-remove-a-document-from-datashare.md)
    * [Do you recommend OS or machines for large corpuses?](usage/faq/general/do-you-recommend-os-or-machines-for-large-corpuses.md)
    * [Can I use an external drive as data source?](usage/faq/general/can-i-use-an-external-drive-as-data-source.md)
    * [How can we use Datashare on a collaborative mode on a server?](usage/faq/general/how-can-we-use-datashare-on-a-collaborative-mode-on-a-server.md)
    * [How can I contact ICIJ for help, bug reporting or suggestions?](usage/faq/general/how-can-i-contact-icij-for-help-bug-reporting-or-suggestions.md)
    * [Why results from a simple search and a batch search can be slightly different?](usage/faq/general/why-results-from-a-simple-search-and-a-batch-search-can-be-sligthly-different.md)
    * [How can I uninstall Datashare?](usage/faq/general/how-can-i-uninstall-datashare.md)
    * [Advanced: how can I do bulk actions with Tarentula?](usage/faq/general/advanced-how-can-i-do-bulk-actions-with-tarentula.md)
    * [How can I specify the language of my documents?](usage/faq/general/how-can-i-specify-the-language-of-my-documents.md)
    * [What should I do if I get more than 10,000 results?](usage/faq/general/what-should-i-do-if-i-get-more-than-10-000-results.md)
  * [Definitions](usage/faq/definitions/README.md)
    * [What is a named entity?](usage/faq/definitions/what-is-a-named-entity.md)
    * [What are NLP pipelines?](usage/faq/definitions/what-are-nlp-pipelines.md)
    * [What is fuzziness?](usage/faq/definitions/what-is-fuzziness.md)
    * [What are proximity searches?](usage/faq/definitions/what-are-proximity-searches.md)
  * [Common errors](usage/faq/common-errors/README.md)
    * ['Your search query is wrong.' What should I do?](usage/faq/common-errors/your-search-query-is-wrong.md)
    * [Searching with double quotes doesn't work](usage/faq/common-errors/searching-with-double-quotes-doesnt-work.md)
    * [List of common errors leading to "failure" in Batch Searches](usage/faq/common-errors/list-of-common-errors-leading-to-failure-in-batch-searches.md)
    * [What if Datashare says 'No documents found'?](usage/faq/common-errors/it-says-no-documents-found.md)
    * [Nothing works, everything crashes. What can I do?](usage/faq/common-errors/nothing-works-everything-crashes.-what-can-i-do.md)
    * [What if tasks are 'running' but not completing?](usage/faq/common-errors/tasks-are-running-but-not-completing.md)
    * ['You are not allowed to use Docker, you must be in the "docker-users" group'. What should I do?](usage/faq/common-errors/you-are-not-allowed-to-use-docker-you-must-be-in-the-docker-users-group-.-what-should-i-do.md)
    * [What if a 'Preview' of my documents is 'not available'?](usage/faq/common-errors/i-dont-see-any-preview-of-my-document..md)
    * [What do I do if Datashare opens a blank screen in my browser?](usage/faq/common-errors/datashare-opens-a-blank-screen-in-my-browser..md)
    * [I see people, organizations and locations in the filters but not in the documents](usage/faq/common-errors/i-see-people-organizations-and-locations-in-the-filters-but-not-in-the-documents.md)
    * [What does 'Windows named pipe error' mean?](usage/faq/common-errors/i-read-windows-named-pipe-error-....md)
    * [Datashare doesn't open. What should I do?](usage/faq/common-errors/datashare-doesnt-open.-what-should-i-do.md)
    * [I upgraded to version 9 of Datashare and it fails.](usage/faq/common-errors/i-upgraded-to-version-9-of-datashare-and-it-fails..md)

## 🤓 Developers

* [How to contribute](developers/how-to-contribute.md)
* [Backend](developers/backend/README.md)
  * [API](developers/backend/api.md)
  * [API (deprecated)](developers/backend/api-deprecated.md)
  * [Database](developers/backend/database.md)
* [Frontend](developers/frontend/README.md)
  * [JSDoc](developers/client/api.md)
  * [Plugin hooks](developers/client/hooks.md)
  * [Insight widgets](developers/client/widgets.md)
  * [Vue app](developers/client/vue/README.md)
    * [Components](developers/client/vue/components/README.md)
      * [Api](developers/client/vue/components/Api.md)
      * [AppliedSearchFilters](developers/client/vue/components/AppliedSearchFilters.md)
      * [AppliedSearchFiltersItem](developers/client/vue/components/AppliedSearchFiltersItem.md)
      * [AppNav](developers/client/vue/components/AppNav.md)
      * [AppSidebar](developers/client/vue/components/AppSidebar.md)
      * [BatchDownloadActions](developers/client/vue/components/BatchDownloadActions.md)
      * [BatchSearchActions](developers/client/vue/components/BatchSearchActions.md)
      * [BatchSearchClearFilters](developers/client/vue/components/BatchSearchClearFilters.md)
      * [BatchSearchCopyForm](developers/client/vue/components/BatchSearchCopyForm.md)
      * [BatchSearchFilterDate](developers/client/vue/components/BatchSearchFilterDate.md)
      * [BatchSearchFilterQuery](developers/client/vue/components/BatchSearchFilterQuery.md)
      * [BatchSearchForm](developers/client/vue/components/BatchSearchForm.md)
      * [BatchSearchResultsDetails](developers/client/vue/components/BatchSearchResultsDetails.md)
      * [BatchSearchResultsFilters](developers/client/vue/components/BatchSearchResultsFilters.md)
      * [BatchSearchResultsTable](developers/client/vue/components/BatchSearchResultsTable.md)
      * [BatchSearchStatus](developers/client/vue/components/BatchSearchStatus.md)
      * [BatchSearchTable](developers/client/vue/components/BatchSearchTable.md)
      * [ColumnChartPicker](developers/client/vue/components/ColumnChartPicker.md)
      * [ColumnFilter](developers/client/vue/components/ColumnFilter.md)
      * [ColumnFilterBadge](developers/client/vue/components/ColumnFilterBadge.md)
      * [ColumnFilterDropdown](developers/client/vue/components/ColumnFilterDropdown.md)
      * [ContentTypeBadge](developers/client/vue/components/ContentTypeBadge.md)
      * [Document](developers/client/vue/components/document/README.md)
        * [DocumentNavbar](developers/client/vue/components/document/DocumentNavbar.md)
        * [DocumentNotes](developers/client/vue/components/document/DocumentNotes.md)
        * [DocumentTabDetails](developers/client/vue/components/document/DocumentTabDetails.md)
        * [DocumentTabExtractedText](developers/client/vue/components/document/DocumentTabExtractedText.md)
        * [DocumentTabNamedEntities](developers/client/vue/components/document/DocumentTabNamedEntities.md)
        * [DocumentTabPreview](developers/client/vue/components/document/DocumentTabPreview.md)
        * [Viewers](developers/client/vue/components/document/viewers/README.md)
          * [AudioViewer](developers/client/vue/components/document/viewers/AudioViewer.md)
          * [ImageViewer](developers/client/vue/components/document/viewers/ImageViewer.md)
          * [JsonViewer](developers/client/vue/components/document/viewers/JsonViewer.md)
          * [LegacySpreadsheetViewer](developers/client/vue/components/document/viewers/LegacySpreadsheetViewer.md)
          * [PaginatedViewer](developers/client/vue/components/document/viewers/PaginatedViewer.md)
          * [SpreadsheetViewer](developers/client/vue/components/document/viewers/SpreadsheetViewer.md)
          * [TiffViewer](developers/client/vue/components/document/viewers/TiffViewer.md)
          * [VideoViewer](developers/client/vue/components/document/viewers/VideoViewer.md)
      * [DocumentActions](developers/client/vue/components/DocumentActions.md)
      * [DocumentAttachments](developers/client/vue/components/DocumentAttachments.md)
      * [DocumentContent](developers/client/vue/components/DocumentContent.md)
      * [DocumentContentSlice](developers/client/vue/components/DocumentContentSlice.md)
      * [DocumentContentSlicePlaceholder](developers/client/vue/components/DocumentContentSlicePlaceholder.md)
      * [DocumentContentSlices](developers/client/vue/components/DocumentContentSlices.md)
      * [DocumentGlobalSearchTermsTags](developers/client/vue/components/DocumentGlobalSearchTermsTags.md)
      * [DocumentInModal](developers/client/vue/components/DocumentInModal.md)
      * [DocumentLocalSearchInput](developers/client/vue/components/DocumentLocalSearchInput.md)
      * [DocumentSlicedName](developers/client/vue/components/DocumentSlicedName.md)
      * [DocumentTagsForm](developers/client/vue/components/DocumentTagsForm.md)
      * [DocumentThread](developers/client/vue/components/DocumentThread.md)
      * [DocumentThumbnail](developers/client/vue/components/DocumentThumbnail.md)
      * [DocumentTranslatedContent](developers/client/vue/components/DocumentTranslatedContent.md)
      * [DocumentTypeCard](developers/client/vue/components/DocumentTypeCard.md)
      * [EllipseStatus](developers/client/vue/components/EllipseStatus.md)
      * [EmailString](developers/client/vue/components/EmailString.md)
      * [Extensions](developers/client/vue/components/Extensions.md)
      * [ExtractingForm](developers/client/vue/components/ExtractingForm.md)
      * [ExtractingFormOcrControl](developers/client/vue/components/ExtractingFormOcrControl.md)
      * [ExtractingLanguageFormControl](developers/client/vue/components/ExtractingLanguageFormControl.md)
      * [Filter](developers/client/vue/components/filter/README.md)
        * [FilterBoilerplate](developers/client/vue/components/filter/FilterBoilerplate.md)
        * [FilterFooter](developers/client/vue/components/filter/FilterFooter.md)
        * [FilterSearch](developers/client/vue/components/filter/FilterSearch.md)
        * [FilterSortByDropdown](developers/client/vue/components/filter/FilterSortByDropdown.md)
        * [Types](developers/client/vue/components/filter/types/README.md)
          * [FilterAbstract](developers/client/vue/components/filter/types/FilterAbstract.md)
          * [FilterDate](developers/client/vue/components/filter/types/FilterDate.md)
          * [FilterDateRange](developers/client/vue/components/filter/types/FilterDateRange.md)
          * [FilterNamedEntity](developers/client/vue/components/filter/types/FilterNamedEntity.md)
          * [FilterPath](developers/client/vue/components/filter/types/FilterPath.md)
          * [FilterProject](developers/client/vue/components/filter/types/FilterProject.md)
          * [FilterRecommendedBy](developers/client/vue/components/filter/types/FilterRecommendedBy.md)
          * [FilterStarred](developers/client/vue/components/filter/types/FilterStarred.md)
          * [FilterText](developers/client/vue/components/filter/types/FilterText.md)
      * [FiltersPanel](developers/client/vue/components/FiltersPanel.md)
      * [FindNamedEntitiesForm](developers/client/vue/components/FindNamedEntitiesForm.md)
      * [Hook](developers/client/vue/components/Hook.md)
      * [InlineDirectoryPicker](developers/client/vue/components/InlineDirectoryPicker.md)
      * [JsonFormatter](developers/client/vue/components/JsonFormatter.md)
      * [LocalesMenu](developers/client/vue/components/LocalesMenu.md)
      * [MountedDataLocation](developers/client/vue/components/MountedDataLocation.md)
      * [NamedEntityInContext](developers/client/vue/components/NamedEntityInContext.md)
      * [PageHeader](developers/client/vue/components/PageHeader.md)
      * [PageIcon](developers/client/vue/components/PageIcon.md)
      * [Pagination](developers/client/vue/components/Pagination.md)
      * [Plugins](developers/client/vue/components/Plugins.md)
      * [ProjectCards](developers/client/vue/components/ProjectCards.md)
      * [ProjectForm](developers/client/vue/components/ProjectForm.md)
      * [ProjectLink](developers/client/vue/components/ProjectLink.md)
      * [ProjectSelector](developers/client/vue/components/ProjectSelector.md)
      * [ProjectThumbnail](developers/client/vue/components/ProjectThumbnail.md)
      * [QuickItemNav](developers/client/vue/components/QuickItemNav.md)
      * [ResetFiltersButton](developers/client/vue/components/ResetFiltersButton.md)
      * [RouterLinkPopup](developers/client/vue/components/RouterLinkPopup.md)
      * [ScrollTracker](developers/client/vue/components/ScrollTracker.md)
      * [SearchBar](developers/client/vue/components/SearchBar.md)
      * [SearchBarInput](developers/client/vue/components/SearchBarInput.md)
      * [SearchBarInputDropdown](developers/client/vue/components/SearchBarInputDropdown.md)
      * [SearchBarInputDropdownForField](developers/client/vue/components/SearchBarInputDropdownForField.md)
      * [SearchBarInputDropdownForProjects](developers/client/vue/components/SearchBarInputDropdownForProjects.md)
      * [SearchDocumentNavbar](developers/client/vue/components/SearchDocumentNavbar.md)
      * [SearchFormControl](developers/client/vue/components/SearchFormControl.md)
      * [SearchLayoutSelector](developers/client/vue/components/SearchLayoutSelector.md)
      * [SearchResults](developers/client/vue/components/SearchResults.md)
      * [SearchResultsGrid](developers/client/vue/components/SearchResultsGrid.md)
      * [SearchResultsHeader](developers/client/vue/components/SearchResultsHeader.md)
      * [SearchResultsList](developers/client/vue/components/SearchResultsList.md)
      * [SearchResultsListLink](developers/client/vue/components/SearchResultsListLink.md)
      * [SearchResultsTable](developers/client/vue/components/SearchResultsTable.md)
      * [ServerSettings](developers/client/vue/components/ServerSettings.md)
      * [ShortkeysModal](developers/client/vue/components/ShortkeysModal.md)
      * [TaskItemStatus](developers/client/vue/components/TaskItemStatus.md)
      * [TasksList](developers/client/vue/components/TasksList.md)
      * [TreeBreadcrumb](developers/client/vue/components/TreeBreadcrumb.md)
      * [TreeView](developers/client/vue/components/TreeView.md)
      * [UserDisplay](developers/client/vue/components/UserDisplay.md)
      * [UserHistorySaveSearchForm](developers/client/vue/components/UserHistorySaveSearchForm.md)
      * [VersionNumber](developers/client/vue/components/VersionNumber.md)
      * [Widget](developers/client/vue/components/widget/README.md)
        * [WidgetDiskUsage](developers/client/vue/components/widget/WidgetDiskUsage.md)
        * [WidgetDocumentsByCreationDate](developers/client/vue/components/widget/WidgetDocumentsByCreationDate.md)
        * [WidgetDocumentsByCreationDateByPath](developers/client/vue/components/widget/WidgetDocumentsByCreationDateByPath.md)
        * [WidgetDuplicates](developers/client/vue/components/widget/WidgetDuplicates.md)
        * [WidgetEmpty](developers/client/vue/components/widget/WidgetEmpty.md)
        * [WidgetEntities](developers/client/vue/components/widget/WidgetEntities.md)
        * [WidgetFieldFacets](developers/client/vue/components/widget/WidgetFieldFacets.md)
        * [WidgetFileBarometer](developers/client/vue/components/widget/WidgetFileBarometer.md)
        * [WidgetListGroup](developers/client/vue/components/widget/WidgetListGroup.md)
        * [WidgetNames](developers/client/vue/components/widget/WidgetNames.md)
        * [WidgetNested](developers/client/vue/components/widget/WidgetNested.md)
        * [WidgetProject](developers/client/vue/components/widget/WidgetProject.md)
        * [WidgetRecommendedBy](developers/client/vue/components/widget/WidgetRecommendedBy.md)
        * [WidgetSearchBar](developers/client/vue/components/widget/WidgetSearchBar.md)
        * [WidgetText](developers/client/vue/components/widget/WidgetText.md)
        * [WidgetTreeMap](developers/client/vue/components/widget/WidgetTreeMap.md)
    * [Pages](developers/client/vue/pages/README.md)
      * [App](developers/client/vue/pages/App.md)
      * [DocumentModal](developers/client/vue/pages/DocumentModal.md)
      * [DocumentStandalone](developers/client/vue/pages/DocumentStandalone.md)
      * [DocumentView](developers/client/vue/pages/DocumentView.md)
      * [Error](developers/client/vue/pages/Error.md)
      * [Landing](developers/client/vue/pages/Landing.md)
      * [Login](developers/client/vue/pages/Login.md)
      * [Project](developers/client/vue/pages/Project.md)
      * [ProjectList](developers/client/vue/pages/ProjectList.md)
      * [ProjectNew](developers/client/vue/pages/ProjectNew.md)
      * [ProjectView](developers/client/vue/pages/ProjectView.md)
      * [ProjectViewAddDocuments](developers/client/vue/pages/ProjectViewAddDocuments.md)
      * [ProjectViewEdit](developers/client/vue/pages/ProjectViewEdit.md)
      * [ProjectViewFindNamedEntities](developers/client/vue/pages/ProjectViewFindNamedEntities.md)
      * [ProjectViewInsights](developers/client/vue/pages/ProjectViewInsights.md)
      * [Search](developers/client/vue/pages/Search.md)
      * [Settings](developers/client/vue/pages/Settings.md)
      * [TaskAnalysis](developers/client/vue/pages/TaskAnalysis.md)
      * [TaskAnalysisList](developers/client/vue/pages/TaskAnalysisList.md)
      * [TaskBatchDownload](developers/client/vue/pages/TaskBatchDownload.md)
      * [TaskBatchDownloadList](developers/client/vue/pages/TaskBatchDownloadList.md)
      * [TaskBatchSearch](developers/client/vue/pages/TaskBatchSearch.md)
      * [TaskBatchSearchList](developers/client/vue/pages/TaskBatchSearchList.md)
      * [TaskBatchSearchNew](developers/client/vue/pages/TaskBatchSearchNew.md)
      * [TaskBatchSearchView](developers/client/vue/pages/TaskBatchSearchView.md)
      * [TaskBatchSearchViewResults](developers/client/vue/pages/TaskBatchSearchViewResults.md)
      * [Tasks](developers/client/vue/pages/Tasks.md)
      * [UserHistory](developers/client/vue/pages/UserHistory.md)
      * [UserHistoryDocumentList](developers/client/vue/pages/UserHistoryDocumentList.md)
      * [UserHistorySavedSearchList](developers/client/vue/pages/UserHistorySavedSearchList.md)
* [Introduction to Tarentula](developers/introduction-to-tarentula.md)
* [Introduction to Playground](developers/introduction-to-playground.md)
* [Write extensions](developers/write-extensions.md)
* [Write plugins](developers/write-plugins.md)










































































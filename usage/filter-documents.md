---
description: >-
  Filters are on the left of the search bar. You can contextualize, exclude,
  lock and reset them. Active filters are displayed in the search breadcrumb.
---

# Filter documents

## Filters

Open '**Filters**' on the left of the search bar:

<figure><img src="../.gitbook/assets/usage/filter-documents/01-page-search-documents-filters-button-at.png" alt="Screenshot of Datashare&#x27;s page to search documents with the &#x27;Filters&#x27; button at the left of the search bar highlighted"><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/usage/filter-documents/02-page-search-documents-filters-panel-open.png" alt="Screenshot of Datashare&#x27;s page to search documents with the &#x27;Filters&#x27; panel open and highlighted on the left of the page and on the right of the menud"><figcaption></figcaption></figure>

**'Indexing dates'** arethe dates when the documents were added to Datashare.

**'Embedment levels'** regard embedded documents:

* The 'file on disk' is level zero
* If a document is attached to (or contained in) a file on disk, its embedment level is '1st'
* If a document is attached to (or contained in) a document itself contained in a file on disk, its embedment level is '2nd'
* And so on

## Filter by entities

If you asked Datashare to '**Find entities**' and the task was complete, you will see names of people, organizations, locations and e-mail adresses in the filters. These are the entities **automatically detected by Datashare:**

<figure><img src="../.gitbook/assets/usage/filter-documents/03-filters-entities.png" alt="Screenshot of the Filters&#x27; entities" width="335"><figcaption></figcaption></figure>

## Exclude filters

Tick the '**Exclude**' checkbox to select all items except those selected.

In the search breadcrumb, you see that the excluded filters are **strikethrough**:

<figure><img src="../.gitbook/assets/usage/filter-documents/04-page-search-documents-people-filter-open.png" alt="Screenshot of Datashare&#x27;s page to search documents with the &#x27;People&#x27; filter open with 2 names ticked and the Exclude button ticked and highlighted as well as the two names in the search breadcrumb that are also strikethrough"><figcaption></figcaption></figure>

## Lock filters

Locking a filter value keeps it available for future searches, until you unlock it yourself, even across projects or after clearing every other filter. It doesn't reapply itself silently though: see [Apply your locked filters](#apply-your-locked-filters) below for when you need one extra click to bring it back. A lock is:

* **Personal**: the fact that a value is locked is never shared with other members, and never travels with a shared link. Other members opening a search you share, or reopening a saved search you saved, never see the padlock icon.
* **Cross-project**: a locked value stays locked when you switch to a different project, even one where that value doesn't exist.

{% hint style="info" %}
Locking only works on filter **values**, never on the free-text search query itself.
{% endhint %}

{% hint style="warning" %}
Only the lock itself is personal, not the value it applies to. A locked filter value is still included, exactly as applied on screen, in anything you export while it's active: a shared link, a saved search, a batch search or a batch download.
{% endhint %}

<figure><img src="../.gitbook/assets/usage/filter-documents/14-screencast-lock-and-apply-locked-filters.gif" alt="Screencast of locking the &#x27;French&#x27; language filter, starting a new search that no longer includes it, then clicking &#x27;Apply locked filters&#x27; to bring it back"><figcaption></figcaption></figure>

#### Lock a value from the Filters panel

Tick a filter value, then click its **padlock icon** to lock it:

<figure><img src="../.gitbook/assets/usage/filter-documents/09-page-search-documents-lock-filter-value-hover.jpg" alt="Screenshot of Datashare&#x27;s Languages filter with &#x27;French&#x27; ticked and its open padlock icon revealed on hover, before it is locked"><figcaption></figcaption></figure>

The padlock switches to its closed/filled state once the value is locked:

<figure><img src="../.gitbook/assets/usage/filter-documents/10-page-search-documents-locked-filter-value.jpg" alt="Screenshot of Datashare&#x27;s Languages filter with &#x27;French&#x27; ticked and locked, its closed padlock icon shown, and the corresponding chip in the search breadcrumb also showing a padlock icon"><figcaption></figcaption></figure>

Unticking a locked value removes it **and** unlocks it at the same time. There is no way to keep a lock without keeping its value applied.

{% hint style="info" %}
A value you locked earlier can still show up as locked even if it later disappears from the results (a deleted tag, a re-indexed path, for instance).
{% endhint %}

#### Lock a chip from the search breadcrumb

Open '**Your search**' to see the search breadcrumb, then click a chip's **padlock icon** to lock or unlock it (see the '**French**' chip above, for instance).

Locking one side of a paired filter (for instance a content type marked '**Excluded**') never locks its opposite side.

#### Apply your locked filters

A lock doesn't silently reapply itself to searches that don't already match it. For instance, right after you open a search link someone else shared with you, or start a brand-new search. The search breadcrumb's '**Apply locked filters**' button becomes clickable whenever at least one locked value isn't reflected in your current search:

<figure><img src="../.gitbook/assets/usage/filter-documents/11-page-search-documents-apply-locked-filters-enabled.jpg" alt="Screenshot of Datashare&#x27;s breadcrumb footer with the &#x27;Apply locked filters&#x27; button enabled, since a locked French value isn&#x27;t part of the current search"><figcaption></figcaption></figure>

Click it to instantly apply every locked value to your current search (locks always win over a conflicting value). A confirmation message tells you whether it succeeded:

<figure><img src="../.gitbook/assets/usage/filter-documents/12-page-search-documents-locked-filters-applied-toast.jpg" alt="Screenshot of Datashare&#x27;s search documents page with the &#x27;Locked filters successfully applied&#x27; confirmation message shown at the top right"><figcaption></figcaption></figure>

{% hint style="info" %}
If you have at least one lock active, the search breadcrumb opens automatically after you run a new search, and whenever a locked value stops matching your current search, so you always see what's locked before you read your results.
{% endhint %}

#### Unlock every filter

To remove every lock at once, without touching the filter values currently applied, open the search breadcrumb and click '**Unlock filters**':

<figure><img src="../.gitbook/assets/usage/filter-documents/13-page-search-documents-unlock-filters.jpg" alt="Screenshot of Datashare&#x27;s Languages filter and search breadcrumb after clicking &#x27;Unlock filters&#x27;: French stays ticked and applied, but its padlock icon and the footer&#x27;s lock count are gone"><figcaption></figcaption></figure>

## Contextualize filters

In most filters, tick '**Contextualize'** to **update the number of documents indicated in the filters so they reflect the results**.

The filter will only count what you selected, it will reflect the results of your current selection:

<figure><img src="../.gitbook/assets/usage/filter-documents/05-page-search-documents-filter-open.png" alt="Screenshot of Datashare&#x27;s page to search documents with a filter open and the Contextualize button at the bottom of this filter highlighted"><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/usage/filter-documents/06-page-search-documents-language-filter.png" alt="Screenshot of Datashare&#x27;s page to search documents with the &#x27;Language&#x27; filter open, the &#x27;Contextualize&#x27; checkbox ticked and the whole filter highlighted"><figcaption></figcaption></figure>

## Clear all filters

To reset all filters at the same time, open the **search breadcrumb**:

<figure><img src="../.gitbook/assets/usage/filter-documents/07-page-search-documents-your-search-button.png" alt="Screenshot of Datashare&#x27;s page to search documents with the &#x27;Your search&#x27; button on the left of the search bar highlighted"><figcaption></figcaption></figure>

Click '**Clear filters**':

<figure><img src="../.gitbook/assets/usage/filter-documents/08-page-search-documents-search-breadcrumb.png" alt="Screenshot of Datashare&#x27;s page to search documents with search breadcrumb open and the &#x27;Clear filter&#x27; button highlighted"><figcaption></figcaption></figure>

{% hint style="info" %}
'**Clear filters**' and '**Clear filters and query**' never remove a locked value. They clear every other filter and instantly re-apply your locks. To remove the locks themselves, see [Unlock every filter](#unlock-every-filter) above.
{% endhint %}

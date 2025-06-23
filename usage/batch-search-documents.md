---
description: >-
  Batch searches allow to get the results of each query of a list all at once:
  instead of searching each query one by one, upload a list, set options/filters
  and see the matching documents.
---

# Batch search documents

{% stepper %}
{% step %}
## Prepare a CSV list

Open a **spreadsheet** (LibreOffice, Framacalc, Excel, Google Sheets, Numbers, ...)

**Write your queries** in the first column of the spreadsheet, typing **one query per line**:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-08 at 05.33.37.png" alt="Screenshot of a spreadsheet with the first column filled with one name and surname of a female personality per cell" width="362"><figcaption><p>One query per line in a spreadsheet</p></figcaption></figure>



* **Do not put line break(s)** in any of your cells.

<figure><img src="../.gitbook/assets/screenshot-2020-02-03-at-12.18.04.png" alt="Screenshot of a spreadsheet cell filled with a text containing a line break and a red cross indicates it is wrong" width="375"><figcaption><p>This will lead to a "failure"</p></figcaption></figure>

<figure><img src="../.gitbook/assets/screenshot-2020-02-03-at-12.18.09.png" alt="Screenshot of a spreadsheet cell filled with a text not containing a line break and a green check indicates it is right" width="375"><figcaption><p>This will lead to a "success"</p></figcaption></figure>

To delete all line breaks in your spreadsheet, use '**Find and replace all**': find all '**\n'** and replace them by **nothing or a space**.

<figure><img src="../.gitbook/assets/screenshot-2020-02-03-at-11.51.34.png" alt="Screenshot of a spreadsheet software&#x27;s &#x27;Find and replace&#x27; window with the &#x27;Replace all&#x27; button highlighted" width="375"><figcaption><p>Use this functionality to delete all line break(s)</p></figcaption></figure>



* Write **2 characters minimum in each query**. If one cell contains one character but at least one other cell contains more than one, the cell containing one character will be ignored. If all cells contain only one character, the batch search will lead to a 'failure'.



* If you have **blank cells in your spreadsheet...**

<figure><img src="../.gitbook/assets/Screenshot 2025-06-08 at 05.51.52.png" alt="Screenshot of a spreadsheet with the first column filled with one name and surname of a female personality per cell and other columns from B to H empty and highlighted " width="563"><figcaption><p>Blank columns in a spreadsheet</p></figcaption></figure>

...the CSV, which stand for 'Comma-separated values', will translate these blank cells into semicolons (the 'commas'). You will thus see semicolons in your batch search results:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-08 at 05.50.49.png" alt="Screenshot of Datashare&#x27;s batch search page where each query with the female personality&#x27;s surname is followed by several semicolons which are highlighted"><figcaption><p>Remove blank cells in your spreadsheet in order to avoid this.</p></figcaption></figure>

To avoid that, **remove blank cells in your spreadsheet before exporting it as a CSV.**



* **If there is a comma in one of your cells** (like in 'Jane, Austen' below), the CSV will put the content of the cell in double quotes so it will search for the exact phrase in the documents:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-08 at 05.54.10.png" alt="Screenshot of a spreadsheet with the first column filled with one name and surname of a female personality per cell and the second cell contains &#x27;Jane, Austen&#x27; and is highlighted" width="176"><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/Screenshot 2025-06-08 at 05.56.55.png" alt="Screenshot of Datashare&#x27;s batch search page where two queries are highlighted: one is &#x27;Jane, Austen&#x27; and has 0 documents as results and the second one is &#x27;Jane Austen&#x27; and has 2 documents as results is &#x27;Jane Austen&#x27;"><figcaption></figcaption></figure>

**Remove all commas in your spreadsheet** if you want to avoid exact phrase search.



*   **Want to search only in some documents?** Use the 'Filters' step in the batch search's form (see below). Or **describe fields directly in your queries in the CSV**. For instance, if you want to search only in some documents **with certain tags**, write your queries like this:&#x20;

    <kbd>Paris AND (tags:London OR tags:Madrid NOT tags:Cotonou)</kbd>



*   **Use operators in your CSV**: AND NOT \* ? ! + - and other operators do work in batch searches as they do in the regular search bar **but only if "Do phrase match" at step 3 is turned off.** You can thus turn it off and write your queries like this for instance:

    <kbd>Paris NOT Barcelona AND Taipei</kbd> &#x20;



* Reserved characters (^ " ? ( \[ \*), when misused, can lead to **failures** **because of syntax errors.**



* Searches are **not case sensitive**: if you search 'HeLlo', it will look for all occurrences of 'Hello', 'hello', 'hEllo', 'heLLo', etc. in the documents.


{% endstep %}

{% step %}
## Export the list as a CSV

Export your spreadsheet of queries in a CSV format:

<figure><img src="../.gitbook/assets/screenshot-2019-09-25-at-16.10.06.png" alt="Screenshot of a window of &#x27;Numbers&#x27; software where the menu&#x27;s path File > Export to > CSV is selected"><figcaption></figcaption></figure>

**Important: Use the** [**UTF-8 encoding**](https://en.wikipedia.org/wiki/UTF-8) **in your spreadsheet software's settings.**



* **LibreOffice Calc**: it uses UTF-8 by default. If not, go to LibreOffice menu > Preferences > Load/Save > HTML Compatibility and make sur the character set is 'Unicode (UTF-8)':

<figure><img src="../.gitbook/assets/screenshot-2020-02-04-at-22.00.07.png" alt="Screenshot of a window of LibreOffice software where the Export options with &#x27;Character set: Unicode (UTF-8)&#x27; is highlighted"><figcaption></figcaption></figure>

* **Microsoft Excel**: if it is not set by default, select "CSV UTF-8" as one of the formats, [as explained here](https://answers.microsoft.com/en-us/msoffice/forum/msoffice_excel-mso_win10-mso_365hp/save-as-csv-with-utf-8-encoding/ff94943c-db5b-42c3-8905-f86d3d8d52c2).
* **Google Sheets**: it uses UTF-8 by default. Just click "Export to" and "CSV".


{% endstep %}

{% step %}
## Create the batch search

Open the menu, go to '**Tasks**', open '**Batch searches**' and click the **'Plus' button** at the top right:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-08 at 06.09.32.png" alt="Screenshot of Datashare&#x27;s batch searches page where the &#x27;Plus&#x27; button on the top right is highlighted"><figcaption></figcaption></figure>

Alternatively, in the menu next to 'Batch searches', click the **'Plus' button** :

<figure><img src="../.gitbook/assets/Screenshot 2025-06-08 at 06.10.43.png" alt="Screenshot of Datashare&#x27;s batch searches page where the &#x27;Plus&#x27; button in the menu next to the entry &#x27;Tasks > Batch searches&#x27; is highlighted"><figcaption></figcaption></figure>

The form to create a batch search opens:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-08 at 06.12.09.png" alt="Screenshot of Datashare&#x27;s page with a form to create a new batch search"><figcaption></figcaption></figure>



* **Do phrase matches**' is the equivalent of double quotes: it looks for documents containing an **exact sentence or phrase**. If you turn it on, all queries will be search for their exact mention in documents as if Datashare added double quotes around each query. In that case, it won't apply any operators (AND OR, etc) that would be in the queries. If 'Do phrase match' is off, queries are searched without double quotes and with potential operators.
* What is **fuzziness**? When you run a [batch search](batch-search-documents.md), you can set the fuzziness to 0, 1 or 2. It will apply to each term in a query. It corresponds to **the maximum number of operations (insertions, deletions, substitutions and transpositions)** on _**characters**_ needed to make one _**term**_ match the other.

> kitten -> sitten (1 substitution (k turned into s) = fuzziness is 1)

> kitten -> sittin (2 substitutions (k turned into s and e turned into i) = fuzziness is 2)

If you search for similar terms (**to catch typos for example**), use fuzziness.

"_The default edit distance is 2, but an edit distance of 1 should be sufficient to catch 80% of all human misspellings. It can be specified as: quikc\~1_" (source: [Elastic](https://www.elastic.co/guide/en/elasticsearch/reference/7.0/query-dsl-query-string-query.html#_fuzziness)).

> Example: quikc\~ brwn\~ foks\~ (as the default edit distance is 2, this query will catch all quick, quack, quock, uqikc, etc. as well as brown, folks, etc.)
>
> Example: Datashare\~1 (this query will catch Datasahre, Dqtashare, etc.)



* What are **proximity searches**? When you turn on 'Do phrase matches', you can set, in 'Proximity searches', the **maximum number of operations (insertions, deletions, substitutions and transpositions)** on _**terms**_ needed to make one _**phrase**_ match the other.

> “the cat is blue” -> “the small cat is blue” (1 insertion = fuzziness is 1)

> “the cat is blue” -> “the small is cat blue” (1 insertion + 2 transpositions = fuzziness is 3)

> Example: "fox quick"\~5 (this query will catch "quick brown fox", "quick brown car thin fox" or even "quick brown car thin blue tree fox"

Once you filled all steps, click '**Create**' and wait for the batch search to complete.
{% endstep %}

{% step %}
## Explore your results

In the menu, click '**Batch searches**' and click the **name of the batch search** to open it:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-08 at 06.28.44.png" alt="Screenshot of Datashare&#x27;s batch searches page where the first batch search&#x27;s name is highlighted"><figcaption></figcaption></figure>

See the **number of matching documents per query**:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-08 at 06.24.16.png" alt="Screenshot of Datashare&#x27;s page for one batch search where the list of queries and their matching documents are highlighted"><figcaption></figcaption></figure>

Sort the queries by **number of matching documents** or by **query position** using the page settings (icon at the top right of the screen). The query position will put the query in their original order as you put them in the CSV.

To explore a query's matching documents, click its name and see the **list of matching documents**:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-08 at 06.26.40.png" alt="Screenshot of Datashare&#x27;s page for one batch search&#x27;s matching documents "><figcaption></figcaption></figure>

Click a document's name to open it. Use the page settings or the column's names to sort documents.
{% endstep %}

{% step %}
## Relaunch a batch search (optional)

If you've added new files in Datashare after you launched a batch search, you might want to relaunch the batch search to search in the new documents too.&#x20;

The relaunched batch search will apply to newly indexed documents _and_ previously indexed documents (not only the newly indexed ones).

In 'Batch searches', go at the end of the table and click the '**Relaunch**' icon:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-08 at 06.32.07.png" alt="Screenshot of Datashare&#x27;s batch searches page where the last button with the &#x27;Relaunch&#x27; icon is highlighted"><figcaption></figcaption></figure>

Or click '**Relaunch**' in the batch search page below its name on the right panel:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-08 at 06.33.18.png" alt="Screenshot of Datashare&#x27;s page for one batch search where the &#x27;Relaunch&#x27; button in the right panel describing the batch search is highlighted"><figcaption></figcaption></figure>

Change its name, description and decide to delete current batch search after relaunch or not:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-08 at 06.34.24.png" alt="Screenshot of Datashare&#x27;s page for one batch search where the &#x27;Relaunch batch search&#x27; pop-in window is open"><figcaption></figcaption></figure>

See your relaunched batch search in the list of batch searches:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-08 at 06.36.36.png" alt="Screenshot of Datashare&#x27;s batch searches page where the two first batch searches (one normal, one relaunched) are highlighted"><figcaption></figcaption></figure>
{% endstep %}

{% step %}
### Failures

Failures in batch searches can be due to several causes.

{% hint style="info" %}
The **first query containing an error makes the batch search fail and stop.**
{% endhint %}

Go to '**Tasks**' > '**Batch searches**' > open the **batch search with a failure status** and click the **'Red cross icon' button** on the right panel:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-12 at 07.55.05.png" alt="Screenshot of Datashare&#x27;s batch search page where the &#x27;Failure&#x27; button in the right panel describing the batch search is highlighted"><figcaption></figcaption></figure>

Check the **first failure-generating query** in the error window:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-12 at 08.00.52.png" alt="Screenshot of Datashare&#x27;s batch search page where a modal window shows &#x27;The error is&#x27; with a description of the error &#x27;Unexpected char 106 at (line no=1, column no=81, offset=80)&#x27;"><figcaption></figcaption></figure>

Here it says:

```
Unexpected char 106 at (line no=1, column no=81, offset=80)
```

The first line contained a **comma** while it shouldn't. Datashare interpreted this query as a **syntax error**, it thus failed so the batch search stopped.&#x20;

Check [**the most common syntax errors**](faq/common-errors/your-search-query-is-wrong.md)**.**

We recommend to remove the commas, as well as any reserved characters, in your CSV using 'Find and replace all' features in your spreadsheet software and re-create the batch search.

### 'elasticsearch: Name does not resolve'

If you have a message which contain '_elasticsearch: Name does not resolve_', it means that Datashare can't make Elastic Search, its search engine, work.

In that case, you need to **re-open Datashare**: check how for [Mac](../local-mode/install-datashare-on-mac/open-datashare-on-mac.md), [Windows](../local-mode/install-datashare-on-windows/open-datashare-on-windows.md) or [Linux](../local-mode/install-datashare-on-linux/open-datashare-on-linux.md).

Example of a message regarding a problem with ElasticSearch:

<kbd>`SearchException: query='lovelace' message='org.icij.datashare.batch.SearchException: java.io.IOException: elasticsearch: Name does not resolve'`</kbd>



### 'Data too large'

One of your queries can lead to a 'Data too large' error.

It means that this query had too many results or in their results, some documents that were too big to process for Datashare. This makes the search engine fail.

We recommend to **remove the query responsible for the error and re-start your batch search without the query which led to the 'Data too large' error.**
{% endstep %}
{% endstepper %}






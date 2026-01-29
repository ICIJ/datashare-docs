---
description: >-
  Datashare provides a folder to collect documents on your computer to index in
  Datashare.
---

# Add documents to Datashare

{% stepper %}
{% step %}
#### Add documents to your 'Datashare' folder

You can find a folder called '**Datashare'** in your **home directory**.

Move the documents you want to add to Datashare into this folder.
{% endstep %}

{% step %}
#### Launch Datashare

Launch Datashare and see the interface opening in your default browser.
{% endstep %}

{% step %}
#### In the menu, in 'Tasks', open 'Documents'

Expand the **menu** on the left:

<figure><img src="../../.gitbook/assets/Expand Menu.png" alt="Screenshot of Datashare&#x27;s homepage highlighting the top icon in the left menu top to expand it"><figcaption><p>Expand the menu</p></figcaption></figure>

In '**Tasks**', open '**Documents**':

<figure><img src="../../.gitbook/assets/Open Documents.png" alt="Screenshot of Datashare&#x27;s homepage with the left menu open highlighting the &#x27;Documents&#x27; entry in the &#x27;Tasks&#x27; category"><figcaption><p>Open the "Documents" page</p></figcaption></figure>

On the top right, click the '**Plus'** button:

<figure><img src="../../.gitbook/assets/Add documents.png" alt="Screenshot of Datashare&#x27;s Documents page highlighting the &#x27;Plus&#x27; button at the top right corner"><figcaption><p>Click the "Plus" button</p></figcaption></figure>
{% endstep %}

{% step %}
#### Choose your options

* Select the **project** in Datashare where you want to add your documents. The Default project, which is automatically created, is selected by default.
* Select the **folder or sub-folder** on your computer in your 'Datashare' directory containing the documents you want to add. The entire 'Datashare' directory will be added by default.
* Choose the **language** of your documents if you don't want Datashare to guess it automatically.\
  Note: If you choose to also extract text from images (at the next option), you might need to install the appropriate language package on your system. Datashare will tell you if the language package is missing. Refer to the documentation to know [how to install language packages](../add-more-languages.md).
* Extract text from **images/PDFs with Optical Character Recognition (OCR)**. Be aware the indexing can take up to 10 times longer.
* Skip **already indexed** documents if you'd like.
* Click '**Add**'

<figure><img src="../../.gitbook/assets/Screenshot 2025-06-05 at 09.20.36.png" alt="Screenshot of Datashare&#x27;s &#x27;Add Documents&#x27; page with the form showing 5 options, a &#x27;Reset&#x27; and an &#x27;Add&#x27; buttons"><figcaption><p>Form for adding documents</p></figcaption></figure>
{% endstep %}

{% step %}
#### Watch the progress of your document addition

Two extraction tasks are now running:

* The first is the **scanning** of your Datashare folder - it sees if there are documents to analyze. It is called 'ScanTask'.
* The second is the **indexing** of these files. It is called 'IndexTask'.

<figure><img src="../../.gitbook/assets/Screenshot 2025-06-10 at 17.26.33 (1).png" alt="Screenshot of Datashare&#x27;s Documents page highlighting two lines in a table, one for &#x27;Scan folders&#x27; and another one for &#x27;Index documents&#x27;"><figcaption></figcaption></figure>

Note: It is not possible to '[Find entities](../find-entities.md)' while these two tasks are still running. You won't have the entities (names of people, organizations, locations and e-mail addresses) yet. To get these, once your document addition is finished, please follow the steps to '[Find entities'](../find-entities.md).

But you can start searching in your documents without having to wait for all tasks to be done.
{% endstep %}
{% endstepper %}

You can now [search documents in Datashare](../../usage/search-documents.md).

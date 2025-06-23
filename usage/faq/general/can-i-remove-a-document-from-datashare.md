# Can I remove document(s) from Datashare?

In **local** mode, you _cannot_ remove a single document or a selection of documents from Datashare. But you can remove **all your projects and documents** from Datashare.

Open the **menu** and on the bottom of the menu, click the **trash icon**:

<figure><img src="../../../.gitbook/assets/Screenshot 2025-06-10 at 10.54.58.png" alt="Screenshot of Datashare&#x27;s homepage with the menu and the trash icon at the bottom right of the menu highlighted"><figcaption></figcaption></figure>

A confirmation window opens. The action cannot be undone. It removes all the projects and their documents from Datashare. Click '**Yes**' if you are sure:&#x20;

<figure><img src="../../../.gitbook/assets/Screenshot 2025-06-10 at 10.55.13.png" alt="Screenshot of Datashare&#x27;s homepage with a confirmation modal to delete all projects and documents highlighted"><figcaption></figcaption></figure>

_**For advanced users** -_ if you'd like to do it with the Terminal, here are the instructions:

* If you're using Mac: `rm -Rf ~/Library/Datashare/index`
* If you're using Windows: `rd /s /q "%APPDATA%"\Datashare\index`
* If you're using Linux: `rm -Rf ~/.local/share/datashare/index`

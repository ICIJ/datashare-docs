# Install Neo4j plugin

## Install the Neo4j plugin

Install the Neo4j plugin following [these instructions](../plugins-and-extensions.md).

## Configure the Neo4j plugin

1\. At the bottom of the menu, click on the '**Settings**' icon:&#x20;

<figure><img src="../../.gitbook/assets/Screenshot 2025-06-11 at 11.05.58.png" alt="Screenshot of Datashare&#x27;s homepage with the Settings icon at the bottom of the menu highlighted"><figcaption></figcaption></figure>

2\. Make sure the following settings are properly set:

* `Neo4j Host` should be `localhost` or the address where your Neo4j instance is running
* `Neo4j Port` should be the port where your Neo4j instance is running (`7687` by default)
* `Neo4j User` should be set to your Neo4j user name (`neo4j` by default)
* `Neo4j Password` **should only be set if your Neo4j user is using password authentication**

3\. **When running `Neo4j Community Edition`, set the `Neo4j Single Project` value**. In community edition, the Neo4j DBMS is restricted to a single database. Since Datashare supports multiple projects, you must set the `Neo4j Single Project` with the name of the project which will use Neo4j plugin. **Other projects won't be able to use the Neo4j plugin**.

4\. Restart Datashare to apply the changes. Check how for [Mac](../install-datashare-on-mac/open-datashare-on-mac.md), [Windows](../install-datashare-on-windows/open-datashare-on-windows.md) or [Linux](../install-datashare-on-linux/open-datashare-on-linux.md).

5\. Go to '**Projects**' > **your project's page** > the **Graph** tab. You should see the Neo4j widget. After a little while, its status should be `RUNNING`:

<figure><img src="../../.gitbook/assets/Screenshot 2025-06-11 at 11.10.00.png" alt="Screenshot of a Project&#x27;s page on the Graph tab with the Running status highlighted"><figcaption></figcaption></figure>

You can now [create the graph](create-and-update-the-graph.md).

# Install Datashare

Currently, only a .deb package for Debian/Ubuntu is provided.

If you want to run it with another Linux distribution, you can download the latest version of the Datashare jar here: [https://github.com/ICIJ/datashare/releases/latest](https://github.com/ICIJ/datashare/releases/latest)

And adapt the following launch script to your environment: [https://github.com/ICIJ/datashare/blob/master/datashare-dist/src/main/deb/bin/datashare](https://github.com/ICIJ/datashare/blob/master/datashare-dist/src/main/deb/bin/datashare).

{% stepper %}
{% step %}
#### Download Datashare

Go to [datashare.icij.org](https://datashare.icij.org) and click '**Download for Linux**':

<figure><img src="../../.gitbook/assets/Download Linux.png" alt="Screenshot of the homepage of datashare.icij.org highlighting the &#x27;Download for Linux&#x27; button"><figcaption></figcaption></figure>

Save the **Debian package** as a file:

<figure><img src="../../.gitbook/assets/save_as.png" alt="Screenshot of a Linux&#x27; window saying &#x27;What should Firefox do with this file?&#x27; with 2 radiobuttons: &#x27;Open with Archive Manager&#x27; and &#x22;Save File&#x27; (selected) with 2 buttons: &#x27;Cancel&#x27; and &#x27;OK&#x27;"><figcaption><p>Save as file</p></figcaption></figure>
{% endstep %}

{% step %}
#### Install the package

```
$ sudo apt install /dir/to/debian/package/datashare-dist_7.2.0_all.deb
```
{% endstep %}

{% step %}
#### Run Datashare

```
$ datashare
```
{% endstep %}
{% endstepper %}

You can now [start Datashare](open-datashare-on-linux.md).

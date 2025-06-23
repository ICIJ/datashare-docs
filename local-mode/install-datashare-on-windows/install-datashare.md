---
description: You must have Windows 7 Service Pack 2 or any newer version.
---

# Install Datashare

{% stepper %}
{% step %}
### Uninstall any prior standard version

Before we start, please **uninstall any prior standard version of Datashare** if you had already installed it. You can follow these steps: [https://www.laptopmag.com/articles/uninstall-programs-windows-10](https://www.laptopmag.com/articles/uninstall-programs-windows-10)
{% endstep %}

{% step %}
### Download Datashare

Go to [datashare.icij.org](https://datashare.icij.org) and click '**Download for Windows**':

<figure><img src="../../.gitbook/assets/InstallWindows.png" alt="Screenshot of the homepage of datashare.icij.org highlighting the &#x27;Download for Windows&#x27; button"><figcaption><p><a href="https://datashare.icij.org">datashare.icij.org</a></p></figcaption></figure>

The file '**datashare-X.Y.Z.exe**' is now downloaded. You can find it in your **Downloads**.&#x20;

**Double-click** on the name of the file in order to execute it.
{% endstep %}

{% step %}
### Allow Datashare

As Datashare is not signed, this popup asks for your permission. Don't click 'Don't run' but **click** '**More info'**:

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_45_55.png" alt="Screenshot of Windows&#x27; window saying &#x27;Windows protected your PC&#x27; with the text &#x22;Windows Defender SmartScreen prevented an unrecognized app from starting. Running this app might put your PC at risk. More info (which is a link)&#x22; and a button &#x27;Don&#x27;t run&#x27;"><figcaption></figcaption></figure>

Click '**Run anyway**':

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_46_41.png" alt="Screenshot of Windows&#x27; window saying &#x27;Windows protected your PC&#x27; with 2 buttons: &#x27;Run anyway&#x27; and &#x27;Don&#x27;t run&#x27;"><figcaption></figcaption></figure>

It asks if you want to allow the app to make changes to your device. Click '**Yes**':

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_48_53.png" alt="Screenshot of Windows&#x27; window with the question &#x27;Do you want to allow this app from an unknown producer to make changes to your device?&#x27; with 2 buttons: &#x27;Yes&#x27; (which is highlighted) and &#x27;No&#x27;"><figcaption></figcaption></figure>
{% endstep %}

{% step %}
### Install Datashare

On the Installer Wizard, as you need to download and install OpenJDK11 if it is not installed on your device, click '**Install**':

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_49_28.png" alt="Screenshot of Windows&#x27; window with the title &#x27;Welcome to the ICIJ Setup Wizard&#x27; with 2 buttons: &#x27;Install&#x27; (which is highlighted) and &#x27;Cancel&#x27;"><figcaption></figcaption></figure>

The following windows with progress bars will be displayed:

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_49_41.png" alt="Screenshot of Windows&#x27; window saying &#x27;Please wait (...) Datashare is being installed&#x27; with a progress bar and a &#x27;Cancel&#x27; button "><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_50_01.png" alt="Screenshot of Windows&#x27; window saying &#x27;Please wait (...) Tesseract is being installed&#x27; with a progress bar and a &#x27;Cancel&#x27; button "><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_50_21.png" alt="Screenshot of Windows&#x27; window saying &#x27;Please wait (...) Datashare is being installed&#x27; and &#x27;Please wait while Setup is loading&#x27; "><figcaption></figcaption></figure>

Choose a language and click '**OK**':

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_50_35.png" alt="Screenshot of Windows&#x27; window saying &#x27;Please wait (...) Datashare is being installed&#x27; containing another window which says &#x27;Please select a language&#x27; with a dropdown with &#x27;English&#x27; selected&#x27; with 2 buttons: &#x27;Ok&#x27; (which is highlighted) and &#x27;Cancel&#x27; "><figcaption></figcaption></figure>
{% endstep %}

{% step %}
### Install Tesseract OCR

To install **Tesseract OCR**, click the following buttons on the Installer Wizard's windows:

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_50_45.png" alt="Screenshot of Windows&#x27; window saying &#x27;Welcome to the Tessearct-OCR Setup Wizard&#x27; with 2 buttons: &#x27;Next (which is highlighted) and &#x27;Cancel&#x27;"><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_50_58.png" alt="Screenshot of Windows&#x27; window saying &#x27;Licence agreement&#x27; with 3 buttons: &#x27;Previous&#x27;, &#x27;Next (which is highlighted) and &#x27;Cancel&#x27;"><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_51_08.png" alt="Screenshot of Windows&#x27; window showing 2 radiobuttons: &#x27;Install for anyone using this computer&#x27; (which is selected) and &#x27;Install just for me&#x27; and with 3 buttons: &#x27;Previous&#x27;, &#x27;Next (which is highlighted) and &#x27;Cancel&#x27;"><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_51_19.png" alt="Screenshot of Windows&#x27; window showing some pre-ticked options with 3 buttons: &#x27;Previous&#x27;, &#x27;Next (which is highlighted) and &#x27;Cancel&#x27;"><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_51_34.png" alt="Screenshot of Windows&#x27; window showing a pre-ticked &#x27;Destination Folder&#x27; (C:\Program Files (x86)\Tesseract-OCR) with 3 buttons: &#x27;Previous&#x27;, &#x27;Next (which is highlighted) and &#x27;Cancel&#x27;"><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_51_47.png" alt="Screenshot of Windows&#x27; window saying &#x27;Choose Start Menu Folder&#x27; with 3 buttons: &#x27;Back&#x27;, &#x27;Install&#x27; (which is highlighted) and &#x27;Cancel&#x27;"><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_51_59.png" alt="Screenshot of Windows&#x27; window saying &#x27;Installation Complete&#x27; with 3 buttons: &#x27;Back&#x27;, &#x27;Install&#x27; (which is highlighted) and &#x27;Cancel&#x27;"><figcaption></figcaption></figure>

Untick '**Show README**' and click '**Finish**':

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_52_14.png" alt="Screenshot of Windows&#x27; window saying &#x27;Completing the Tesseract-OCR Setup Wizard&#x27; with 3 buttons: &#x27;Back&#x27;, &#x27;Finish&#x27; (which is highlighted) and &#x27;Cancel&#x27;"><figcaption></figcaption></figure>

Finally, click '**Close**' to close the installer of TesseractOCR.
{% endstep %}

{% step %}
### Install Datashare.jar

It is now downloading the back-end and the front-end, Datashare.jar:

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_52_27.png" alt="Screenshot of Windows&#x27; window saying &#x27;ICIJ Datashare Setup&#x27; with a progress bar and a &#x27;Cancel&#x27; button"><figcaption></figcaption></figure>

When it is finished, click '**Close**':

<figure><img src="../../.gitbook/assets/virtualbox_windev1808eval_1_19_03_2020_15_55_17.png" alt="Screenshot of Windows&#x27; window saying &#x27;ICIJ Datashare Setup&#x27; with a completed progress bar with 3 buttons: &#x27;Back&#x27;, &#x27;Close&#x27; (which is highlighted) and &#x27;Cancel&#x27;"><figcaption></figcaption></figure>
{% endstep %}
{% endstepper %}

You can now [start Datashare](open-datashare-on-windows.md).

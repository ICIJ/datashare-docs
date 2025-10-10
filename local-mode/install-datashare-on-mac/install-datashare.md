# Install Datashare

The installer will take care of checking that your system have all the dependencies to run Datashare. Because this software use [Apache Tesseract](https://github.com/tesseract-ocr/tesseract) (to perform Optical Character Recognition, OCR) and Mac doesn't support them out-of-box, heavy dependencies must be downloaded. If your system have none of those dependencies, the first installation of Datashare can take up to 30 minutes.

The installer will set up:

* **Xcode Command Line Tools** (if neither XCode or [Xcode Command Line Tools](https://mac.install.guide/commandlinetools/index.html) are installed)
* **MacPorts** (if neither Homebrew or MacPorts are installed)
* **Apache Tesseract** with MacPorts or Homebrew
* **Java JRE 17**
* **Datashare** executable

**Note:** Previous versions of this document referred to a "Docker Installer". We do not provide this installer anymore but Datashare is still [published on the Docker Hub](https://hub.docker.com/r/icij/datashare) and supported with Docker.

**Installation fails:** &#x20;

* Fail to install MacPorts: you can manually install [Homebrew](https://brew.sh/) first and then restart the installer.&#x20;
* "System Software from application was blocked from loading" : Check in your Mac's "System Settings" > "privacy & security" if you have a section with this mention "System software from application 'Datashare' was blocked from loading" or something similar related to Datashare. If you have this section you'll have to click "Allow" to be able to install datashare.
* For any other issue check our [Github issues](https://github.com/ICIJ/datashare/issues) or [create a new one](https://github.com/ICIJ/datashare/issues/new?template=bug_report.md) with your setup (macOs version) and installer logs (Command+L when the installer is launched and failed).

{% stepper %}
{% step %}
### **Download Datashare**

Go to [datashare.icij.org](https://datashare.icij.org) and click '**Download for Mac'**.

<figure><img src="../../.gitbook/assets/Download.png" alt="Screenshot of the homepage of datashare.icij.org highlighting the &#x27;Download for Mac&#x27; button"><figcaption><p><a href="https://datashare.icij.org">datashare.icij.org</a></p></figcaption></figure>
{% endstep %}

{% step %}
### Start the installer

In Finder, go to your '**Downloads'** directory and double-click '**datashare-X.Y.Z.pkg'**:

<figure><img src="../../.gitbook/assets/Screenshot 2023-01-13 at 02.45.34.png" alt="Screenshot of the Downloads window on Mac showing the installer package of Datashare"><figcaption></figcaption></figure>
{% endstep %}

{% step %}
### **Go through the Datashare Installer**

Click '**Continue**', '**Install**', enter your password and '**Install Software**':

<figure><img src="../../.gitbook/assets/Screenshot 2023-01-13 at 02.46.08.png" alt="Screenshot of the Mac installer&#x27;s first step to install Datashare: &#x27;Introduction&#x27;"><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot 2023-01-13 at 02.46.21.png" alt="Screenshot of the Mac installer&#x27;s third step to install Datashare: &#x27;Installation Type&#x27;&#x27;"><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot 2023-01-13 at 02.47.01.png" alt="Screenshot of the Mac installer&#x27;s step to install Datashare when username and password are asked "><figcaption></figcaption></figure>

The installation begins. You see a progress bar. It stays a long time on "Running package scripts" because it is installing XCode Command Line Tools, MacPort, Tesseract OCR, Java Runtime Environment and finally Datashare.

You can see what it actually does by typing command+L: it will open a window which logs every action made.

In the end, you should see this screen:

<figure><img src="../../.gitbook/assets/Screenshot 2023-01-13 at 02.47.33.png" alt="Screenshot of the Mac installer&#x27;s last step to install Datashare: &#x27;Summary&#x27; saying &#x27;The installation was successful.&#x27;with a blue &#x27;Close&#x27; button"><figcaption></figcaption></figure>

You can now safely close this window.
{% endstep %}
{% endstepper %}

You can now [start Datashare](open-datashare-on-mac.md).

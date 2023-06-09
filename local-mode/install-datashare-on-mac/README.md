---
description: It will help you set up and install Datashare on your computer.
---

# Install on Mac

This guide will explain to you how to install Datashare on Mac. The installer will take care of checking your system have all the dependencies to run Datashare. Because this software use [Apache Tesseract](https://github.com/tesseract-ocr/tesseract) (to perform Optical Character Recognition) and Mac doesn't support them out-of-box, heavy dependencies must be downloaded. If your system have none of those dependencies, the first installation of Datashare can take up to 30 minutes.

The installer will setup:

* **Xcode Command Line Tools** (if neither XCode or [Xcode Command Line Tools](https://mac.install.guide/commandlinetools/index.html) are installed)
* **MacPorts** (if neither Homebrew or MacPorts are installed)
* **Apache Tesseract** with MacPorts or Homenrew
* **Java JRE 11**
* **Datashare** executable

**Note:** previous versions of this document refered to a "Docker Installer". We do not provide this installer anymore but Datashare is still [published on the Docker Hub](https://hub.docker.com/r/icij/datashare) and supported with Docker.

### **1. Download Datashare**

Go to [datashare.icij.org](https://datashare.icij.org), scroll down and click '**Download for Mac'**.

![](<../../.gitbook/assets/Capture d’écran 2020-09-24 à 09.59.47 (1) (1) (1) (2).png>)

### 2. Start the installer

Go to your "**Downloads**" directory in Finder and double-click "**datashare-X.Y.Z.pkg**":

<figure><img src="../../.gitbook/assets/Screenshot 2023-01-13 at 02.45.34.png" alt=""><figcaption></figcaption></figure>

### **3. Go through the Datashare Installer**

Click 'Continue', 'Install', enter your password and 'Install Software':

<figure><img src="../../.gitbook/assets/Screenshot 2023-01-13 at 02.46.08.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot 2023-01-13 at 02.46.21.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot 2023-01-13 at 02.47.01.png" alt=""><figcaption></figcaption></figure>

The installation begins. You see a progress bar. It stays a long time on "Running package scripts" because it is installing XCode Command Line Tools, MacPort, Tesseract OCR, Java Runtime Environment and finally Datashare.

You can see what it actually does by typing command+L, it will open a window which logs every action made.

In the end, you should see this screen:

<figure><img src="../../.gitbook/assets/Screenshot 2023-01-13 at 02.47.33.png" alt=""><figcaption></figcaption></figure>

**You can now** [**start Datashare**](open-datashare-on-mac.md) **!**

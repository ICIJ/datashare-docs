# Datashare doesn't open. What should I do?

It can be due to extensions priorly installed. You need to remove them. To do so, you can **open your Terminal, copy and paste the text below**:

* On Mac

```
rm -rf ~/Library/datashare/plugins ~/Library/datashare/extensions
```

* On Linux

```
rm -rf ~/.local/share/datashare/plugins ~/.local/share/datashare/extensions
```

* On Windows

```
del /S %APPDATA%\Datashare\Extensions  %APPDATA%\Datashare\Plugins
```

Press **Enter.** Open Datashare again.


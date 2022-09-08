# webview-keylogger
Injects keypress listener to hijack pressed keys in a webview, demonstration purpose only.

# how it works
- initiate a webview with a configuration that allows getting updates from the injected javascript, [ref](https://github.com/erkekin/webview-keylogger/blob/main/webview-keylogger/ViewController.swift#L12)
- load a url into webview
- inject a javascript code and override keypress event handler
- observe pressed keys

# Video



https://user-images.githubusercontent.com/701481/189076316-0df7fcb4-73ad-4076-990a-edb455954a43.mp4



Erk Ekin 2022

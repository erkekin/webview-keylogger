# webview-keylogger
Injects keypress listener to hijack pressed keys in a webview, demonstration purpose only.

# how it works
- initiate a webview (`WKWebView`) with a configuration (`WKWebViewConfiguration`) that allows getting updates from the [injected javascript](https://github.com/erkekin/webview-keylogger/blob/main/webview-keylogger/ViewController.swift#L34-L38), [ref](https://github.com/erkekin/webview-keylogger/blob/main/webview-keylogger/ViewController.swift#L12)
- load a url into webview [ref](https://github.com/erkekin/webview-keylogger/blob/35e9d520cd70da6b448dd1d60f627b39bd9e6793/webview-keylogger/ViewController.swift#L47)
- inject a javascript code and override `keypress` event handler [ref](https://github.com/erkekin/webview-keylogger/blob/main/webview-keylogger/ViewController.swift#L41)
- observe pressed keys [ref](https://github.com/erkekin/webview-keylogger/blob/35e9d520cd70da6b448dd1d60f627b39bd9e6793/webview-keylogger/ViewController.swift#L50-L53)

# Video


https://user-images.githubusercontent.com/701481/189076316-0df7fcb4-73ad-4076-990a-edb455954a43.mp4

read more: https://krausefx.com/blog/announcing-inappbrowsercom-see-what-javascript-commands-get-executed-in-an-in-app-browser

Erk Ekin 2022

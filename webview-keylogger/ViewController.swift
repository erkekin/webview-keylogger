import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {
    var webView: WKWebView!
    @IBOutlet weak var secretField: UITextView!
    @IBOutlet weak var urlField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userContentController = WKUserContentController()
        userContentController.add(self, name: "toggleMessageHandler")
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        webView = WKWebView(frame: .zero, configuration: configuration)
        view.addSubview(webView)
        webView.navigationDelegate = self
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: secretField.bottomAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        webView.load(.init(url: .init(string: "https://gmail.com")!))
        urlField.text = "https://gmail.com"
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let str = """
                document.addEventListener('keypress', function(event) {
                if (window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.toggleMessageHandler) {
                    window.webkit.messageHandlers.toggleMessageHandler.postMessage(String.fromCharCode(event.keyCode));
                }
            });
        """
        
        webView.evaluateJavaScript(str) { (id, error) in }
    }
    
    @IBAction func gooTURL(_ sender: UITextField) {
        guard let text = urlField.text else {return}
        guard let url = URL(string: text) else {return}
        webView.load(.init(url: url))
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let message = (message.body as? String) ?? ""
        secretField.text = (secretField.text ?? "") + message
    }
    
    func webView(webView: WKWebView!, createWebViewWithConfiguration configuration: WKWebViewConfiguration!, forNavigationAction navigationAction: WKNavigationAction!, windowFeatures: WKWindowFeatures!) -> WKWebView! {
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
        return nil
    }
}


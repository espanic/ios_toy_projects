//
//  AuthViewController.swift
//  Spotify
//
//  Created by 최윤호 on 2023/03/24.
//

import UIKit
import WebKit

class AuthViewController: UIViewController, WKNavigationDelegate  {
    private let webView : WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }()
    
    public var completionHandler : ((Bool) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"
        view.backgroundColor = .systemBackground
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        guard let url = AuthManager.shared.signInURL else {return}
        
        
        self.webView.load(URLRequest(url: url))
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else {
            return
        }
        
        //Exchange the code for access token
        
        let component = URLComponents(string: url.absoluteString)
        guard let code = component?.queryItems?.first(where: {$0.name == "code"})?.value else {
            return
        }
        webView.isHidden = true
        print("Code : \(code)")
        navigationController?.popToRootViewController(animated: true)
        AuthManager.shared.exchangeCodeForToken(code: code) { [weak self] success in
            self?.completionHandler?(success)
        }
    }

}

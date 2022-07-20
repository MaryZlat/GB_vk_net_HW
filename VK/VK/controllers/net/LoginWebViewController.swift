//
//  LoginWebViewController.swift
//  VK
//
//  Created by Mary Zlatnikova on 18.07.2022.
//

import UIKit
import WebKit

class LoginWebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        
        var urlComponents = URLComponents(string: "https://oauth.vk.com/authorize")
        urlComponents?.queryItems = [
            URLQueryItem(name: "client_id", value: "8222046"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131"),
        ]
        
        guard let url = urlComponents?.url else { return }
        print(url)
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    

}


extension LoginWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
      
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String] ()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        if let token = params["access_token"] {
            print(token)
            Session.shared.userToken = token
            navigationController?.pushViewController(WebTestViewController(), animated: true)
        }
        
//        guard let token = token else { return }
//        Session.shared.userToken = token
//
//        navigationController?.pushViewController(WebTestViewController(), animated: true)
//
        decisionHandler(.cancel)
    }
    
}

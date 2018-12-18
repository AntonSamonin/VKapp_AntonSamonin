//
//  VKAutorizationViewController.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 11/3/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit
import Alamofire
import WebKit
import FirebaseAuth
class VKAutorizationViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
        URLQueryItem(name: "client_id", value: "6740512"),
        URLQueryItem(name: "display", value: "mobile"),
        URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
        URLQueryItem(name: "scope", value: "friends,groups,photos,wall"),
        URLQueryItem(name: "response_type", value: "token"),
        URLQueryItem(name: "v", value: "5.87")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)

        // Do any additional setup after loading the view.
    }
}

extension VKAutorizationViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=")}
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        print(params)
        
        guard  let token = params["access_token"], let userId = Int(params["user_id"]!)
            else {
                decisionHandler(.cancel)
                return
        }
        
        print(token, userId)
        
        Session.instance.token = token
        Session.instance.userId = userId
        
        self.performSegue(withIdentifier: "ShowMain", sender: Any?.self)
        
        decisionHandler(.cancel)
    }
}

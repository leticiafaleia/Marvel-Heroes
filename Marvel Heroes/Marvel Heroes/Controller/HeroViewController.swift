//
//  HeroViewController.swift
//  Marvel Heroes
//
//  Created by Letícia on 06/11/20.
//

import UIKit
import WebKit

class HeroViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var hero: Hero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: hero.urls.first!.url)
        let request = URLRequest(url: url!)
        title = hero.name
        webView.navigationDelegate = self
        webView.load(request)
    }
}

extension HeroViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.stopAnimating()
    }
}

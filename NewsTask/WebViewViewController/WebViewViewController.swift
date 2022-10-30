//
//  WebViewViewController.swift
//  NewsTask
//
//  Created by Клоун on 29.10.2022.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var navigationView: UIView!
    
    var viewModel: WebViewViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        loadRequest()
    }
    
    private func loadRequest() {
        viewModel.getPage { [weak self] request in
            self?.webView.load(request)
        }
    }
    
    @IBAction func backButtonPressed() {
        dismiss(animated: true)
    }
}

//MARK: - WKNavigationDelegate
extension WebViewViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
}

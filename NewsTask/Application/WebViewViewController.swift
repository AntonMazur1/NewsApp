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
    @IBOutlet weak var navigationView: UIView!
    
    var viewModel: WebViewViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRequest()
    }
    
    private func loadRequest() {
        viewModel.loadPage { [weak self] request in
            self?.webView.load(request)
        }
    }
    
    @IBAction func backButtonPressed() {
        dismiss(animated: true)
    }
}

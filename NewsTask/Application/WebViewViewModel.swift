//
//  WebViewViewModel.swift
//  NewsTask
//
//  Created by Клоун on 29.10.2022.
//

import Foundation

protocol WebViewViewModelProtocol {
    func loadPage(completion: @escaping(URLRequest) -> Void)
    init(url: String)
}

class WebViewViewModel: WebViewViewModelProtocol {
    private let url: String
    
    required init(url: String) {
        self.url = url
    }
    func loadPage(completion: @escaping (URLRequest) -> Void) {
        guard let url = URL(string: url) else { return }
        let urlRequest = URLRequest(url: url)
        
        completion(urlRequest)
    }
}

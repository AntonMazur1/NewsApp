//
//  NewsViewModel.swift
//  NewsTask
//
//  Created by Клоун on 20.10.2022.
//

import Foundation

protocol NewsViewModelProtocol {
    var numberOfRows: Int { get }
    func loadNews(completion: @escaping() -> ())
    func getNewsCellViewModel(at indexPath: IndexPath) -> NewsTableViewCellViewModelProtocol?
    func getWebViewViewModel(at indexPath: IndexPath) -> WebViewViewModelProtocol?
}

class NewsViewModel: NewsViewModelProtocol {
    private var articles: [Model.ArticleModel]?
    
    var numberOfRows: Int {
        articles?.count ?? 0
    }
    
    func loadNews(completion: @escaping () -> ()) {
        NetworkManager.shared.loadNewsFromServer { result in
            switch result {
            case .success(let articles):
                self.articles = articles
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getNewsCellViewModel(at indexPath: IndexPath) -> NewsTableViewCellViewModelProtocol? {
        guard let articleImage = articles?[indexPath.row].image,
              let articleTitle = articles?[indexPath.row].title
        else { return nil }
        let articleDescription = articles?[indexPath.row].articleDescription ?? ""
        return NewsTableViewCellViewModel(
            articleImage: articleImage,
            articleTitle: articleTitle,
            articleDescription: articleDescription
        )
    }
    
    func getWebViewViewModel(at indexPath: IndexPath) -> WebViewViewModelProtocol? {
        let url = articles?[indexPath.row].url
        print(url)
        return WebViewViewModel(url: url ?? "")
    }
}

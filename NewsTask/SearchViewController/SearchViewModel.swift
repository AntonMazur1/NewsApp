//
//  SearchViewModel.swift
//  NewsTask
//
//  Created by Клоун on 23.10.2022.
//

import Foundation

protocol SearchViewModelProtocol {
    var numberOfRows: Int { get }
    var numberOfSearch: Int { get }
    var queryItems: [URLQueryItem] { get }
    func searchNews(completion: @escaping() -> ())
    func getNewsViewModel(at indexPath: IndexPath) -> NewsTableViewCellViewModelProtocol?
    func getSearchHistoryViewModel(at indexPath: IndexPath) -> SearchHistoryTableViewCellViewModelProtocol?
    func getWebViewModel(at indexPath: IndexPath) -> WebViewViewModelProtocol?
}

class SearchViewModel: SearchViewModelProtocol {
    private var articles: [Model.ArticleModel]?
    private var searchHistory = ["Bool what is it?", "Good Morning", "Xcode"]
    
    var numberOfRows: Int {
        articles?.count ?? 0
    }
    
    var numberOfSearch: Int {
        searchHistory.count
    }
    
    var queryItems: [URLQueryItem] {
        FiltersManager.shared.getQueryItems()
    }
    
    func searchNews(completion: @escaping () -> ()) {
        NetworkManager.shared.searchNewsByRequest(queries: queryItems) { result in
            switch result {
            case .success(let news):
                self.articles = news.articles
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getNewsViewModel(at indexPath: IndexPath) -> NewsTableViewCellViewModelProtocol? {
        guard let articleImage = articles?[indexPath.row].image,
              let articleTitle = articles?[indexPath.row].title
        else { return nil }
        let articleDescription = articles?[indexPath.row].articleDescription
        return NewsTableViewCellViewModel(articleImage: articleImage, articleTitle: articleTitle, articleDescription: articleDescription ?? "")
    }
    
    func getSearchHistoryViewModel(at indexPath: IndexPath) -> SearchHistoryTableViewCellViewModelProtocol? {
        let searchRequest = searchHistory[indexPath.row]
        return SearchHistoryTableViewCellViewModel(searchHistoryTitle: searchRequest)
    }
    
    func getWebViewModel(at indexPath: IndexPath) -> WebViewViewModelProtocol? {
        let url = articles?[indexPath.row].url
        return WebViewViewModel(url: url ?? "")
    }
}

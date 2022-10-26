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
    func searchNews(completion: @escaping() -> ())
    func getNewsViewModel(at indexPath: IndexPath) -> NewsTableViewCellViewModelProtocol?
    func getSearchHistoryViewModel(at indexPath: IndexPath) -> SearchHistoryTableViewCellViewModelProtocol?
}

class SearchViewModel: SearchViewModelProtocol {
    var news: [Article]?
    private var searchHistory = ["Bool what is it?", "Good Morning", "Xcode"]
    
    var numberOfRows: Int {
        news?.count ?? 0
    }
    
    var numberOfSearch: Int {
        searchHistory.count
    }
    
    func searchNews(completion: @escaping () -> ()) {
        NetworkManager.loadNewsFromServer { result in
            switch result {
            case .success(let news):
                self.news = news.articles
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getNewsViewModel(at indexPath: IndexPath) -> NewsTableViewCellViewModelProtocol? {
        guard let newsImage = news?[indexPath.row].image,
              let newsTitle = news?[indexPath.row].title
        else { return nil }
        let newsDescription = news?[indexPath.row].articleDescription
        return NewsTableViewCellViewModel(newsImage: newsImage, newsTitle: newsTitle, newsDescription: newsDescription ?? "")
    }
    
    func getSearchHistoryViewModel(at indexPath: IndexPath) -> SearchHistoryTableViewCellViewModelProtocol? {
        let searchRequest = searchHistory[indexPath.row]
        return SearchHistoryTableViewCellViewModel(searchHistoryTitle: searchRequest)
    }
}

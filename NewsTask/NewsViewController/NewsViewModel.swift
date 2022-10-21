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
}

class NewsViewModel: NewsViewModelProtocol {
    private var news: [Article]?
    
    var numberOfRows: Int {
        news?.count ?? 0
    }
    
    func loadNews(completion: @escaping () -> ()) {
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
    
    func getNewsCellViewModel(at indexPath: IndexPath) -> NewsTableViewCellViewModelProtocol? {
        guard let newsImage = news?[indexPath.row].image,
              let newsTitle = news?[indexPath.row].title
        else { return nil }
        let newsDescription = news?[indexPath.row].articleDescription ?? ""
        return NewsTableViewCellViewModel(
            newsImage: newsImage,
            newsTitle: newsTitle,
            newsDescription: newsDescription
        )
    }
}

//
//  NetworkManager.swift
//  NewsTask
//
//  Created by Клоун on 20.10.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func loadNewsFromServer(completion: @escaping (Result<[Model.ArticleModel], Error>) -> Void) {
        let url = "https://gnews.io/api/v4/top-headlines?token=4386817b6ca6e8ed5e3cfcc28c95de71&lang=en"
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            do {
                guard let data = data else { return }
                let news = try JSONDecoder().decode(Model.NewsModel.self, from: data)
                completion(.success(news.articles))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func searchNewsByRequest(queries: [URLQueryItem],
                             completion: @escaping (Result<Model.NewsModel, Error>) -> Void) {
        let url = "https://gnews.io/api/v4/search"
        var urlComps = URLComponents(string: url)
        urlComps?.queryItems = queries
        
        guard let queryUrl = urlComps?.url else { return }
        #warning("Delete print URL")
        print(queryUrl)
        URLSession.shared.dataTask(with: queryUrl) { data, _, error in
            do {
                guard let data = data else { return }
                let news = try JSONDecoder().decode(Model.NewsModel.self, from: data)
                completion(.success(news))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

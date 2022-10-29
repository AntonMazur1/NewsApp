//
//  NewsModel.swift
//  NewsTask
//
//  Created by Клоун on 20.10.2022.
//

import Foundation


enum Model {

}

extension Model {
    struct NewsModel: Codable {
        let totalArticles: Int
        let articles: [ArticleModel]
    }

    struct ArticleModel: Codable {
        let title: String
        let articleDescription: String?
        let content: String
        let url: String
        let image: String
        let publishedAt: String
        let source: SourceModel
    }

    struct SourceModel: Codable {
        let name: String
        let url: String
    }
}

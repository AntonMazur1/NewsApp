//
//  NewsModel.swift
//  NewsTask
//
//  Created by Клоун on 20.10.2022.
//

import Foundation

struct News: Codable {
    let totalArticles: Int
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let articleDescription: String?
    let content: String
    let url: String
    let image: String
    let publishedAt: String
    let source: Source
}

struct Source: Codable {
    let name: String
    let url: String
}

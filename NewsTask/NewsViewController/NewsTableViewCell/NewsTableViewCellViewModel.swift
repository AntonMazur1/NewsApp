//
//  NewsTableViewCellViewModel.swift
//  NewsTask
//
//  Created by Клоун on 20.10.2022.
//

import Foundation

protocol NewsTableViewCellViewModelProtocol {
    var articleImage: String { get }
    var articleTitle: String { get }
    var articleDescription: String { get }
    init(articleImage: String, articleTitle: String, articleDescription: String)
}

class NewsTableViewCellViewModel: NewsTableViewCellViewModelProtocol {
    var articleImage: String
    var articleTitle: String
    var articleDescription: String
    
    required init(articleImage: String, articleTitle: String, articleDescription: String) {
        self.articleImage = articleImage
        self.articleTitle = articleTitle
        self.articleDescription = articleDescription
    }
}

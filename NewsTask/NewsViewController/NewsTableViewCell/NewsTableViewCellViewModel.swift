//
//  NewsTableViewCellViewModel.swift
//  NewsTask
//
//  Created by Клоун on 20.10.2022.
//

import Foundation

protocol NewsTableViewCellViewModelProtocol {
    var newsImage: String { get }
    var newsTitle: String { get }
    var newsDescription: String { get }
    init(newsImage: String, newsTitle: String, newsDescription: String)
}

class NewsTableViewCellViewModel: NewsTableViewCellViewModelProtocol {
    var newsImage: String
    var newsTitle: String
    var newsDescription: String
    
    required init(newsImage: String, newsTitle: String, newsDescription: String) {
        self.newsImage = newsImage
        self.newsTitle = newsTitle
        self.newsDescription = newsDescription
    }
}

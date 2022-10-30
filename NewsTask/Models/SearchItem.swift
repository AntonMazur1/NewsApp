//
//  SearchItem.swift
//  NewsTask
//
//  Created by Клоун on 28.10.2022.
//

import Foundation

enum SearchItem: String {
    case title, description, content
}

enum SortItem: String {
    case publishDate, relevance
}

extension Array where Element == SearchItem {
    var queryValue: String {
        self.map { $0.rawValue }.joined(separator: ",")
    }
}

extension Array where Element == SortItem {
    var queryValue: String {
        self.map { $0.rawValue }.joined(separator: ",")
    }
}

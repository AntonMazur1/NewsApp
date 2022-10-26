//
//  SearchHistoryTableViewCellViewModel.swift
//  NewsTask
//
//  Created by Клоун on 25.10.2022.
//

import Foundation

protocol SearchHistoryTableViewCellViewModelProtocol {
    var searchHistoryTitle: String { get }
    init(searchHistoryTitle: String)
}

class SearchHistoryTableViewCellViewModel: SearchHistoryTableViewCellViewModelProtocol {
    var searchHistoryTitle: String
    
    required init(searchHistoryTitle: String) {
        self.searchHistoryTitle = searchHistoryTitle
    }
}

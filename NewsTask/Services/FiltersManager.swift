//
//  FiltersManager.swift
//  NewsTask
//
//  Created by Клоун on 28.10.2022.
//

import Foundation

enum UrlComponents: String {
    case token = "4386817b6ca6e8ed5e3cfcc28c95de71"
}

enum QueryKey: String {
    case `in`, from, to, q
}

class FiltersManager {
    static let shared = FiltersManager()
    
    private var searchItems: [SearchItem] = []
    private var searchText = ""
    private var filterItems: FilterItemsModel?
    
    private init() {}
    
    func add(filterItems: FilterItemsModel) {
        self.filterItems = filterItems
    }
    
    func getFilterItems() -> FilterItemsModel {
        filterItems ?? FilterItemsModel(to: "", from: "")
    }
    
    func searchText(value: String) {
        searchText = value
    }
    
    func getSearchText() -> String {
        searchText
    }
    
    func addNew(filters: [SearchItem]) {
        searchItems = filters
    }
    
    func getFilters() -> [SearchItem] {
        searchItems
    }
    
    func getQueryItems() -> [URLQueryItem] {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "q", value: searchText))
        queryItems.append(URLQueryItem(name: "token", value: UrlComponents.token.rawValue))
        queryItems.append(URLQueryItem(name: "in", value: searchItems.queryValue))
        queryItems.append(URLQueryItem(name: "from", value: filterItems?.from))
        queryItems.append(URLQueryItem(name: "to", value: filterItems?.to))
        return queryItems
    }
}

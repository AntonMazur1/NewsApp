//
//  QueryManager.swift
//  NewsTask
//
//  Created by Клоун on 28.10.2022.
//

import Foundation

class QueryManager {
    static let shared = QueryManager()
    
    var queryParameters: [URLQueryItem] = [URLQueryItem(name: "q", value: ""),
                                            URLQueryItem(name: "token", value: "12395210db6b63a8f4297702a3f9d301"),
                                            URLQueryItem(name: "in", value: "")]
    
    func changeKeyWord(with value: String) {
        queryParameters[0].value = value
    }
    
    func addNewQueries(values: [String]) {
        queryParameters[2].value = values.joined(separator: ",")
    }
    
    private init() {}
}

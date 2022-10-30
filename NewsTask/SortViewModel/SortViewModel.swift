//
//  SortViewModel.swift
//  NewsTask
//
//  Created by Клоун on 30.10.2022.
//

import Foundation

protocol SortViewModelProtocol {
    var sortItems: [SortItem] { get }
    func addNew(sortItems: [SortItem])
}

class SortViewModel: SortViewModelProtocol {
    var sortItems = FiltersManager.shared.getSortItems()
    
    func addNew(sortItems: [SortItem]) {
        FiltersManager.shared.addNew(sortItems: sortItems)
    }
}

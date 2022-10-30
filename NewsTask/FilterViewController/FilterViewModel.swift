//
//  FilterViewModel.swift
//  NewsTask
//
//  Created by Клоун on 26.10.2022.
//

import Foundation

protocol FilterViewModelProtocol {
    var chosenFilters: FilterItemsModel { get }
    func add(filterItems: FilterItemsModel)
}

class FilterViewModel: FilterViewModelProtocol {
    var chosenFilters = FiltersManager.shared.getFilterItems()
    
    func add(filterItems: FilterItemsModel) {
        FiltersManager.shared.add(filterItems: filterItems)
    }
}

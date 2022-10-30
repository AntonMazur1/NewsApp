//
//  FilterSelectorsViewModel.swift
//  NewsTask
//
//  Created by Клоун on 27.10.2022.
//

import Foundation

protocol FilterSelectorsViewModelProtocol {
    var chosenFilters: [SearchItem] { get }
    func addNewChosen(filters: [SearchItem])
}

class FilterSelectorsViewModel: FilterSelectorsViewModelProtocol {
    var chosenFilters = FiltersManager.shared.getFilters()
    
    func addNewChosen(filters: [SearchItem]) {
        FiltersManager.shared.addNew(filters: filters)
    }
}

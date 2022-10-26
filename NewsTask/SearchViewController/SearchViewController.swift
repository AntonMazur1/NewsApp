//
//  SearchViewController.swift
//  NewsTask
//
//  Created by Клоун on 23.10.2022.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchResultTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var navigationView: UIView!
    
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    private var viewModel: SearchViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SearchViewModel()
        
        searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.9879724383, green: 1, blue: 1, alpha: 1)
        
        navigationView.clipsToBounds = true
        navigationView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        navigationView.layer.cornerRadius = 30
        
        sortButton.clipsToBounds = true
        filterButton.clipsToBounds = true
        sortButton.layer.cornerRadius = sortButton.frame.height / 2
        filterButton.layer.cornerRadius = filterButton.frame.height / 2
        
        searchResultTableView.register(UINib(nibName: "SearchHistoryTableViewCell", bundle: nil), forCellReuseIdentifier: SearchHistoryTableViewCell.identifier)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.numberOfRows != 0 {
            return viewModel.numberOfRows
        } else {
            return viewModel.numberOfSearch
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.numberOfRows != 0 {
            let cell = searchResultTableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
            cell.viewModel = viewModel?.getNewsViewModel(at: indexPath)
            return cell
        } else {
            let cell = searchResultTableView.dequeueReusableCell(withIdentifier: SearchHistoryTableViewCell.identifier, for: indexPath) as! SearchHistoryTableViewCell
            cell.viewModel = viewModel.getSearchHistoryViewModel(at: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchResultTableView.deselectRow(at: indexPath, animated: true)
    }
}

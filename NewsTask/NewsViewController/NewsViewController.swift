//
//  NewsViewController.swift
//  NewsTask
//
//  Created by Клоун on 20.10.2022.
//

import UIKit

class NewsViewController: UIViewController {
    @IBOutlet weak var newsTableView: UITableView!
    
    private let viewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarAndTabBar()
        loadNewsFromServer()
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: NewsTableViewCell.identifier)
    }
    
    private func loadNewsFromServer() {
        viewModel.loadNews { [weak self] in
            DispatchQueue.main.async {
                self?.newsTableView.reloadData()
            }
        }
    }
    
    private func setupNavigationBarAndTabBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.orange]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.roundCourners(corners: [.bottomLeft, .bottomRight], radius: 20)
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "Logo"))
        
        tabBarController?.tabBar.backgroundColor = .white
        tabBarController?.tabBar.tintColor = .orange
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
        cell.viewModel = viewModel.getNewsCellViewModel(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newsTableView.deselectRow(at: indexPath, animated: true)
    }
}


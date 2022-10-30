//
//  NewsViewController.swift
//  NewsTask
//
//  Created by Клоун on 20.10.2022.
//

import UIKit

class NewsViewController: UIViewController {
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var navigationView: UIView!
    
    private let viewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        loadNewsFromServer()
        
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: NewsTableViewCell.identifier)
        
        navigationView.roundCourners(view: navigationView, corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 30)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let webViewVC = segue.destination as? WebViewViewController else { return }
        webViewVC.viewModel = sender as? WebViewViewModel
    }
    
    private func loadNewsFromServer() {
        viewModel.loadNews { [weak self] in
            DispatchQueue.main.async {
                self?.newsTableView.reloadData()
            }
        }
    }
    
    private func setupTabBar() {
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
        let webViewViewModel = viewModel.getWebViewViewModel(at: indexPath)
        performSegue(withIdentifier: "showWebView", sender: webViewViewModel)
        newsTableView.deselectRow(at: indexPath, animated: true)
    }
}


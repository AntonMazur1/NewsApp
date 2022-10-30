//
//  FilterSelectorsViewController.swift
//  NewsTask
//
//  Created by Клоун on 27.10.2022.
//

import UIKit

class FilterSelectorsViewController: UIViewController {
    @IBOutlet weak var titleSwitch: UISwitch!
    @IBOutlet weak var descriptionSwitch: UISwitch!
    @IBOutlet weak var contentSwitch: UISwitch!
    
    private var viewModel: FilterSelectorsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = FilterSelectorsViewModel()
        
        setupSwitch()
        setupNavigationBar()
    }
    
    private func setupSwitch() {
        let values = viewModel.chosenFilters
        
        titleSwitch.setOn(values.contains(.title), animated: false)
        descriptionSwitch.setOn(values.contains(.description), animated: false)
        contentSwitch.setOn(values.contains(.content), animated: false)
    }
    
    @IBAction func applyFilters() {
        var searchInValues: [SearchItem] = []
        
        if titleSwitch.isOn {
            searchInValues.append(.title)
        }
        
        if descriptionSwitch.isOn {
            searchInValues.append(.description)
        }
        
        if contentSwitch.isOn {
            searchInValues.append(.content)
        }
        
        viewModel.addNewChosen(filters: searchInValues)
        dismiss(animated: true)
    }
    
    private func setupNavigationBar() {
        navigationItem.titleView = UIImageView(image: UIImage(named: "Logo"))
        
        let clearButton = UIButton(type: .system)
        clearButton.setImage(UIImage(named: "Union"), for: .normal)
        clearButton.setTitle("Clear", for: .normal)
        clearButton.sizeToFit()
        clearButton.addTarget(self, action: #selector(clearParameters), for: .touchUpInside)

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: clearButton)
    }
    
    @objc private func clearParameters() {
        titleSwitch.setOn(false, animated: true)
        descriptionSwitch.setOn(false, animated: true)
        contentSwitch.setOn(false, animated: true)
    }
}

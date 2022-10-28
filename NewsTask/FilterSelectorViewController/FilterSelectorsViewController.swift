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
    
    private var quieries: [String: String] = [:]
    override func viewDidLoad() {
        
    }
    
    
    @IBAction func applyFilters() {
        if titleSwitch.isOn {
            quieries["Title"] = "title"
        } else {
            quieries["Title"] = nil
        }
        
        if descriptionSwitch.isOn {
            quieries["Description"] = "description"
        } else {
            quieries["Description"] = nil
        }
        
        if contentSwitch.isOn {
            quieries["Content"] = "content"
        } else {
            quieries["Content"] = nil
        }
        
        QueryManager.shared.addNewQueries(values: Array(quieries.values))
        dismiss(animated: true)
    }
}

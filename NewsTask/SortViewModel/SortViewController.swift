//
//  SortViewController.swift
//  NewsTask
//
//  Created by Клоун on 29.10.2022.
//

import UIKit

class SortViewController: UIViewController {
    @IBOutlet weak var publishDate: UIButton!
    @IBOutlet weak var relevanceButton: UIButton!
    
    override var sheetPresentationController: UISheetPresentationController? {
        presentationController as? UISheetPresentationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sheetPresentationConfigure()
        setupButton()
    }

    @IBAction func publishedDatePressed(_ sender: UIButton) {
        var searchInValues: [SortItem] = []
        
        if sender.currentImage == UIImage(named: "FilterOff") {
            sender.setImage(UIImage(named: "FilterOn"), for: .normal)
            searchInValues.append(.publishDate)
        } else {
            sender.setImage(UIImage(named: "FilterOff"), for: .normal)
        }
        
        FiltersManager.shared.addNew(sortItems: searchInValues)
    }
    
    @IBAction func relevancePressed(_ sender: UIButton) {
        var searchInValues: [SortItem] = []
        
        if sender.currentImage == UIImage(named: "FilterOff") {
            sender.setImage(UIImage(named: "FilterOn"), for: .normal)
            searchInValues.append(.relevance)
        } else {
            sender.setImage(UIImage(named: "FilterOff"), for: .normal)
        }
        
        FiltersManager.shared.addNew(sortItems: searchInValues)
    }
    
    private func setupButton() {
        let values = FiltersManager.shared.getSortItems()
        if values.contains(.publishDate) {
            publishDate.setImage(UIImage(named: "FilterOn"), for: .normal)
        }
        
        if values.contains(.relevance) {
            relevanceButton.setImage(UIImage(named: "FilterOn"), for: .normal)
        }
    }
    
    private func sheetPresentationConfigure() {
        sheetPresentationController?.delegate = self
        sheetPresentationController?.selectedDetentIdentifier = .medium
        sheetPresentationController?.prefersGrabberVisible = true
        sheetPresentationController?.detents = [.custom(resolver: { context in
            0.25 * context.maximumDetentValue
        })]
    }
}

//MARK: - UISheetPresentationControllerDelegate
extension SortViewController: UISheetPresentationControllerDelegate {
    
}

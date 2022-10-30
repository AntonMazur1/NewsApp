//
//  SortViewController.swift
//  NewsTask
//
//  Created by Клоун on 29.10.2022.
//

import UIKit

class SortViewController: UIViewController, UISheetPresentationControllerDelegate {
    @IBOutlet weak var publishDateButton: UIButton!
    @IBOutlet weak var relevanceButton: UIButton!
    
    private var viewModel: SortViewModelProtocol!
    
    override var sheetPresentationController: UISheetPresentationController? {
        presentationController as? UISheetPresentationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SortViewModel()
        
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
        
        viewModel.addNew(sortItems: searchInValues)
    }
    
    @IBAction func relevancePressed(_ sender: UIButton) {
        var searchInValues: [SortItem] = []
        
        if sender.currentImage == UIImage(named: "FilterOff") {
            sender.setImage(UIImage(named: "FilterOn"), for: .normal)
            searchInValues.append(.relevance)
        } else {
            sender.setImage(UIImage(named: "FilterOff"), for: .normal)
        }
        
        viewModel.addNew(sortItems: searchInValues)
    }
    
    private func setupButton() {
        let values = viewModel.sortItems
        
        if values.contains(.publishDate) {
            publishDateButton.setImage(UIImage(named: "FilterOn"), for: .normal)
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

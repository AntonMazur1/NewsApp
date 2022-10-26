//
//  SearchHistoryTableViewCell.swift
//  NewsTask
//
//  Created by Клоун on 24.10.2022.
//

import UIKit

class SearchHistoryTableViewCell: UITableViewCell {
    static let identifier = "searchCell"
    
    @IBOutlet weak var searchHistoryLabel: UILabel!
    
    var viewModel: SearchHistoryTableViewCellViewModelProtocol! {
        didSet {
            searchHistoryLabel.text = viewModel.searchHistoryTitle
        }
    }
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set(newFrame) {
            var frame = newFrame
            frame.origin.y += 4
            frame.size.height -= 1
            super.frame = frame
        }
    }
}

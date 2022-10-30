//
//  NewsTableViewCell.swift
//  NewsTask
//
//  Created by Клоун on 20.10.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    static let identifier = "NewsCell"
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    
    var viewModel: NewsTableViewCellViewModelProtocol! {
        didSet {
            newsImage.loadImageFrom(urlString: viewModel.articleImage)
            newsTitle.text = viewModel.articleTitle
            newsDescription.text = viewModel.articleDescription
        }
    }
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set(newFrame) {
            var frame = newFrame
            frame.origin.y += 4
            frame.size.height -= 2 * 5
            super.frame = frame
        }
    }
}

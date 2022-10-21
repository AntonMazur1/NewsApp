//
//  ImageManager.swift
//  NewsTask
//
//  Created by Клоун on 20.10.2022.
//

import UIKit

extension UIImageView {
    func getImageFrom(url: String) {
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: url) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}

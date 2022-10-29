//
//  ImageManager.swift
//  NewsTask
//
//  Created by Клоун on 20.10.2022.
//

import UIKit

var imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadImageFrom(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data,
                  error == nil else { return }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }
        }.resume()
    }
}

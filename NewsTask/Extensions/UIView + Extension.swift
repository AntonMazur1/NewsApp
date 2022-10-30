//
//  UINavigationBar + Extension.swift
//  NewsTask
//
//  Created by Клоун on 21.10.2022.
//

import UIKit

extension UIView {
    func roundCourners(view: UIView, corners: CACornerMask, radius: CGFloat) {
        view.layer.cornerRadius = radius
        view.layer.maskedCorners = corners
    }
}

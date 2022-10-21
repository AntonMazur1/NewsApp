//
//  UINavigationBar + Extension.swift
//  NewsTask
//
//  Created by Клоун on 21.10.2022.
//

import UIKit

extension UINavigationBar {
    func roundCourners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

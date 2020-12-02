//
//  UIView+arrangedSubviews.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/12/1.
//

import UIKit
extension UIView {
    func addSubviews(_ arrangedSubviews: [UIView]) {
        for view in arrangedSubviews {
            addSubview(view)
        }
    }
}

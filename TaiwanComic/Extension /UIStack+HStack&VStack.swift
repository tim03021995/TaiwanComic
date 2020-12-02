//
//  UIStack+HStack&VStack.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/12/1.
//

import UIKit

extension UIStackView {
    func VStack() {
        axis = .vertical
        spacing = 6
        distribution = .fillEqually
        alignment = .fill
        isUserInteractionEnabled = true
    }

    func HStack() {
        axis = .horizontal
        spacing = 6
        distribution = .fillEqually
        alignment = .fill
        isUserInteractionEnabled = true
    }
}

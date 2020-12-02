//
//  MidifyPasswordVC.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/25.
//

import UIKit

class MidifyPasswordVC: UIViewController {
    let midifyPasswordView = MidifyPasswordView()
    override func loadView() {
        view = midifyPasswordView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MidifyPasswordVC: MidifyPasswordViewDelegate {
    func confirmBtn() {
        print(#function)
    }
}

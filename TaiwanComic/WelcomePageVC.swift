//
//  ContentView.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/24.
//
import UIKit

class WelcomePageVC: UIViewController {
    let welcomePageView = WelcomePageView()
    override func loadView() {
        view = welcomePageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

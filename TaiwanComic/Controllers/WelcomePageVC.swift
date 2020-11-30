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

    @objc func tapLoginButton() {
        print(#function)
        let vc = LoginPageVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    @objc func tapSignUpButton() {
        print(#function)
        let vc = SignupVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

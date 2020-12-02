//
//  LoginPageVC.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/26.
//

import UIKit

class LoginPageVC: UIViewController {
    var loginPageView = LoginPageView()
    override func loadView() {
        view = loginPageView
        loginPageView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension LoginPageVC: LoginPageViewDelegate {
    func tapSignupBtn() {
        print(#function)
        let vc = SignupVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    func tapCheckBox() {
        print(#function)
    }

    func tapforgetPasswordBtn() {
        print(#function)
    }

    func tapSocialloginBtn(type _: SocialLoginType) {
        print(#function)
    }

    func tapLoginButton() {
        print(#function)
    }
}

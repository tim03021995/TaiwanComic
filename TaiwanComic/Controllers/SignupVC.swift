//
//  SignupVC.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/30.
//

import UIKit

class SignupVC: UIViewController {
    var signupView = SignupView()
    override func loadView() {
        view = signupView
        signupView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension SignupVC: SignupViewDelegate {
    func tapLoginButton() {
        print(#function)
        let vc = LoginPageVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    func send() {
        print(#function)
    }

    func tapCheckBox() {
        print(#function)
    }

    func tapSignupBtn() {
        print(#function)
    }

    func tapSocialloginBtn(type _: SocialLoginType) {
        print(#function)
    }
}

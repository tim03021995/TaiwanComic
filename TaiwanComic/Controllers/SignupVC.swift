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
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @objc func tapFacebookBtn() {
        print(#function)
    }

    @objc func tapGoogleBtn() {
        print(#function)
    }

    @objc func tapAppleBtn() {
        print(#function)
    }

    @objc func tapLoginBtn() {
        print(#function)
        let vc = LoginPageVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    @objc func tapCheckBox() {
        print(#function)
        signupView.checkBox.button.isSelected = !signupView.checkBox.button.isSelected
    }

    @objc func tapforgetPasswordBtn() {
        print(#function)
    }

    @objc func tapPasswordEyeBtn() {
        signupView.passWordInputBox.textField.isSecureTextEntry = !signupView.passWordInputBox.textField.isSecureTextEntry
        signupView.passWordInputBox.textField.eyesButton.isSelected = !signupView.passWordInputBox.textField.eyesButton.isSelected
    }

    @objc func tapCheckPasswordEyeBtn() {
        signupView.passWordInputBox.textField.isSecureTextEntry = !signupView.passWordInputBox.textField.isSecureTextEntry
        signupView.passWordInputBox.textField.eyesButton.isSelected = !signupView.passWordInputBox.textField.eyesButton.isSelected
    }

    @objc func send() {
        print(#function)
    }

    @objc func tapSignupBtn() {
        print(#function)
    }
}

//
//  LoginPageView.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/26.
//

import SnapKit
import UIKit
protocol LoginPageViewDelegate {
    func tapSignupBtn()
    func tapSocialloginBtn(type: SocialLoginType)
    func tapCheckBox()
    func tapforgetPasswordBtn()
    func tapLoginButton()
}

class LoginPageView: UIView {
    var delegate: LoginPageViewDelegate!
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "登入"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.isUserInteractionEnabled = true
        return label
    }()

    var signUpButton: Button = {
        var button = Button(buttonStyle: .ghost, text: "註冊")
        button.addTarget(self, action: #selector(tapSignupBtn), for: .touchUpInside)
        return button
    }()

    var midifyPasswordButton: Button = {
        var button = Button(buttonStyle: .ghost, text: "忘記密碼？")
        button.addTarget(self, action: #selector(tapforgetPasswordBtn), for: .touchUpInside)
        return button
    }()

    var facebookButton: socialLoginButton {
        let button = socialLoginButton(buttonType: .faceBook)
        button.addTarget(self, action: #selector(tapSocialloginBtn), for: .touchUpInside)
        return button
    }

    var googleButton: socialLoginButton {
        let button = socialLoginButton(buttonType: .google)
        button.addTarget(self, action: #selector(tapSocialloginBtn), for: .touchUpInside)
        return button
    }

    var appleButton: socialLoginButton {
        let button = socialLoginButton(buttonType: .apple)
        button.addTarget(self, action: #selector(tapSocialloginBtn), for: .touchUpInside)
        return button
    }

    lazy var iconStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [facebookButton, googleButton, appleButton])
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.isUserInteractionEnabled = true
        return stackView
    }()

    var accountInputBox: InputBox = {
        var inputBox = InputBox(text: "帳號")
        return inputBox
    }()

    var passWordInputBox: InputBox = {
        var inputBox = InputBox(text: "密碼")
        inputBox.textField.eyesButton.isHidden = false
        inputBox.textField.isSecureTextEntry = true
        return inputBox
    }()

    lazy var inputBoxStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [accountInputBox, passWordInputBox])
        stack.VStack()
        return stack
    }()

    var separatorView: UIView = {
        var separatorView = UIView()
        var separator = UIView()
        var label = UILabel()
        separator.backgroundColor = .subtext2Color
        label.text = "或"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .subtext2Color
        label.backgroundColor = .white
        separatorView.addSubview(separator)
        separatorView.addSubview(label)
        separator.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview()
            maker.centerY.equalToSuperview()
            maker.height.equalTo(1)
        }
        label.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.width.equalTo(46)
            maker.height.equalToSuperview()
        }
        return separatorView
    }()

    var checkBox: CheckBox = {
        var checkBox = CheckBox()
        checkBox.label.text = "記住我"
        checkBox.button.addTarget(self, action: #selector(tapCheckBox), for: .touchUpInside)
        checkBox.button.isSelected = true
        return checkBox
    }()

    var loginButton: UIButton = {
        var button = Button(buttonStyle: .fill, text: "登入")
        button.addTarget(self, action: #selector(taploginBtn), for: .touchUpInside)
        return button
    }()

    // MARK: - init()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubview()
        setConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - setSubview()

    private func setSubview() {
        let views = [titleLabel, iconStackView, separatorView, inputBoxStack, checkBox, loginButton, midifyPasswordButton]
        addSubviews(views)
        titleLabel.addSubview(signUpButton)
        backgroundColor = .white
    }

    // MARK: - setConstraints()

    private func setConstraints() {
        let edgePaddingX = 16
        let edgePaddingY = 24
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalTo(snp.topMargin).offset(edgePaddingY)
            maker.leading.equalTo(edgePaddingX)
            maker.trailing.equalTo(-edgePaddingX)
            maker.height.equalTo(35)
        }
        signUpButton.snp.makeConstraints { maker in
            maker.trailing.bottom.equalToSuperview()
            maker.height.equalTo(22)
            maker.width.equalTo(32)
        }
        iconStackView.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel.snp.bottom).offset(36)
            maker.leading.equalTo(edgePaddingX)
            maker.trailing.equalTo(-edgePaddingX)
            maker.height.equalTo(36)
        }
        separatorView.snp.makeConstraints { maker in
            maker.top.equalTo(iconStackView.snp.bottom).offset(edgePaddingY)
            maker.leading.equalTo(edgePaddingX)
            maker.trailing.equalTo(-edgePaddingX)
            maker.height.equalTo(20)
        }
        inputBoxStack.snp.makeConstraints { maker in
            maker.top.equalTo(separatorView.snp.bottom).offset(edgePaddingY)
            maker.leading.equalTo(edgePaddingX)
            maker.trailing.equalTo(-edgePaddingX)
        }
        checkBox.snp.makeConstraints { maker in
            maker.top.equalTo(passWordInputBox.snp.bottom).offset(edgePaddingY)
            maker.leading.equalToSuperview().offset(edgePaddingY)
        }
        midifyPasswordButton.snp.makeConstraints { maker in
            maker.top.bottom.equalTo(checkBox)
            maker.trailing.equalTo(-edgePaddingX)
        }
        loginButton.snp.makeConstraints { maker in
            maker.top.equalTo(checkBox.snp.bottom).offset(60)
            maker.leading.equalTo(edgePaddingX)
            maker.trailing.equalTo(-edgePaddingX)
        }
    }

    override func touchesBegan(_: Set<UITouch>, with _: UIEvent?) {
        endEditing(true)
    }

    @objc func tapSignupBtn() {
        delegate.tapSignupBtn()
    }

    @objc func tapSocialloginBtn(_ sender: socialLoginButton) {
        delegate.tapSocialloginBtn(type: sender.type!)
    }

    @objc func tapCheckBox() {
        print(#function)
        checkBox.button.isSelected = !checkBox.button.isSelected
        delegate.tapCheckBox()
    }

    @objc func tapforgetPasswordBtn() {
        print(#function)
        delegate.tapforgetPasswordBtn()
    }

    @objc func taploginBtn() {
        print(#function)
        delegate.tapLoginButton()
    }
}

//
//  LoginPageView.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/26.
//

import SnapKit
import UIKit

protocol SignupViewDelegate {
    func tapLoginButton()
    func tapSocialloginBtn(type: SocialLoginType)
    func send()
    func tapCheckBox()
    func tapSignupBtn()
}

class SignupView: UIView, UIScrollViewDelegate {
    var delegate: SignupViewDelegate!
    lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.delegate = self
        return scrollView
    }()

    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "註冊"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.isUserInteractionEnabled = true
        label.addSubview(loginButton)
        return label
    }()

    lazy var loginButton: Button = {
        var button = Button(buttonStyle: .ghost, text: "登入")
        button.addTarget(self, action: #selector(tapLoginBtn), for: .touchUpInside)
        return button
    }()

    var facebookButton: socialLoginButton {
        let button = socialLoginButton(buttonType: .faceBook)
        button.addTarget(self, action: #selector(tapSocialloginBtn(_:)), for: .touchUpInside)
        return button
    }

    var googleButton: socialLoginButton {
        let button = socialLoginButton(buttonType: .google)
        button.addTarget(self, action: #selector(tapSocialloginBtn(_:)), for: .touchUpInside)
        return button
    }

    var appleButton: socialLoginButton {
        let button = socialLoginButton(buttonType: .apple)
        button.addTarget(self, action: #selector(tapSocialloginBtn(_:)), for: .touchUpInside)
        return button
    }

    lazy var iconStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [facebookButton, googleButton, appleButton])
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.isUserInteractionEnabled = true
        stackView.snp.makeConstraints { maker in
            maker.height.equalTo(36)
        }
        return stackView
    }()

    var accountInputBox: InputBox = {
        var inputBox = InputBox()
        inputBox.label.text = "帳號"
        inputBox.textField.placeholder = "帳號"
        inputBox.textField.isSecureTextEntry = true

        return inputBox
    }()

    var passWordInputBox: InputBox = {
        var inputBox = InputBox(text: "密碼")
        inputBox.textField.eyesButton.isHidden = false
        inputBox.textField.isSecureTextEntry = true
        return inputBox
    }()

    var checkPassWordInputBox: InputBox = {
        var inputBox = InputBox(title: "確認密碼", placeholder: "再次輸入密碼")
        inputBox.textField.eyesButton.isHidden = false
        inputBox.textField.isSecureTextEntry = true
        return inputBox
    }()

    var EmailInputBox: InputBox = {
        var inputBox = InputBox(text: "Email")
        inputBox.textField.isSecureTextEntry = true

        return inputBox
    }()

    var phoneInputBox: InputBox = {
        var inputBox = InputBox(text: "手機")
        inputBox.textField.isSecureTextEntry = true

        return inputBox
    }()

    lazy var sendButton: Button = {
        var button = Button(buttonStyle: .outline, text: "發送驗證碼")
        button.addTarget(self, action: #selector(send), for: .touchUpInside)
        return button
    }()

    lazy var HStack: UIView = {
        let HStack = UIView()
        HStack.addSubview(phoneInputBox)
        HStack.addSubview(sendButton)
        phoneInputBox.snp.makeConstraints { maker in
            maker.top.leading.bottom.equalToSuperview()
            maker.width.equalTo(193)
        }
        sendButton.snp.makeConstraints { maker in
            maker.top.bottom.equalTo(phoneInputBox.textField)
            maker.leading.equalTo(phoneInputBox.snp.trailing).offset(8)
            maker.trailing.equalToSuperview()
            maker.width.equalTo(142)
        }
        return HStack
    }()

    var checkInputBox: InputBox = {
        var inputBox = InputBox(text: "簡訊驗證碼")
        inputBox.textField.isSecureTextEntry = true

        return inputBox
    }()

    lazy var VStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, iconStackView, separatorView, accountInputBox, passWordInputBox, checkPassWordInputBox, EmailInputBox, HStack, checkInputBox, checkBox, signupButton])
        stackView.VStack()
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = edgePaddingY
        return stackView
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
            maker.height.equalTo(20)
        }
        return separatorView
    }()

    lazy var checkBox: CheckBox = {
        var checkBox = CheckBox()
        let attributedString = NSMutableAttributedString(string: "同意 使用政策 及 條款", attributes: [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor(red: 100.0 / 255.0, green: 193.0 / 255.0, blue: 190.0 / 255.0, alpha: 1.0),
        ])
        attributedString.addAttributes([
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor(white: 34.0 / 255.0, alpha: 1.0),
        ], range: NSRange(location: 0, length: 2))
        attributedString.addAttributes([
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor(white: 34.0 / 255.0, alpha: 1.0),
        ], range: NSRange(location: 8, length: 1))

        checkBox.label.attributedText = attributedString
        checkBox.button.addTarget(self, action: #selector(tapCheckBox), for: .touchUpInside)
        return checkBox
    }()

    lazy var signupButton: UIButton = {
        var button = Button(buttonStyle: .fill, text: "註冊")
        button.addTarget(self, action: #selector(tapSignupBtn), for: .touchUpInside)
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

    func setSubview() {
        scrollView.addSubview(VStack)
        addSubview(scrollView)
        backgroundColor = .white
    }

    // MARK: - setConstraints()

    func setConstraints() {
        scrollView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        loginButton.snp.makeConstraints { maker in
            maker.trailing.bottom.equalToSuperview()
            maker.height.equalTo(22)
            maker.width.equalTo(32)
        }
        VStack.snp.makeConstraints { maker in
            maker.leading.equalTo(self).offset(edgePaddingX)
            maker.trailing.equalTo(self).offset(-edgePaddingX)
            maker.top.equalToSuperview().offset(edgePaddingY * 2)
            maker.bottom.equalToSuperview().offset(-36)
        }
        checkBox.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.size.equalTo(CGSize(width: 159, height: 18))
        }
    }

    func scrollViewWillBeginDragging(_: UIScrollView) {
        endEditing(true)
    }

    @objc func tapSocialloginBtn(_ sender: socialLoginButton) {
        delegate.tapSocialloginBtn(type: sender.type!)
    }

    @objc func tapLoginBtn() {
        delegate.tapLoginButton()
    }

    @objc func tapCheckBox() {
        checkBox.button.isSelected = !checkBox.button.isSelected
        delegate.tapCheckBox()
    }

    @objc func send() {
        delegate.send()
    }

    @objc func tapSignupBtn() {
        delegate.tapSignupBtn()
    }
}

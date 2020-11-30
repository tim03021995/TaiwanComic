//
//  LoginPageView.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/26.
//

import SnapKit
import UIKit

class SignupView: UIView {
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "註冊"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.isUserInteractionEnabled = true
        return label
    }()

    var loginButton: Button = {
        var button = Button(buttonStyle: .ghost)
        button.setTitle("登入", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(nil, action: #selector(SignupVC.tapLoginBtn), for: .touchUpInside)
        return button
    }()

    var midifyPasswordButton: Button = {
        var button = Button(buttonStyle: .ghost)
        button.setTitle("忘記密碼？", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(nil, action: #selector(SignupVC.tapforgetPasswordBtn), for: .touchUpInside)
        return button
    }()

    var facebookButton: Imagebutton {
        let button = Imagebutton(buttonStyle: .faceBook)
        button.addTarget(nil, action: #selector(SignupVC.tapFacebookBtn), for: .touchUpInside)
        return button
    }

    var googleButton: Imagebutton {
        let button = Imagebutton(buttonStyle: .google)
        button.addTarget(nil, action: #selector(SignupVC.tapGoogleBtn), for: .touchUpInside)
        return button
    }

    var appleButton: Imagebutton {
        let button = Imagebutton(buttonStyle: .apple)
        button.addTarget(nil, action: #selector(SignupVC.tapAppleBtn), for: .touchUpInside)
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
        var inputBox = InputBox()
        inputBox.label.text = "帳號"
        inputBox.textField.placeholder = "帳號"
        inputBox.textField.isSecureTextEntry = true

        return inputBox
    }()

    var passWordInputBox: InputBox = {
        var inputBox = InputBox()
        inputBox.label.text = "密碼"
        inputBox.textField.placeholder = "密碼"
        inputBox.textField.eyesButton.isHidden = false
        inputBox.textField.isSecureTextEntry = true
        inputBox.textField.eyesButton.addTarget(nil, action: #selector(SignupVC.tapPasswordEyeBtn), for: .touchUpInside)
        return inputBox
    }()

    var checkPassWordInputBox: InputBox = {
        var inputBox = InputBox()
        inputBox.label.text = "確認密碼"
        inputBox.textField.placeholder = "再次輸入密碼"
        inputBox.textField.eyesButton.isHidden = false
        inputBox.textField.isSecureTextEntry = true
        inputBox.textField.eyesButton.addTarget(nil, action: #selector(SignupVC.tapPasswordEyeBtn), for: .touchUpInside)
        return inputBox
    }()

    var EmailInputBox: InputBox = {
        var inputBox = InputBox()
        inputBox.label.text = "Email"
        inputBox.textField.placeholder = "Email"
        inputBox.textField.isSecureTextEntry = true

        return inputBox
    }()

    var phoneInputBox: InputBox = {
        var inputBox = InputBox()
        inputBox.label.text = "手機"
        inputBox.textField.placeholder = "手機"
        inputBox.textField.isSecureTextEntry = true

        return inputBox
    }()

    var sendButton: Button = {
        var button = Button(buttonStyle: .outline)
        button.setTitle("發送驗證碼", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(nil, action: #selector(SignupVC.send), for: .touchUpInside)
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
        }
        return HStack
    }()

    var checkInputBox: InputBox = {
        var inputBox = InputBox()
        inputBox.label.text = "簡訊驗證碼"
        inputBox.textField.placeholder = "簡訊驗證碼"
        inputBox.textField.isSecureTextEntry = true

        return inputBox
    }()

    lazy var VStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [accountInputBox, passWordInputBox, checkPassWordInputBox, EmailInputBox, HStack, checkInputBox])
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.isUserInteractionEnabled = true
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
            maker.height.equalToSuperview()
        }
        return separatorView
    }()

    var checkBox: CheckBox = {
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
        checkBox.button.addTarget(self, action: #selector(LoginPageVC.tapCheckBox), for: .touchUpInside)
        checkBox.button.isSelected = true
        return checkBox
    }()

    var signupButton: UIButton = {
        var button = Button(buttonStyle: .fill)
        button.setTitle("註冊", for: .normal)
        button.addTarget(nil, action: #selector(LoginPageVC.taploginBtn), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.addSubview(loginButton)
        addSubview(iconStackView)
        addSubview(separatorView)
        addSubview(VStack)
        addSubview(checkBox)
        addSubview(midifyPasswordButton)
        addSubview(signupButton)
        setConstraints()
    }

    func setConstraints() {
        let edgePaddingX = 16
        let edgePaddingY = 24
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalTo(snp.topMargin).offset(edgePaddingY)
            maker.leading.equalTo(edgePaddingX)
            maker.trailing.equalTo(-edgePaddingX)
            maker.height.equalTo(35)
        }
        loginButton.snp.makeConstraints { maker in
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
        VStack.snp.makeConstraints { maker in
            maker.top.equalTo(separatorView.snp.bottom).offset(edgePaddingY)
            maker.leading.equalTo(edgePaddingX)
            maker.trailing.equalTo(-edgePaddingX)
        }
        checkBox.snp.makeConstraints { maker in
            maker.top.equalTo(VStack.snp.bottom).offset(edgePaddingY)
            maker.leading.equalToSuperview().offset(edgePaddingY)
        }
        midifyPasswordButton.snp.makeConstraints { maker in
            maker.top.bottom.equalTo(checkBox)
            maker.trailing.equalTo(-edgePaddingX)
        }
        signupButton.snp.makeConstraints { maker in
            maker.top.equalTo(checkBox.snp.bottom).offset(60)
            maker.leading.equalTo(edgePaddingX)
            maker.trailing.equalTo(-edgePaddingX)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

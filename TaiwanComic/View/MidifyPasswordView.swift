//
//  MidifyPasswordView.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/25.
//

import SnapKit
import UIKit
protocol MidifyPasswordViewDelegate {
    func confirmBtn()
}

class MidifyPasswordView: UIView {
    var delegate: MidifyPasswordViewDelegate!
    var someBool = false
    var heightConstraint: Constraint?

    lazy var newPassword: InputBox = {
        var inputBox = InputBox(text: "新密碼")
        inputBox.textField.eyesButton.isHidden = false
        inputBox.textField.isSecureTextEntry = true
        return inputBox
    }()

    lazy var confirmPassword: InputBox = {
        var inputBox = InputBox(title: "確認密碼", placeholder: "再次輸入新密碼")
        inputBox.textField.eyesButton.isHidden = false
        inputBox.textField.isSecureTextEntry = true
        return inputBox
    }()

    lazy var buttonFill: UIButton = {
        var button = Button(buttonStyle: .fill, text: "確認修改")
        button.addTarget(self, action: #selector(confirmBtn), for: .touchUpInside)
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
        addSubview(newPassword)
        addSubview(confirmPassword)
        addSubview(buttonFill)
    }

    // MARK: - setConstraints()

    func setConstraints() {
        newPassword.snp.makeConstraints { maker in
            maker.top.equalTo(snp.topMargin).offset(100)
            maker.leading.equalTo(16)
            maker.trailing.equalTo(-16)
        }
        confirmPassword.snp.makeConstraints { maker in
            maker.top.equalTo(newPassword.snp.bottom).offset(10)
            maker.leading.equalTo(16)
            maker.trailing.equalTo(-16)
        }
        buttonFill.snp.makeConstraints { maker in
            maker.top.equalTo(confirmPassword.snp.bottom).offset(60)
            maker.leading.equalTo(16)
            maker.trailing.equalTo(-16)
        }
    }

    @objc func confirmBtn() {
        delegate.confirmBtn()
    }
}

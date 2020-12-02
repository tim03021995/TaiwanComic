//
//  WelcomePageView.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/25.
//

import SnapKit
import UIKit
let screenHeight = UIScreen.main.bounds.height
let screenWidth = UIScreen.main.bounds.width
protocol WelcomePageViewDelegate {
    func tapLoginButton()
    func tapSignUpButton()
}

class WelcomePageView: UIView {
    var delegate: WelcomePageVC!
    private var logoImageView: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "logoTcbHeader"))
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()

    private lazy var loginButton: UIButton = {
        var button = Button(buttonStyle: .fill, text: "立即登入")
        button.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)
        return button
    }()

    private lazy var signinButton: UIButton = {
        var button = Button(buttonStyle: .outline, text: "還不是會員？前往註冊")
        button.addTarget(self, action: #selector(tapSignUpButton), for: .touchUpInside)
        return button
    }()

    private lazy var buttonVStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [loginButton, signinButton])
        stack.VStack()
        stack.spacing = 36
        return stack
    }()

    // MARK: - init()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubview()
        setConstraints()
    }

    // MARK: - setSubview()

    private func setSubview() {
        addSubview(logoImageView)
        addSubview(buttonVStack)
    }

    // MARK: - setConstraints()

    private func setConstraints() {
        logoImageView.snp.makeConstraints { maker in
            maker.top.equalTo(snp.topMargin).offset(screenHeight * 0.31)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(screenWidth * 0.53)
            maker.height.equalTo(logoImageView.snp.width).multipliedBy(0.42)
        }
        buttonVStack.snp.makeConstraints { maker in
            maker.left.equalTo(edgePaddingY)
            maker.right.equalTo(-edgePaddingY)
            maker.bottom.equalTo(-60)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func tapLoginButton() {
        delegate.tapLoginButton()
    }

    @objc func tapSignUpButton() {
        delegate.tapSignUpButton()
    }
}

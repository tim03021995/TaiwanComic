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
class WelcomePageView: UIView {
    var logoImageView: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "logoTcbHeader"))
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()

    var buttonFill: UIButton = {
        var button = Button(buttonStyle: .fill)
        button.setTitle("立即登入", for: .normal)
        button.addTarget(nil, action: #selector(WelcomePageVC.tapLoginButton), for: .touchUpInside)
        return button
    }()

    var buttonOutline: UIButton = {
        var button = Button(buttonStyle: .outline)
        button.setTitle("還不是會員？前往註冊", for: .normal)
        button.addTarget(nil, action: #selector(WelcomePageVC.tapSignUpButton), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(logoImageView)
        addSubview(buttonFill)
        addSubview(buttonOutline)
        setConstraints()
    }

    func setConstraints() {
        logoImageView.snp.makeConstraints { maker in
            maker.top.equalTo(snp.topMargin).offset(screenHeight * 0.31)
            maker.centerX.equalToSuperview()
//            maker.height.equalTo(screenHeight * 0.12)
            maker.width.equalTo(screenWidth * 0.53)
            maker.height.equalTo(logoImageView.snp.width).multipliedBy(0.42)
        }
        buttonFill.snp.makeConstraints { maker in
            maker.top.equalTo(logoImageView.snp.bottom).offset(screenHeight * 0.31)
            maker.centerX.equalToSuperview()
            maker.width.equalToSuperview().multipliedBy(0.9)
            maker.height.equalTo(buttonFill.snp.width).multipliedBy(0.104)
        }
        buttonOutline.snp.makeConstraints { maker in
            maker.top.equalTo(buttonFill.snp.bottom).offset(36)
            maker.centerX.equalToSuperview()
            maker.width.equalToSuperview().multipliedBy(0.9)
            maker.height.equalTo(buttonOutline.snp.width).multipliedBy(0.104)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

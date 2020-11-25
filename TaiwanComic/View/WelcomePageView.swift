//
//  WelcomePageView.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/25.
//

import SnapKit
import UIKit

class WelcomePageView: UIView {
    var buttonFill: UIButton = {
        var button = Button(buttonStyle: .fill)
        button.setTitle("立即登入", for: .normal)
        button.addTarget(nil, action: #selector(touch), for: .touchUpInside)
        button.isEnabled = true
        return button
    }()

    var buttonOutline: UIButton = {
        var button = Button(buttonStyle: .outline)
        button.setTitle("立即登入", for: .normal)
        button.isEnabled = true
        return button
    }()

    var buttonOutline2: UIButton = {
        var button = Button(buttonStyle: .outline2)
        button.setTitle("立即登入", for: .normal)
        button.isEnabled = true
        return button
    }()

    var ghostButton: UIButton = {
        var button = Button(buttonStyle: .ghost)
        button.setTitle("立即登入", for: .normal)
        button.isEnabled = true
        return button
    }()

    var imageButton: UIButton = {
        var button = Imagebutton(buttonStyle: .apple)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(buttonFill)
        addSubview(buttonOutline)
        addSubview(buttonOutline2)
        addSubview(ghostButton)
        addSubview(imageButton)
        setConstraints()
    }

    func setConstraints() {
        buttonFill.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(100)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(200)
            maker.height.equalTo(50)
        }
        buttonOutline.snp.makeConstraints { maker in
            maker.top.equalTo(buttonFill.snp.bottom).offset(100)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(200)
            maker.height.equalTo(50)
        }
        buttonOutline2.snp.makeConstraints { maker in
            maker.top.equalTo(buttonOutline.snp.bottom).offset(100)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(200)
            maker.height.equalTo(50)
        }
        ghostButton.snp.makeConstraints { maker in
            maker.top.equalTo(buttonOutline2.snp.bottom).offset(100)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(200)
            maker.height.equalTo(50)
        }
        imageButton.snp.makeConstraints { maker in
            maker.top.equalTo(ghostButton.snp.bottom).offset(100)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(200)
            maker.height.equalTo(50)
        }
    }

    @objc func touch() {
        print(#function)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

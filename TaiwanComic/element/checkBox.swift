//
//  checkBox.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/26.
//

import SnapKit
import UIKit

class CheckBox: UIView {
    var isChecked: Bool = false {
        didSet {
            button.isSelected = isChecked
        }
    }

    var button: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "checkbox"), for: .normal)
        button.setImage(UIImage(named: "checkboxChecked"), for: .selected)
        return button
    }()

    var label: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
//        addSubview(label)
//        addSubview(button)

        let stackView = UIStackView(arrangedSubviews: [button, label])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        addSubview(stackView)
        stackView.snp.makeConstraints { maker in
            maker.top.leading.bottom.equalToSuperview()
        }
        /* Alvin
                button.snp.makeConstraints { maker in
                    maker.leading.equalToSuperview()
                    maker.centerY.equalToSuperview()
                    maker.height.width.equalTo(18)
                }
                label.snp.makeConstraints { maker in
                    maker.leading.equalTo(button.snp.trailing).offset(8)
                    maker.centerY.equalTo(button)
                    maker.width.equalTo(200)
                    maker.height.equalTo(20)
                }
         */
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print(#function)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

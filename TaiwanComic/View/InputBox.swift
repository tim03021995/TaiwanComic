//
//  InputBox.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/25.
//

import SnapKit
import UIKit

class InputBox: UIView {
    let spaceY = screenHeight * 0.0089
    var label: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    lazy var textField: CustomTextField = {
        var textfield = CustomTextField()
        textfield.addSubview(separator)
        return textfield
    }()

    var promptLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [label, textField, promptLabel])
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.distribution = .equalCentering
        stackView.alignment = .fill
        stackView.isUserInteractionEnabled = true
        return stackView
    }()

    var separator: UIView = {
        let separator = UIView()
        return separator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        setStatus(status: .normal)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setConstraints() {
        addSubview(stackView)
        stackView.snp.makeConstraints { maker in
            maker.top.leading.trailing.bottom.equalToSuperview()
        }
        textField.snp.makeConstraints { maker in
            maker.height.equalTo(36)
        }
        separator.snp.makeConstraints { maker in
            maker.leading.trailing.bottom.equalToSuperview()
            maker.height.equalTo(1)
        }
        textField.layoutIfNeeded()
    }

    func setStatus(status: Status) {
        switch status {
        case .normal:
            label.textColor = .titleColor
            textField.backgroundColor = .spaceColor
            promptLabel.textColor = .titleColor
            separator.backgroundColor = .titleColor
        case .highlight:
            label.textColor = .mainColor
            textField.backgroundColor = .spaceColor
            promptLabel.textColor = .mainColor
            separator.backgroundColor = .mainColor
        case .waring:
            label.textColor = .warningColor
            textField.backgroundColor = .spaceColor
            promptLabel.textColor = .warningColor
            separator.backgroundColor = .warningColor
        }
    }

    enum Status {
        case normal, highlight, waring
    }
}

class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        rightView = buttonStackView
        rightViewMode = .always
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var eyesButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "inputboxPasswordShow"), for: .normal)
        button.setImage(UIImage(named: "inputboxPasswordHide"), for: .selected)
        button.isHidden = true

        return button
    }()

    var warningButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "iconCircleExclamation"), for: .normal)
        button.isHidden = true

        return button
    }()

    var correctButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "iconCircleCheck"), for: .normal)
        button.isHidden = true
        return button
    }()

    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [correctButton, warningButton, eyesButton])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()

    enum Constants {
        static let sidePadding: CGFloat = 15
        static let topPadding: CGFloat = 0
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(
            x: bounds.origin.x + Constants.sidePadding,
            y: bounds.origin.y + Constants.topPadding,
            width: bounds.size.width - Constants.sidePadding * 2,
            height: bounds.size.height - Constants.topPadding * 2
        )
    }

    override func rightViewRect(forBounds _: CGRect) -> CGRect {
        let width = getButtonStackViewWidth()
        print(width)
        let cgrect = CGRect(x: frame.width - width - 6, y: 0, width: width, height: frame.height)
        return cgrect
    }

    func getButtonStackViewWidth() -> CGFloat {
        var width: CGFloat = 6
        for item in buttonStackView.arrangedSubviews {
            if let button = item as? UIButton {
                if button.isHidden == false {
                    width += (button.image(for: .normal)?.size.width) ?? 0
                    print(width)
                    width += 6
                }
            }
        }
        return width
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}

//
//  CustomButton.swift
//
//
//  Created by MB Labs on 08/02/24.
//

import UIKit

public class CustomButton: UIButton {
    override public var isEnabled: Bool {
        didSet {
            didSetIsEnabled()
        }
    }

    public convenience init(type: UIButton.ButtonType = .system,
                            title: String,
                            height: CGFloat = 42.0,
                            width: CGFloat? = nil,
                            titleColor: UIColor? = .white,
                            backgroundColor: UIColor? = UIColor(customColor: .accentMagenta),
                            cornerRadius: CGFloat = 16.0)
    {
        self.init(type: type)

        setHeight(height)

        if let width {
            setWidth(width)
        }

        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)

        self.backgroundColor = backgroundColor

        layer.cornerRadius = cornerRadius
    }

    private func didSetIsEnabled() {
        alpha = isEnabled ? 1 : 0.6
    }
}

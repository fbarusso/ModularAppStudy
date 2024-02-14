//
//  CustomTextField.swift
//
//
//  Created by MB Labs on 08/02/24.
//

import UIKit

public class CustomTextField: UITextField {
    private var padding = UIEdgeInsets(top: 0, left: 16.0, bottom: 0, right: 16.0)

    public convenience init(placeholder: String? = nil,
                            paceholderColor: UIColor? = UIColor(customColor: .themeLight)?.withAlphaComponent(0.6),
                            height: CGFloat = 42.0,
                            textColor: UIColor? = UIColor(customColor: .themeLight),
                            borderWidth: CGFloat = 2.0,
                            borderColor: UIColor? = UIColor(customColor: .accentMagenta),
                            cornerRadius: CGFloat = 16.0,
                            padding: UIEdgeInsets? = nil)
    {
        self.init(frame: .zero)

        attributedPlaceholder = NSAttributedString(string: placeholder ?? .empty, attributes: [NSAttributedString.Key.foregroundColor: paceholderColor ?? .white])

        setHeight(height)

        self.textColor = textColor

        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius

        if let padding {
            self.padding = padding
        }
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
}

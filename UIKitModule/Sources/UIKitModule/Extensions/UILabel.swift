//
//  UILabel.swift
//
//
//  Created by MB Labs on 15/02/24.
//

import UIKit

public extension UILabel {
    func setHalfBold(boldString: String?,
                     regularString: String?,
                     size: CGFloat = FontSize.medium,
                     color: UIColor? = UIColor(customColor: .themeLight))
    {
        let attributedString = NSMutableAttributedString(string: boldString ?? "", attributes: [.foregroundColor: color ?? .white, .font: UIFont.boldSystemFont(ofSize: size)])
        attributedString.append(NSMutableAttributedString(string: regularString ?? "", attributes: [.foregroundColor: color ?? .white, .font: UIFont.systemFont(ofSize: size)]))
        attributedText = attributedString
    }
}

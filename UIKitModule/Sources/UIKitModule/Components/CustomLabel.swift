//
//  CustomLabel.swift
//
//
//  Created by MB Labs on 16/02/24.
//

import SkeletonView
import UIKit

public class CustomLabel: UILabel {
    public convenience init(text: String? = "",
                            font: UIFont = .systemFont(ofSize: FontSize.small),
                            textColor: UIColor? = UIColor(customColor: .themeLight),
                            isSkeletonable: Bool = false)
    {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.textColor = textColor
        self.isSkeletonable = isSkeletonable
        skeletonTextLineHeight = .fixed(font.pointSize)
    }
}

//
//  UIFont.swift
//
//
//  Created by MB Labs on 08/02/24.
//

import UIKit

public extension UIFont {
    convenience init?(customFont: CustomFont, size: CGFloat) {
        self.init(name: customFont.rawValue, size: size)
    }
}

//
//  UIFont.swift
//
//
//  Created by MB Labs on 08/02/24.
//

import UIKit

extension UIFont {
    public convenience init?(customFont: CustomFont, size: CGFloat) {
        self.init(name: customFont.rawValue, size: size)
    }
}

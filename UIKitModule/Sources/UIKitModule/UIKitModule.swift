//
//  UIKitModule.swift
//
//
//  Created by MB Labs on 08/02/24.
//

import Foundation
import SwiftUI

public enum UIKitModule {
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        bundle.url(forResource: fontName, withExtension: fontExtension)
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider)
        else {
            fatalError("Couldn't create font from filename: \(fontName) with extension \(fontExtension)")
        }
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }

    public static func registerFonts() {
        registerFont(bundle: .module, fontName: "Pacifico-Regular", fontExtension: "ttf")
    }
}

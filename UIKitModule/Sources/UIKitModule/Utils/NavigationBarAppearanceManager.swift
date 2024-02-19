//
//  NavigationBarAppearanceManager.swift
//
//
//  Created by MB Labs on 19/02/24.
//

import UIKit

public enum NavigationBarAppearanceManager {
    public static func customNavigationBarAppearance() -> UINavigationBarAppearance {
        let customNavigationBarAppearance = UINavigationBarAppearance()

        customNavigationBarAppearance.configureWithTransparentBackground()
        customNavigationBarAppearance.backgroundColor = .clear
        customNavigationBarAppearance.backgroundEffect = UIBlurEffect(style: .dark)
        customNavigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(customColor: .themeLight)]

        return customNavigationBarAppearance
    }
}

//
//  UIViewController.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import UIKit

public extension UIViewController {
    func setDefaultGradientBackground() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}

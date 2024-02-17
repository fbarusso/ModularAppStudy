//
//  UIViewController.swift
//
//
//  Created by MB Labs on 16/02/24.
//

import SkeletonView
import UIKit

public extension UIViewController {
    func showSkeleton(in views: [UIView]) {
        for view in views {
            view.showSkeleton(animated: false, delay: .zero)
        }
    }

    func hideSkeleton(in views: [UIView]) {
        for view in views {
            view.hideSkeleton()
        }
    }
}

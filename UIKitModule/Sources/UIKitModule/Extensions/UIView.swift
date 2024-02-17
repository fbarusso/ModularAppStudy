//
//  UIView.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import SkeletonView
import UIKit

public extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil)
    {
        translatesAutoresizingMaskIntoConstraints = false

        if let top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }

        if let left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }

        if let bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }

        if let right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }

        if let width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }

    func anchorToViewTop(view: UIView, paddingTop: VerticalPadding = .medium, horizontalPadding: HorizontalPadding = .small) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: paddingTop.rawValue),
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: horizontalPadding.rawValue),
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -horizontalPadding.rawValue),
        ])
    }

    func anchorToViewBottom(view: UIView, paddingBottom: VerticalPadding = .medium, horizontalPadding: HorizontalPadding = .small) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -paddingBottom.rawValue),
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: horizontalPadding.rawValue),
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -horizontalPadding.rawValue),
        ])
    }

    func anchorBelow(view: UIView, paddingTop: VerticalPadding = .medium, horizontalPadding: HorizontalPadding = .small) {
        guard let superview else { return }

        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.bottomAnchor, constant: paddingTop.rawValue),
            leftAnchor.constraint(equalTo: superview.leftAnchor, constant: horizontalPadding.rawValue),
            rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -horizontalPadding.rawValue),
        ])
    }

    func anchorAbove(view: UIView, paddingBottom: VerticalPadding = .medium, horizontalPadding: HorizontalPadding = .small) {
        guard let superview else { return }

        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: view.topAnchor, constant: -paddingBottom.rawValue),
            leftAnchor.constraint(equalTo: superview.leftAnchor, constant: horizontalPadding.rawValue),
            rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -horizontalPadding.rawValue),
        ])
    }

    func anchorToSuperviewBottomOnly(paddingBottom: VerticalPadding = .big) {
        guard let superview else { return }

        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -paddingBottom.rawValue).isActive = true
    }

    func center(inView view: UIView, yConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant).isActive = true
    }

    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        if let topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }

    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0, constant: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true

        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }

    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    func setHeight(_ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    func setWidth(_ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    func fillSuperview(padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview else { return }
        anchor(top: superview.topAnchor, left: superview.leftAnchor, bottom: superview.bottomAnchor, right: superview.rightAnchor, paddingTop: padding, paddingLeft: padding, paddingBottom: padding, paddingRight: padding)
    }

    func setCircular() {
        layer.cornerRadius = layer.bounds.width / 2
        clipsToBounds = true
    }

    func setShadow(x: CGFloat, y: CGFloat, radius: CGFloat, opacity: Float) {
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = radius

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = opacity

        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func showDefaultSkeleton() {
        showAnimatedGradientSkeleton(usingGradient: .init(baseColor: UIColor(customColor: .skeletonGradient) ?? .midnightBlue), transition: .crossDissolve(SkeletonViewConstants.transitionDuration))
    }
    
    func hideDefaultSkeleton() {
        hideSkeleton(transition: .crossDissolve(SkeletonViewConstants.transitionDuration))
    }
}

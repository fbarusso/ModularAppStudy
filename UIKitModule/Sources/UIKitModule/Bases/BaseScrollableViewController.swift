//
//  BaseScrollableViewController.swift
//
//
//  Created by MB Labs on 15/02/24.
//

import UIKit

open class BaseScrollableViewController: BaseViewController {
    // MARK: - Properties

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()

        scrollView.showsVerticalScrollIndicator = false

        return scrollView
    }()

    private let scrollableContentView = UIView()

    public var scrollableViewTopAnchor: NSLayoutYAxisAnchor {
        scrollableContentView.topAnchor
    }

    public var scrollableViewLeftAnchor: NSLayoutXAxisAnchor {
        scrollableContentView.leftAnchor
    }

    public var scrollableViewBottomAnchor: NSLayoutYAxisAnchor {
        scrollableContentView.bottomAnchor
    }

    public var scrollableViewRightAnchor: NSLayoutXAxisAnchor {
        scrollableContentView.rightAnchor
    }

    // MARK: - Lifecycle

    override open func viewDidLoad() {
        super.viewDidLoad()

        configureScrollableView()
    }

    // MARK: - Helpers

    private func configureScrollableView() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollableContentView)

        let heightConstraint = scrollableContentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightConstraint.isActive = true
        heightConstraint.priority = UILayoutPriority(50)

        scrollView.fillSuperview()
        scrollableContentView.fillSuperview()

        scrollableContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }

    public func addSubviewToScrollableContentView(_ view: UIView) {
        scrollableContentView.addSubview(view)
    }

    public func anchorToScrollableContentViewBottom(view: UIView, padding: CGFloat = 0) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.bottomAnchor.constraint(equalTo: scrollableContentView.bottomAnchor, constant: -padding).isActive = true
    }
}

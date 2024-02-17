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

    public let scrollableContentView = UIView()

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

    public func anchorToScrollableContentViewBottom(view: UIView, paddingBottom: VerticalPadding = .big) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.bottomAnchor.constraint(equalTo: scrollableContentView.bottomAnchor, constant: -paddingBottom.rawValue).isActive = true
    }
}

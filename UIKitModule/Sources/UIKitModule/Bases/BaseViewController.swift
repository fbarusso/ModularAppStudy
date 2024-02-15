//
//  BaseViewController.swift
//
//
//  Created by MB Labs on 15/02/24.
//

import UIKit

open class BaseViewController: UIViewController {
    // MARK: - Init

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override open func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        configureView()
    }

    // MARK: - Default configuration

    open func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor(customColor: .themeDark)
        navigationController?.navigationBar.tintColor = UIColor(customColor: .themeLight)
    }

    open func configureView() {
        view.backgroundColor = UIColor(customColor: .themeDark)
    }
}

// MARK: - BaseViewModelDelegate

extension BaseViewController: BaseViewModelDelegate {
    public func showMessage(message _: String) {
        // TODO: Implement custom alert
    }
}

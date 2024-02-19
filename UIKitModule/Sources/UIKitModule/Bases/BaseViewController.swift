//
//  BaseViewController.swift
//
//
//  Created by MB Labs on 15/02/24.
//

import UIKit

open class BaseViewController: UIViewController {
    // MARK: - Attributes

    private var isLoading: Bool = false {
        didSet {
            didSetIsLoading(isLoading: isLoading)
        }
    }

    // MARK: - Components

    private let customAlert = CustomAlert()

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

    /// Override this function to setup the loading state of a view
    open func didSetIsLoading(isLoading _: Bool) {}

    @objc func dismissAlert() {
        customAlert.dismissAlert()
    }
}

// MARK: - BaseViewModelDelegate

extension BaseViewController: BaseViewModelDelegate {
    public func showMessage(title: String, message: String) {
        DispatchQueue.main.async {
            self.customAlert.showAlert(title: title, message: message, on: self)
        }
    }

    public func setIsLoading(_ isLoading: Bool) {
        self.isLoading = isLoading
    }
}

//
//  LoginViewController.swift
//
//
//  Created by MB Labs on 02/02/24.
//

import CoordinatorModule
import UIKit
import UIKitModule

class LoginViewController: BaseViewController {
    // MARK: - Attributes

    private let viewModel = LoginContainer.shared.resolve(LoginViewModel.self)
    private let loginButtonWidth = 120.0

    // MARK: - Components

    private let titleLabel: UILabel = {
        let label = UILabel()

        label.text = "ModularMovies"
        label.font = UIFont(customFont: .pacificoRegular, size: FontSize.veryBig)
        label.textColor = UIColor(customColor: .accentMagenta)

        return label
    }()

    private lazy var userNameTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Nome")

        textField.addTarget(self, action: #selector(userNameDidChange), for: .editingChanged)

        return textField
    }()

    private lazy var loginButton: CustomButton = {
        let customButton = CustomButton(title: "Entrar", width: loginButtonWidth, isEnabled: false)

        customButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)

        return customButton
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.addSubview(titleLabel)
        titleLabel.centerX(inView: view)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: VerticalPadding.veryBig)

        view.addSubview(loginButton)
        loginButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: VerticalPadding.big, paddingRight: HorizontalPadding.medium)

        view.addSubview(userNameTextField)
        userNameTextField.anchor(left: view.leftAnchor, bottom: loginButton.topAnchor, right: view.rightAnchor, paddingLeft: HorizontalPadding.medium, paddingBottom: VerticalPadding.big, paddingRight: HorizontalPadding.medium)
    }

    // MARK: - Actions

    @objc private func userNameDidChange(sender: UITextField) {
        guard let text = sender.text else { return }
        loginButton.isEnabled = !text.isEmpty
    }

    @objc private func didTapLoginButton() {
//        viewModel?.saveUserName(userName: userNameTextField.text)
//        CoordinatorSingleton.navigateToMoviesList()
        showMessage(title: "Lorem ipsum", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
    }
}

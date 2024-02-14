//
//  LoginViewController.swift
//
//
//  Created by MB Labs on 02/02/24.
//

import UIKit
import UIKitModule

class LoginViewController: UIViewController {
    // MARK: - Attributes

    private let coordinator = LoginContainer.sharedContainer.resolve(LoginCoordinator.self)
    private let viewModel = LoginContainer.sharedContainer.resolve(LoginViewModel.self)

    private let loginButtonWidth = 120.0

    // MARK: - Components

    private let titleLabel: UILabel = {
        let label = UILabel()

        label.text = "ModularMovies"
        label.font = UIFont(customFont: .pacificoRegular, size: FontSize.big)
        label.textColor = UIColor(customColor: .accentMagenta)

        return label
    }()

    private lazy var userNameTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Nome")

        textField.addTarget(self, action: #selector(userNameDidChange), for: .editingChanged)

        return textField
    }()

    private lazy var loginButton: CustomButton = {
        let customButton = CustomButton(title: "Entrar", width: loginButtonWidth)

        customButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        customButton.isEnabled = false

        return customButton
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        view.backgroundColor = UIColor(customColor: .themeDark)

        view.addSubview(titleLabel)
        titleLabel.centerX(inView: view)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: VerticalPadding.veryBig)

        view.addSubview(loginButton)
        loginButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: VerticalPadding.big, paddingRight: HorizontalPadding.medium)

        view.addSubview(userNameTextField)
        userNameTextField.anchor(left: view.leftAnchor, bottom: loginButton.topAnchor, right: view.rightAnchor, paddingLeft: HorizontalPadding.medium, paddingBottom: VerticalPadding.big, paddingRight: HorizontalPadding.medium)
    }

    // MARK: - Actions

    @objc func userNameDidChange(sender: UITextField) {
        guard let text = sender.text else { return }
        loginButton.isEnabled = !text.isEmpty
    }

    @objc func didTapLoginButton() {
        viewModel?.saveUserName(userName: userNameTextField.text)
        coordinator?.navigateToMoviesList()
    }
}

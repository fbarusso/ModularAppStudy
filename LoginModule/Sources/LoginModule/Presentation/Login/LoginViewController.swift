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

    // MARK: - Components

    private let titleLabel: UILabel = {
        let label = UILabel()

        label.text = "ModularMovies"
        label.font = UIFont(customFont: .pacificoRegular, size: FontSize.veryBig)
        label.textColor = UIColor(customColor: .accentMagenta)
        label.textAlignment = .center

        return label
    }()

    private lazy var userNameTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Nome")

        textField.addTarget(self, action: #selector(userNameDidChange), for: .editingChanged)

        return textField
    }()

    private lazy var loginButton: CustomButton = {
        let customButton = CustomButton(title: "Entrar", isEnabled: false)

        customButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)

        return customButton
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    // MARK: - Helpers

    private func setupView() {
        title = "Login"
        

        view.addSubview(titleLabel)
        titleLabel.anchorToViewTop(view: view, paddingTop: .veryBig, horizontalPadding: .none)

        view.addSubview(loginButton)
        loginButton.anchorToViewBottom(view: view, paddingBottom: .big, horizontalPadding: .medium)

        view.addSubview(userNameTextField)
        userNameTextField.anchorAbove(view: loginButton, horizontalPadding: .medium)
    }

    // MARK: - Actions

    @objc private func userNameDidChange(sender: UITextField) {
        guard let text = sender.text else { return }
        loginButton.isEnabled = !text.isEmpty
    }

    @objc private func didTapLoginButton() {
        viewModel?.saveUserName(userName: userNameTextField.text)
        CoordinatorSingleton.navigateToMoviesList()
    }
}

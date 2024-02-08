//
//  LoginViewController.swift
//  
//
//  Created by MB Labs on 02/02/24.
//

import UIKit
import UIKitModule
import MoviesListModule

class LoginViewController: UIViewController {
    
    // MARK: - Attributes
    
    private let coordinator = LoginContainer.sharedContainer.resolve(LoginCoordinator.self)
    private let viewModel = LoginContainer.sharedContainer.resolve(LoginViewModel.self)
    
    
    // MARK: - Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "ModularMovies"
        label.font = UIFont(customFont: .pacificoRegular, size: 32)
        label.textColor = UIColor(customColor: .accent)
        
        return label
    }()
    
    private let userNameTextField: UITextField = CustomTextField(placeholder: "Nome")
    
    private lazy var loginButton: CustomButton = {
        let customButton = CustomButton(title: "Entrar")
        
        customButton.button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        
        return customButton
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = UIColor(customColor: .backgroundDark)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 64)
        titleLabel.centerX(inView: view)
        
        view.addSubview(userNameTextField)
        userNameTextField.center(inView: view)
        userNameTextField.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingLeft: UIConstants.mediumHorizontalPadding, paddingRight: UIConstants.mediumHorizontalPadding)
        userNameTextField.addTarget(self, action: #selector(userNameDidChange), for: .editingChanged)

        
        view.addSubview(loginButton)
        loginButton.anchor(top: userNameTextField.bottomAnchor, left: userNameTextField.leftAnchor, right: userNameTextField.rightAnchor, paddingTop: UIConstants.mediumHorizontalPadding)
    }
    
    // MARK: - Actions
    
    @objc func userNameDidChange(sender: UITextField) {
        if let userName = sender.text {
            loginButton.isValid = !userName.isEmpty
        } else {
            loginButton.isValid = false
        }
    }
    
    @objc func didTapLoginButton() {
        viewModel?.saveUserName(userName: userNameTextField.text)
        coordinator?.navigateToMoviesList()
    }
}

//
//  LoginViewController.swift
//  
//
//  Created by MB Labs on 02/02/24.
//

import UIKit
import UIKitModule

class LoginViewController: UIViewController {
    
    var viewModel = LoginContainer.sharedContainer.resolve(LoginViewModel.self)
    
    private let userNameTextField: UITextField = CustomTextField(placeholder: "Nome")
    
    private let loginButton: CustomButton = {
        let customButton = CustomButton(title: "Entrar")
        
        customButton.button.addTarget(LoginViewController.self, action: #selector(didTapLoginButton), for: .touchUpInside)
        
        return customButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        setDefaultGradientBackground()
        
        view.addSubview(userNameTextField)
        userNameTextField.center(inView: view)
        userNameTextField.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingLeft: UIConstants.mediumHorizontalPadding, paddingRight: UIConstants.mediumHorizontalPadding)
        userNameTextField.addTarget(self, action: #selector(userNameDidChange), for: .editingChanged)

        
        view.addSubview(loginButton)
        loginButton.anchor(top: userNameTextField.bottomAnchor, left: userNameTextField.leftAnchor, right: userNameTextField.rightAnchor, paddingTop: UIConstants.mediumHorizontalPadding)
    }
    
    @objc func userNameDidChange(sender: UITextField) {
        if let userName = sender.text {
            loginButton.isValid = !userName.isEmpty
        } else {
            loginButton.isValid = false
        }
    }
    
    @objc func didTapLoginButton() {
        viewModel?.saveUserName(userName: userNameTextField.text)
    }
}

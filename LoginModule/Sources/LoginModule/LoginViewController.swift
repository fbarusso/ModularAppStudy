//
//  LoginViewController.swift
//  
//
//  Created by MB Labs on 02/02/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewModel = LoginContainer.sharedContainer.resolve(LoginViewModel.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        print(viewModel?.debugScreenTitle() ?? "LoginViewModel is broken")
    }
}

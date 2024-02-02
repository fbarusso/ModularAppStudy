//
//  LoginContainer.swift
//
//
//  Created by MB Labs on 02/02/24.
//

import UIKit
import Swinject

public class LoginContainer {
    static var sharedContainer = Container()
    
    public static func createModule() -> UIViewController {
        LoginContainer.sharedContainer.register(LoginViewModel.self) { _ in
            LoginViewModel()
        }
        
        return LoginViewController()
    }
}

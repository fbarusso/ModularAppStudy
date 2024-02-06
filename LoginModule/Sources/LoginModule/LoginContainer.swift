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
        LoginContainer.sharedContainer.register(LoginDataSource.self) { _ in
            LoginDataSourceImpl()
        }
        
        LoginContainer.sharedContainer.register(LoginRepository.self) { resolver in
            let loginDataSource = resolver.resolve(LoginDataSource.self)!
            return LoginRepositoryImpl(loginDataSource: loginDataSource)
        }
        
        LoginContainer.sharedContainer.register(SaveUserNameUseCase.self) { resolver in
            let loginRepository = resolver.resolve(LoginRepository.self)!
            return SaveUserNameUseCaseImpl(loginRepository: loginRepository)
        }
        
        LoginContainer.sharedContainer.register(LoginViewModel.self) { resolver in
            let saveUserNameUseCase = resolver.resolve(SaveUserNameUseCase.self)!
            return LoginViewModel(saveUserNameUseCase: saveUserNameUseCase)
        }
        
        return LoginViewController()
    }
}

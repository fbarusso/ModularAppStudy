//
//  LoginContainer.swift
//
//
//  Created by MB Labs on 02/02/24.
//

import CoordinatorModule
import Swinject
import UIKit

public enum LoginContainer {
    static var shared = Container()

    public static func createModule() -> UIViewController {
        LoginContainer.shared.register(LoginDataSource.self) { _ in
            LoginDataSourceImpl()
        }

        LoginContainer.shared.register(LoginRepository.self) { resolver in
            let loginDataSource = resolver.resolve(LoginDataSource.self)!
            return LoginRepositoryImpl(loginDataSource: loginDataSource)
        }

        LoginContainer.shared.register(SaveUserNameUseCase.self) { resolver in
            let loginRepository = resolver.resolve(LoginRepository.self)!
            return SaveUserNameUseCaseImpl(loginRepository: loginRepository)
        }

        LoginContainer.shared.register(LoginViewModel.self) { resolver in
            let saveUserNameUseCase = resolver.resolve(SaveUserNameUseCase.self)!
            return LoginViewModel(saveUserNameUseCase: saveUserNameUseCase)
        }

        LoginContainer.shared.register(LoginCoordinator.self) { _ in
            LoginCoordinator()
        }

        return LoginViewController()
    }
}

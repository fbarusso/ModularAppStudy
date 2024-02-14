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
    static var sharedContainer = Container()

    public static func createModule(externalCoordinator: ExternalCoordinator) -> UIViewController {
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

        LoginContainer.sharedContainer.register(LoginCoordinator.self) { _ in
            LoginCoordinator(externalCoordinator: externalCoordinator)
        }

        return LoginViewController()
    }
}

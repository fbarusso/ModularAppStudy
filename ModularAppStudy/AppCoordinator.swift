//
//  AppCoordinator.swift
//  ModularAppStudy
//
//  Created by MB Labs on 02/02/24.
//

import UIKit
import LoginModule
import MoviesListModule

class AppCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigateToLogin() {
        let viewController = LoginContainer.createModule()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToMoviesList() {
        let viewController = MoviesListContainer.createModule()
        navigationController.pushViewController(viewController, animated: true)
    }
}

//
//  CoordinatorImpl.swift
//  ModularAppStudy
//
//  Created by MB Labs on 14/02/24.
//

import CoordinatorModule
import LoginModule
import MoviesListModule
import UIKit

class CoordinatorImpl: Coordinator {
    let navigationController: UINavigationController

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

//
//  AppCoordinator.swift
//  ModularAppStudy
//
//  Created by MB Labs on 02/02/24.
//

import LoginModule
import MoviesListModule
import UIKit

class AppCoordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func startNavigation() {
        let externalCoordinator = ExternalCoordinatorImpl(navigationController: navigationController)

        let viewController = LoginContainer.createModule(externalCoordinator: externalCoordinator)
        navigationController.pushViewController(viewController, animated: true)
    }
}

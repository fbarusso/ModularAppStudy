//
//  AppCoordinator.swift
//  ModularAppStudy
//
//  Created by MB Labs on 02/02/24.
//

import CoordinatorModule
import LoginModule
import MoviesListModule
import UIKit

class AppCoordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func startNavigation() {
        let coordinator = CoordinatorImpl(navigationController: navigationController)
        let coordinatorSingletonConfiguration = CoordinatorSingletonConfiguration(coordinator: coordinator, navigationController: navigationController)
        CoordinatorSingleton.setup(configuration: coordinatorSingletonConfiguration)
        CoordinatorSingleton.navigateToLogin()
    }
}

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
        let coordinatorImpl = CoordinatorImpl(navigationController: navigationController)
        CoordinatorSingleton.shared.coordinator = coordinatorImpl
        CoordinatorSingleton.shared.navigationController = navigationController
        CoordinatorSingleton.shared.coordinator?.navigateToLogin()
    }
}

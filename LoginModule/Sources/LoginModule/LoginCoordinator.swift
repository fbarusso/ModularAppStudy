//
//  LoginCoordinator.swift
//
//
//  Created by MB Labs on 07/02/24.
//

import UIKit
import MoviesListModule

class LoginCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigateToMoviesList() {
        let viewController = MoviesListContainer.createModule()
        navigationController.pushViewController(viewController, animated: true)
    }
}

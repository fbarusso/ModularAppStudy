//
//  CoordinatorImpl.swift
//  ModularAppStudy
//
//  Created by MB Labs on 14/02/24.
//

import UIKit
import CoordinatorModule
import MoviesListModule

class ExternalCoordinatorImpl: ExternalCoordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigateToMoviesList() {
        let viewController = MoviesListContainer.createModule()
        navigationController.pushViewController(viewController, animated: true)
    }
}

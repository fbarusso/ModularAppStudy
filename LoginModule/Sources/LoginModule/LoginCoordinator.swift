//
//  LoginCoordinator.swift
//
//
//  Created by MB Labs on 07/02/24.
//

import CoordinatorModule
import UIKit

class LoginCoordinator {
    func navigateToMoviesList() {
        CoordinatorSingleton.shared.coordinator?.navigateToMoviesList()
    }
}

//
//  LoginCoordinator.swift
//
//
//  Created by MB Labs on 07/02/24.
//

import CoordinatorModule
import UIKit

class LoginCoordinator {
    private let externalCoordinator: ExternalCoordinator

    init(externalCoordinator: ExternalCoordinator) {
        self.externalCoordinator = externalCoordinator
    }

    func navigateToMoviesList() {
        externalCoordinator.navigateToMoviesList()
    }
}

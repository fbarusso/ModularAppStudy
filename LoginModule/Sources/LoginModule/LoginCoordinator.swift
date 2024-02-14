//
//  LoginCoordinator.swift
//
//
//  Created by MB Labs on 07/02/24.
//

import UIKit
import CoordinatorModule

class LoginCoordinator {
    private let externalCoordinator: ExternalCoordinator
    
    init(externalCoordinator: ExternalCoordinator) {
        self.externalCoordinator = externalCoordinator
    }
    
    func navigateToMoviesList() {
        externalCoordinator.navigateToMoviesList()
    }
}

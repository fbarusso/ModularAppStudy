//
//  MoviesListCoordinator.swift
//
//
//  Created by MB Labs on 14/02/24.
//

import CoordinatorModule
import UIKit

class MoviesListCoordinator {
    func navigateToMovieDetails() {
        CoordinatorSingleton.navigate(viewController: MovieDetailsViewController())
    }
}
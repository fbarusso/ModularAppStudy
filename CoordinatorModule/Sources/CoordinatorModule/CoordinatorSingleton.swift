//
//  CoordinatorSingleton.swift
//
//
//  Created by MB Labs on 14/02/24.
//

import UIKit

public class CoordinatorSingleton {
    public static let shared = CoordinatorSingleton()
    public var coordinator: Coordinator?
    public var navigationController: UINavigationController?

    public static func navigate(viewController: UIViewController, animated: Bool = true) {
        shared.navigationController?.pushViewController(viewController, animated: animated)
    }

    public static func navigateToLogin() {
        shared.coordinator?.navigateToLogin()
    }

    public static func navigateToMoviesList() {
        shared.coordinator?.navigateToMoviesList()
    }

    private init() {}
}

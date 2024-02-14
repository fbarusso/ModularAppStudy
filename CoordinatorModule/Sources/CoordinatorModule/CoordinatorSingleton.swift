//
//  CoordinatorSingleton.swift
//
//
//  Created by MB Labs on 14/02/24.
//

import UIKit

public struct CoordinatorSingletonConfiguration {
    let coordinator: Coordinator
    let navigationController: UINavigationController

    public init(coordinator: Coordinator, navigationController: UINavigationController) {
        self.coordinator = coordinator
        self.navigationController = navigationController
    }
}

public class CoordinatorSingleton {
    private static let shared = CoordinatorSingleton()
    private var configuration: CoordinatorSingletonConfiguration?

    public static func setup(configuration: CoordinatorSingletonConfiguration) {
        shared.configuration = configuration
    }

    public static func navigate(viewController: UIViewController, animated: Bool = true) {
        shared.configuration?.navigationController.pushViewController(viewController, animated: animated)
    }

    public static func navigateToLogin() {
        shared.configuration?.coordinator.navigateToLogin()
    }

    public static func navigateToMoviesList() {
        shared.configuration?.coordinator.navigateToMoviesList()
    }

    private init() {}
}

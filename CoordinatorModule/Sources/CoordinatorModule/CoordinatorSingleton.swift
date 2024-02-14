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

    private init() {}
}

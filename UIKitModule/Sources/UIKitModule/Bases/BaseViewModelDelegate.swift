//
//  BaseViewModelDelegate.swift
//
//
//  Created by MB Labs on 15/02/24.
//

import UIKit

public protocol BaseViewModelDelegate where Self: UIViewController {
    func showMessage(title: String, message: String)
    func setIsLoading(_ isLoading: Bool)
}

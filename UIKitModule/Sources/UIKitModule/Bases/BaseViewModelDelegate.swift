//
//  BaseViewModelDelegate.swift
//
//
//  Created by MB Labs on 15/02/24.
//

import UIKit

protocol BaseViewModelDelegate where Self: UIViewController {
    func showMessage(message: String)
}

//
//  LoginViewModel.swift
//
//
//  Created by MB Labs on 02/02/24.
//

import Foundation

class LoginViewModel {
    private let saveUserNameUseCase: SaveUserNameUseCase

    init(saveUserNameUseCase: SaveUserNameUseCase) {
        self.saveUserNameUseCase = saveUserNameUseCase
    }

    func saveUserName(userName: String?) {
        saveUserNameUseCase.saveUserName(userName: userName ?? "")
    }
}

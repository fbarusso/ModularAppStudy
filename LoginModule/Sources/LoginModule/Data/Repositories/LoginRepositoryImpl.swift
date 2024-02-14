//
//  LoginRepositoryImpl.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation

class LoginRepositoryImpl: LoginRepository {
    private let loginDataSource: LoginDataSource

    init(loginDataSource: LoginDataSource) {
        self.loginDataSource = loginDataSource
    }

    func saveUserName(userName: String) {
        loginDataSource.saveUserName(userName: userName)
    }
}

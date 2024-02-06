//
//  LoginDataSourceImpl.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation

class LoginDataSourceImpl: LoginDataSource {
    func saveUserName(userName: String) {
        UserDefaults.standard.set(userName, forKey: "UserName")
    }
}

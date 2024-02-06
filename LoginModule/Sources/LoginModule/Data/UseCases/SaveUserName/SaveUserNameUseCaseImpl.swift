//
//  SaveUserNameUseCaseImpl.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation

class SaveUserNameUseCaseImpl: SaveUserNameUseCase {
    
    private let loginRepository: LoginRepository
    
    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }
    
    func saveUserName(userName: String) {
        loginRepository.saveUserName(userName: userName)
    }
}

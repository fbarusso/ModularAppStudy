//
//  GetUserNameUseCaseImpl.swift
//
//
//  Created by MB Labs on 19/02/24.
//

import Foundation

class GetUserNameUseCaseImpl: GetUserNameUseCase {
    private let moviesListRepository: MoviesListRepository

    init(moviesListRepository: MoviesListRepository) {
        self.moviesListRepository = moviesListRepository
    }
    
    func getUserName(completion: @escaping (String?) -> Void) {
        moviesListRepository.getUserName { userName in
            completion(userName)
        }
    }
}

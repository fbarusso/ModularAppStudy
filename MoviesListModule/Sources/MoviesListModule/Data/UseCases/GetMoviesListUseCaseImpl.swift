//
//  GetMoviesListUseCaseImpl.swift
//
//
//  Created by MB Labs on 07/02/24.
//

import Foundation

class GetMoviesListUseCaseImpl: GetMoviesListUseCase {
   
    private let moviesListRepository: MoviesListRepository
    
    init(moviesListRepository: MoviesListRepository) {
        self.moviesListRepository = moviesListRepository
    }
    
    func getMoviesList(completion: @escaping (_ moviesList: [MovieEntity]?, _ success: Bool, _ error: String?) -> Void) {
        moviesListRepository.getMoviesList { moviesList, success, error in
            completion(moviesList, success, error)
        }
    }
}

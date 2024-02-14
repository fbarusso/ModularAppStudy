//
//  GetPopularMoviesListUseCaseImpl.swift
//
//
//  Created by MB Labs on 09/02/24.
//

import Foundation

class GetPopularMoviesListUseCaseImpl: GetPopularMoviesListUseCase {
    private let moviesListRepository: MoviesListRepository

    init(moviesListRepository: MoviesListRepository) {
        self.moviesListRepository = moviesListRepository
    }

    func getPopularMoviesListUseCase(completion: @escaping (_ popularMoviesList: [MovieEntity]?, _ success: Bool, _ error: String?) -> Void) {
        moviesListRepository.getPopularMoviesList { popularMoviesList, success, error in
            completion(popularMoviesList, success, error)
        }
    }
}

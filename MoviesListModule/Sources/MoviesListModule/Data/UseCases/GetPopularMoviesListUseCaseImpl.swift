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

    func getPopularMoviesListUseCase(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void) {
        moviesListRepository.getPopularMoviesList { result in
            completion(result)
        }
    }
}

//
//  GetPopularMoviesListUseCaseImpl.swift
//
//
//  Created by MB Labs on 09/02/24.
//

import Foundation

class GetTopRatedMoviesListUseCaseImpl: GetTopRatedMoviesListUseCase {
    private let moviesListRepository: MoviesListRepository

    init(moviesListRepository: MoviesListRepository) {
        self.moviesListRepository = moviesListRepository
    }

    func getTopRatedMoviesListUseCase(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void) {
        moviesListRepository.getTopRatedMoviesList { result in
            completion(result)
        }
    }
}

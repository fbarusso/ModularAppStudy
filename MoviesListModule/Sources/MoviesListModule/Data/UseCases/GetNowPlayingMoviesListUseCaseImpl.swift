//
//  GetNowPlayingMoviesListUseCaseImpl.swift
//
//
//  Created by MB Labs on 07/02/24.
//

import Foundation

class GetNowPlayingMoviesListUseCaseImpl: GetNowPlayingMoviesListUseCase {
    private let moviesListRepository: MoviesListRepository

    init(moviesListRepository: MoviesListRepository) {
        self.moviesListRepository = moviesListRepository
    }

    func getNowPlayingMoviesList(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void) {
        moviesListRepository.getNowPlayingMoviesList { result in
            completion(result)
        }
    }
}

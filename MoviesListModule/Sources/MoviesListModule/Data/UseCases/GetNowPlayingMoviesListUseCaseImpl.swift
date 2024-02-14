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

    func getNowPlayingMoviesList(completion: @escaping (_ nowPlayingMoviesList: [MovieEntity]?, _ success: Bool, _ error: String?) -> Void) {
        moviesListRepository.getNowPlayingMoviesList { nowPlayingMoviesList, success, error in
            completion(nowPlayingMoviesList, success, error)
        }
    }
}

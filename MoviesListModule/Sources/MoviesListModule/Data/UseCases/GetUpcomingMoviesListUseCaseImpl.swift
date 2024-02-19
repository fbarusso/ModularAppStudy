//
//  GetUpcomingMoviesListUseCaseImpl.swift
//  
//
//  Created by MB Labs on 19/02/24.
//

import Foundation

class GetUpcomingMoviesListUseCaseImpl: GetUpcomingMoviesListUseCase {
    private let moviesListRepository: MoviesListRepository

    init(moviesListRepository: MoviesListRepository) {
        self.moviesListRepository = moviesListRepository
    }
    
    func getUpcomingMoviesListUseCase(completion: @escaping (Result<[MovieEntity], NSError>) -> Void) {
        moviesListRepository.getNowPlayingMoviesList { result in
            completion(result)
        }
    }
}

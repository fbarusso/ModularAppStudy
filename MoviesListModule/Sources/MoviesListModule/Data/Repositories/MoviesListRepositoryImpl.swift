//
//  MoviesListRepositoryImpl.swift
//
//
//  Created by MB Labs on 07/02/24.
//

import Foundation

class MoviesListRepositoryImpl: MoviesListRepository {
    private let moviesListDataSource: MoviesListDataSource

    init(moviesListDataSource: MoviesListDataSource) {
        self.moviesListDataSource = moviesListDataSource
    }
    
    func getUserName(completion: @escaping (_ userName: String?) -> Void) {
        moviesListDataSource.getUserName { userName in
            completion(userName)
        }
    }

    func getNowPlayingMoviesList(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void) {
        moviesListDataSource.getNowPlayingMoviesList { result in
            completion(result)
        }
    }

    func getPopularMoviesList(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void) {
        moviesListDataSource.getPopularMoviesList { result in
            completion(result)
        }
    }
}

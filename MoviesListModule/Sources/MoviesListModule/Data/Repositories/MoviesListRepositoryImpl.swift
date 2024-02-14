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

    func getNowPlayingMoviesList(completion: @escaping (_ nowPlayingMoviesList: [MovieEntity]?, _ success: Bool, _ error: String?) -> Void) {
        moviesListDataSource.getNowPlayingMoviesList { nowPlayingMoviesList, success, error in
            completion(nowPlayingMoviesList, success, error)
        }
    }

    func getPopularMoviesList(completion: @escaping (_ popularMoviesList: [MovieEntity]?, _ success: Bool, _ error: String?) -> Void) {
        moviesListDataSource.getPopularMoviesList { popularMoviesList, success, error in
            completion(popularMoviesList, success, error)
        }
    }
}

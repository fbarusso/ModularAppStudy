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
    
    func getMoviesList(completion: @escaping (_ moviesList: [MovieEntity]?, _ success: Bool, _ error: String?) -> Void) {
        moviesListDataSource.getMoviesList { moviesList, success, error in
            completion(moviesList, success, error)
        }
    }
}

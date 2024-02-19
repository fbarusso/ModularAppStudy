//
//  MoviesListDataSource.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation

protocol MoviesListDataSource {
    func getNowPlayingMoviesList(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void)
    func getPopularMoviesList(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void)
}

//
//  MoviesListDataSource.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation

protocol MoviesListDataSource {
    func getNowPlayingMoviesList(completion: @escaping (_ nowPlayingMoviesList: [MovieEntity]?, _ success: Bool, _ error: String?) -> Void)
    func getPopularMoviesList(completion: @escaping (_ popularMoviesList: [MovieEntity]?, _ success: Bool, _ error: String?) -> Void)
}

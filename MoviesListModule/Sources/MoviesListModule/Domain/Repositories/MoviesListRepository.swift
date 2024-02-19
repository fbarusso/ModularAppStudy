//
//  MoviesListRepository.swift
//
//
//  Created by MB Labs on 07/02/24.
//

import Foundation

protocol MoviesListRepository {
    func getUserName(completion: @escaping (_ userName: String?) -> Void)
    func getNowPlayingMoviesList(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void)
    func getTopRatedMoviesList(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void)
    func getUpcomingMoviesList(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void)
}

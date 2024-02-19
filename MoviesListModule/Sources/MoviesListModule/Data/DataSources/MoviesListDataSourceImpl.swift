//
//  MoviesListDataSourceImpl.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation
import NetworkModule

class MoviesListDataSourceImpl: MoviesListDataSource {
    func getNowPlayingMoviesList(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void) {
        Network.sharedInstance.request(responseType: [MovieEntity].self, path: "/movie/now_playing?language=pt-BR&page=1") { result in
            completion(result)
        }
    }

    func getPopularMoviesList(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void) {
        Network.sharedInstance.request(responseType: [MovieEntity].self, path: "/movie/popular?language=pt-BR&page=1") { result in
            completion(result)
        }
    }
}

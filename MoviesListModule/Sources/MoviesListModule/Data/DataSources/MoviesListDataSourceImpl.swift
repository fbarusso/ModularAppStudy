//
//  MoviesListDataSourceImpl.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation
import NetworkModule

class MoviesListDataSourceImpl: MoviesListDataSource {
    func getUserName(completion: @escaping (_ userName: String?) -> Void) {
        completion(UserDefaults.standard.string(forKey: UserDefaultsKeys.userName))
    }
    
    func getNowPlayingMoviesList(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void) {
        Network.sharedInstance.request(responseType: [MovieEntity].self, path: "/movie/now_playing?language=pt-BR&page=1") { result in
            completion(result)
        }
    }

    func getTopRatedMoviesList(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void) {
        Network.sharedInstance.request(responseType: [MovieEntity].self, path: "/movie/top_rated?language=pt-BR&page=1") { result in
            completion(result)
        }
    }
    
    func getUpcomingMoviesList(completion: @escaping (Result<[MovieEntity], NSError>) -> Void) {
        Network.sharedInstance.request(responseType: [MovieEntity].self, path: "/movie/upcoming?language=pt-BR&page=1") { result in
            completion(result)
        }
    }
}

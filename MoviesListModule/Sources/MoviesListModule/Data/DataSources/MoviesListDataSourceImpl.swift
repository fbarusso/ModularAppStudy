//
//  MoviesListDataSourceImpl.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation
import NetworkModule

class MoviesListDataSourceImpl: MoviesListDataSource {
    func getNowPlayingMoviesList(completion: @escaping (_ nowPlayingMoviesList: [MovieEntity]?, _ success: Bool, _ error: String?) -> Void) {
        Network.sharedInstance.request(path: "/movie/now_playing?language=pt-BR&page=1", method: .get) { _, data, error in
            if let error = error {
                completion(nil, false, error.localizedDescription)
            } else {
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(NetworkResponse<[MovieEntity]>.self, from: data)
                    completion(decodedData.results, true, nil)
                } catch {
                    completion(nil, false, error.localizedDescription)
                }
            }
        }
    }

    func getPopularMoviesList(completion: @escaping ([MovieEntity]?, Bool, String?) -> Void) {
        Network.sharedInstance.request(path: "/movie/popular?language=pt-BR&page=1", method: .get) { _, data, error in
            if let error = error {
                completion(nil, false, error.localizedDescription)
            } else {
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(NetworkResponse<[MovieEntity]>.self, from: data)
                    completion(decodedData.results, true, nil)
                } catch {
                    completion(nil, false, error.localizedDescription)
                }
            }
        }
    }
}

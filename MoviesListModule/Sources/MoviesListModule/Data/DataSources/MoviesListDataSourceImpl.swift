//
//  MoviesListDatasourceImpl.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation
import NetworkModule

class MoviesListDataSourceImpl: MoviesListDataSource {
    func getMoviesList(completion: @escaping ([[String : AnyObject]]?, Bool, String?) -> Void) {
        Network.sharedInstance.request(path: "/movie/popular", requestType: .get, requestParameters: ["language": "en-US", "page": "1"]) { response, data, error in
            if let error = error {
                completion(nil, false, error.localizedDescription)
            } else {
                completion(nil, false, "Hello world")
            }
        }
    }
}

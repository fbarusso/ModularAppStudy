//
//  MoviesListDataSource.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation

protocol MoviesListDataSource {
    func getMoviesList(completion: @escaping (_ moviesList: [MovieEntity]?, _ success: Bool, _ error: String?) -> Void)
}

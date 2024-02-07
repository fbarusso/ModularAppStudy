//
//  GetMoviesListUseCase.swift
//
//
//  Created by MB Labs on 07/02/24.
//

import Foundation

protocol GetMoviesListUseCase {
    func getMoviesList(completion: @escaping (_ moviesList: [MovieEntity]?, _ success: Bool, _ error: String?) -> Void)
}

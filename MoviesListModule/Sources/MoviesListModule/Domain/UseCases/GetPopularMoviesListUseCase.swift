//
//  GetPopularMoviesListUseCase.swift
//  
//
//  Created by MB Labs on 09/02/24.
//

import Foundation

protocol GetPopularMoviesListUseCase {
    func getPopularMoviesListUseCase(completion: @escaping (_ popularMoviesList: [MovieEntity]?, _ success: Bool, _ error: String?) -> Void)
}

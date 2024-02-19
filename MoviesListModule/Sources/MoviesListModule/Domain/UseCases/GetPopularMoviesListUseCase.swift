//
//  GetPopularMoviesListUseCase.swift
//
//
//  Created by MB Labs on 09/02/24.
//

import Foundation

protocol GetPopularMoviesListUseCase {
    func getPopularMoviesListUseCase(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void)
}

//
//  GetTopRatedMoviesListUseCase.swift
//
//
//  Created by MB Labs on 09/02/24.
//

import Foundation

protocol GetTopRatedMoviesListUseCase {
    func getTopRatedMoviesListUseCase(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void)
}

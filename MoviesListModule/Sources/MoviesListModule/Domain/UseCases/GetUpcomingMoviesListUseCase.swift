//
//  GetUpcomingMoviesListUseCase.swift
//
//
//  Created by MB Labs on 19/02/24.
//

import Foundation

protocol GetUpcomingMoviesListUseCase {
    func getUpcomingMoviesListUseCase(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void)
}

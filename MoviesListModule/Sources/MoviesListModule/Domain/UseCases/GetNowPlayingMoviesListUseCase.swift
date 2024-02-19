//
//  GetNowPlayingMoviesListUseCase.swift
//
//
//  Created by MB Labs on 07/02/24.
//

import Foundation

protocol GetNowPlayingMoviesListUseCase {
    func getNowPlayingMoviesList(completion: @escaping (_ result: Result<[MovieEntity], NSError>) -> Void)
}

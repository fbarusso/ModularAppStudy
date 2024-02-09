//
//  GetNowPlayingMoviesListUseCase.swift
//
//
//  Created by MB Labs on 07/02/24.
//

import Foundation

protocol GetNowPlayingMoviesListUseCase {
    func getNowPlayingMoviesList(completion: @escaping (_ nowPlayingMoviesList: [MovieEntity]?, _ success: Bool, _ error: String?) -> Void)
}

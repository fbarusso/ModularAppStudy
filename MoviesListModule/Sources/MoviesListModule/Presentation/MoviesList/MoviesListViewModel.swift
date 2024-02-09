//
//  MoviesListViewModel.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation

protocol MoviesListViewModelDelegate {
    func didGetNowPlayingMoviesList()
}

class MoviesListViewModel {
    
    var delegate: MoviesListViewModelDelegate?
    
    private let getNowPlayingMoviesListUseCase: GetNowPlayingMoviesListUseCase
    
    var nowPlayingMoviesList: [MovieEntity] = []
    
    init(getNowPlayingMoviesListUseCase: GetNowPlayingMoviesListUseCase) {
        self.getNowPlayingMoviesListUseCase = getNowPlayingMoviesListUseCase
    }
    
    func getNowPlayingMoviesList() {
        getNowPlayingMoviesListUseCase.getNowPlayingMoviesList { nowPlayingMoviesList, success, error in
            guard let nowPlayingMoviesList = nowPlayingMoviesList else { return }
            self.nowPlayingMoviesList = nowPlayingMoviesList
            self.delegate?.didGetNowPlayingMoviesList()
        }
    }
}

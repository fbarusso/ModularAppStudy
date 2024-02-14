//
//  MoviesListViewModel.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation

protocol MoviesListViewModelDelegate: AnyObject {
    func didGetNowPlayingMoviesList()
    func didGetPopularMoviesList()
}

class MoviesListViewModel {
    weak var delegate: MoviesListViewModelDelegate?

    private let getNowPlayingMoviesListUseCase: GetNowPlayingMoviesListUseCase
    private let getPopularMoviesListUseCase: GetPopularMoviesListUseCase

    var nowPlayingMoviesList: [MovieEntity] = []
    var popularMoviesList: [MovieEntity] = []

    init(getNowPlayingMoviesListUseCase: GetNowPlayingMoviesListUseCase, getPopularMoviesListUseCase: GetPopularMoviesListUseCase) {
        self.getNowPlayingMoviesListUseCase = getNowPlayingMoviesListUseCase
        self.getPopularMoviesListUseCase = getPopularMoviesListUseCase
    }

    func getNowPlayingMoviesList() {
        getNowPlayingMoviesListUseCase.getNowPlayingMoviesList { nowPlayingMoviesList, _, _ in
            guard let nowPlayingMoviesList else { return }
            self.nowPlayingMoviesList = nowPlayingMoviesList
            self.delegate?.didGetNowPlayingMoviesList()
        }
    }

    func getPopularMoviesList() {
        getPopularMoviesListUseCase.getPopularMoviesListUseCase { popularMoviesList, _, _ in
            guard let popularMoviesList else { return }
            self.popularMoviesList = popularMoviesList
            self.delegate?.didGetPopularMoviesList()
        }
    }
}

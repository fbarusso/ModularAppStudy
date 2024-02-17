//
//  MoviesListViewModel.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation
import UIKitModule

protocol MoviesListViewModelDelegate: BaseViewModelDelegate {
    func didGetInitialData()
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

    func getInitialData() {
        delegate?.setIsLoading(true)
        let dispatchGroup = DispatchGroup()
        getNowPlayingMoviesList(dispatchGroup: dispatchGroup)
        getPopularMoviesList(dispatchGroup: dispatchGroup)
        dispatchGroup.notify(queue: .main) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.delegate?.didGetInitialData()
                self.delegate?.setIsLoading(false)
            }
        }
    }

    private func getNowPlayingMoviesList(dispatchGroup: DispatchGroup) {
        dispatchGroup.enter()
        getNowPlayingMoviesListUseCase.getNowPlayingMoviesList { nowPlayingMoviesList, success, error in
            switch success {
            case true:
                guard let nowPlayingMoviesList else { return }
                self.nowPlayingMoviesList = nowPlayingMoviesList
            case false:
                if let error {
                    self.delegate?.showMessage(title: "Erro", message: error)
                }
                self.delegate?.showMessage(title: "Erro", message: "Ocorreu um erro.")
            }
            dispatchGroup.leave()
        }
    }

    private func getPopularMoviesList(dispatchGroup: DispatchGroup) {
        dispatchGroup.enter()
        getPopularMoviesListUseCase.getPopularMoviesListUseCase { popularMoviesList, success, error in
            switch success {
            case true:
                guard let popularMoviesList else { return }
                self.popularMoviesList = popularMoviesList
            case false:
                if let error {
                    self.delegate?.showMessage(title: "Erro", message: error)
                }
                self.delegate?.showMessage(title: "Erro", message: "Ocorreu um erro.")
            }
            dispatchGroup.leave()
        }
    }
}

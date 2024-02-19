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
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.delegate?.didGetInitialData()
                self.delegate?.setIsLoading(false)
            }
        }
    }

    private func getNowPlayingMoviesList(dispatchGroup: DispatchGroup) {
        dispatchGroup.enter()
        getNowPlayingMoviesListUseCase.getNowPlayingMoviesList { result in
            switch result {
            case let .success(data):
                self.nowPlayingMoviesList = data
            case let .failure(error):
                self.delegate?.showMessage(title: "Erro", message: error.localizedDescription)
            }
            dispatchGroup.leave()
        }
    }

    private func getPopularMoviesList(dispatchGroup: DispatchGroup) {
        dispatchGroup.enter()
        getPopularMoviesListUseCase.getPopularMoviesListUseCase { result in
            switch result {
            case let .success(data):
                self.popularMoviesList = data
            case let .failure(error):
                self.delegate?.showMessage(title: "Erro", message: error.localizedDescription)
            }
            dispatchGroup.leave()
        }
    }
}

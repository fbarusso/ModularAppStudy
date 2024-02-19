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

    private let getUserNameUseCase: GetUserNameUseCase
    private let getNowPlayingMoviesListUseCase: GetNowPlayingMoviesListUseCase
    private let getTopRatedMoviesListUseCase: GetTopRatedMoviesListUseCase
    private let getUpcomingMoviesListUseCase: GetUpcomingMoviesListUseCase

    var userName: String?
    var nowPlayingMoviesList: [MovieEntity] = []
    var topRatedMoviesList: [MovieEntity] = []
    var upcomingMoviesList: [MovieEntity] = []

    init(getUserNameUseCase: GetUserNameUseCase, getNowPlayingMoviesListUseCase: GetNowPlayingMoviesListUseCase, getTopRatedMoviesListUseCase: GetTopRatedMoviesListUseCase, getUpcomingMoviesListUseCase: GetUpcomingMoviesListUseCase) {
        self.getUserNameUseCase = getUserNameUseCase
        self.getNowPlayingMoviesListUseCase = getNowPlayingMoviesListUseCase
        self.getTopRatedMoviesListUseCase = getTopRatedMoviesListUseCase
        self.getUpcomingMoviesListUseCase = getUpcomingMoviesListUseCase
    }

    func getInitialData() {
        delegate?.setIsLoading(true)
        let dispatchGroup = DispatchGroup()

        getUserName(dispatchGroup: dispatchGroup)
        getNowPlayingMoviesList(dispatchGroup: dispatchGroup)
        getTopRatedMoviesList(dispatchGroup: dispatchGroup)
        getUpcomingMoviesList(dispatchGroup: dispatchGroup)

        dispatchGroup.notify(queue: .main) {
            // TODO: For aesthetic purposes only, remove after
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.delegate?.didGetInitialData()
                self.delegate?.setIsLoading(false)
            }
        }
    }

    private func getUserName(dispatchGroup: DispatchGroup) {
        dispatchGroup.enter()
        getUserNameUseCase.getUserName { userName in
            self.userName = userName
            dispatchGroup.leave()
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

    private func getTopRatedMoviesList(dispatchGroup: DispatchGroup) {
        dispatchGroup.enter()
        getTopRatedMoviesListUseCase.getTopRatedMoviesListUseCase { result in
            switch result {
            case let .success(data):
                self.topRatedMoviesList = data
            case let .failure(error):
                self.delegate?.showMessage(title: "Erro", message: error.localizedDescription)
            }
            dispatchGroup.leave()
        }
    }

    private func getUpcomingMoviesList(dispatchGroup: DispatchGroup) {
        dispatchGroup.enter()
        getUpcomingMoviesListUseCase.getUpcomingMoviesListUseCase { result in
            switch result {
            case let .success(data):
                self.upcomingMoviesList = data
            case let .failure(error):
                self.delegate?.showMessage(title: "Erro", message: error.localizedDescription)
            }
            dispatchGroup.leave()
        }
    }
}

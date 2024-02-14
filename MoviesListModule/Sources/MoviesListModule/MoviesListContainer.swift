//
//  MoviesListContainer.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Swinject
import UIKit

public enum MoviesListContainer {
    static var sharedContainer = Container()

    public static func createModule() -> UIViewController {
        registerCoordinator()
        registerDataSource()
        registerRepository()
        registerUseCases()
        registerViewModels()
        return MoviesListViewController()
    }

    private static func registerCoordinator() {
        MoviesListContainer.sharedContainer.register(MoviesListCoordinator.self) { _ in
            MoviesListCoordinator()
        }
    }

    private static func registerDataSource() {
        MoviesListContainer.sharedContainer.register(MoviesListDataSource.self) { _ in
            MoviesListDataSourceImpl()
        }
    }

    private static func registerRepository() {
        MoviesListContainer.sharedContainer.register(MoviesListRepository.self) { resolver in
            let moviesListDataSource = resolver.resolve(MoviesListDataSource.self)!
            return MoviesListRepositoryImpl(moviesListDataSource: moviesListDataSource)
        }
    }

    private static func registerUseCases() {
        MoviesListContainer.sharedContainer.register(GetNowPlayingMoviesListUseCase.self) { resolver in
            let moviesListRepository = resolver.resolve(MoviesListRepository.self)!
            return GetNowPlayingMoviesListUseCaseImpl(moviesListRepository: moviesListRepository)
        }

        MoviesListContainer.sharedContainer.register(GetPopularMoviesListUseCase.self) { resolver in
            let moviesListRepository = resolver.resolve(MoviesListRepository.self)!
            return GetPopularMoviesListUseCaseImpl(moviesListRepository: moviesListRepository)
        }
    }

    private static func registerViewModels() {
        MoviesListContainer.sharedContainer.register(MoviesListViewModel.self) { resolver in
            let getNowPlayingMoviesListUseCase = resolver.resolve(GetNowPlayingMoviesListUseCase.self)!
            let getPopularMoviesListUseCase = resolver.resolve(GetPopularMoviesListUseCase.self)!
            return MoviesListViewModel(getNowPlayingMoviesListUseCase: getNowPlayingMoviesListUseCase, getPopularMoviesListUseCase: getPopularMoviesListUseCase)
        }
    }
}

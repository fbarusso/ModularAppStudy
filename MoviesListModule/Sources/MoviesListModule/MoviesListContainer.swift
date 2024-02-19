//
//  MoviesListContainer.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Swinject
import UIKit

public enum MoviesListContainer {
    static var shared = Container()

    public static func createModule() -> UIViewController {
        registerDataSource()
        registerRepository()
        registerUseCases()
        registerViewModels()
        return MoviesListViewController()
    }

    private static func registerDataSource() {
        MoviesListContainer.shared.register(MoviesListDataSource.self) { _ in
            MoviesListDataSourceImpl()
        }
    }

    private static func registerRepository() {
        MoviesListContainer.shared.register(MoviesListRepository.self) { resolver in
            let moviesListDataSource = resolver.resolve(MoviesListDataSource.self)!
            return MoviesListRepositoryImpl(moviesListDataSource: moviesListDataSource)
        }
    }

    private static func registerUseCases() {
        MoviesListContainer.shared.register(GetUserNameUseCase.self) { resolver in
            let moviesListRepository = resolver.resolve(MoviesListRepository.self)!
            return GetUserNameUseCaseImpl(moviesListRepository: moviesListRepository)
        }
        
        MoviesListContainer.shared.register(GetNowPlayingMoviesListUseCase.self) { resolver in
            let moviesListRepository = resolver.resolve(MoviesListRepository.self)!
            return GetNowPlayingMoviesListUseCaseImpl(moviesListRepository: moviesListRepository)
        }

        MoviesListContainer.shared.register(GetPopularMoviesListUseCase.self) { resolver in
            let moviesListRepository = resolver.resolve(MoviesListRepository.self)!
            return GetPopularMoviesListUseCaseImpl(moviesListRepository: moviesListRepository)
        }
    }

    private static func registerViewModels() {
        MoviesListContainer.shared.register(MoviesListViewModel.self) { resolver in
            let getUserNameUseCase = resolver.resolve(GetUserNameUseCase.self)!
            let getNowPlayingMoviesListUseCase = resolver.resolve(GetNowPlayingMoviesListUseCase.self)!
            let getPopularMoviesListUseCase = resolver.resolve(GetPopularMoviesListUseCase.self)!
            return MoviesListViewModel(getUserNameUseCase: getUserNameUseCase, getNowPlayingMoviesListUseCase: getNowPlayingMoviesListUseCase, getPopularMoviesListUseCase: getPopularMoviesListUseCase)
        }
    }
}

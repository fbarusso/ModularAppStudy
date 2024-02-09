//
//  MoviesListContainer.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import UIKit
import Swinject

public class MoviesListContainer {
    static var sharedContainer = Container()
    
    public static func createModule() -> UIViewController {
        MoviesListContainer.sharedContainer.register(MoviesListDataSource.self) { _ in
            MoviesListDataSourceImpl()
        }
        
        MoviesListContainer.sharedContainer.register(MoviesListRepository.self) { resolver in
            let moviesListDataSource = resolver.resolve(MoviesListDataSource.self)!
            return MoviesListRepositoryImpl(moviesListDataSource: moviesListDataSource)
        }
        
        MoviesListContainer.sharedContainer.register(GetNowPlayingMoviesListUseCase.self) { resolver in
            let moviesListRepository = resolver.resolve(MoviesListRepository.self)!
            return GetNowPlayingMoviesListUseCaseImpl(moviesListRepository: moviesListRepository)
        }
        
        MoviesListContainer.sharedContainer.register(MoviesListViewModel.self) { resolver in
            let getNowPlayingMoviesListUseCase = resolver.resolve(GetNowPlayingMoviesListUseCase.self)!
            return MoviesListViewModel(getNowPlayingMoviesListUseCase: getNowPlayingMoviesListUseCase)
        }
        
        return MoviesListViewController()
    }
}

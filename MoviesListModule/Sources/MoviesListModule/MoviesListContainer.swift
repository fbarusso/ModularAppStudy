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
        
        MoviesListContainer.sharedContainer.register(GetMoviesListUseCase.self) { resolver in
            let moviesListRepository = resolver.resolve(MoviesListRepository.self)!
            return GetMoviesListUseCaseImpl(moviesListRepository: moviesListRepository)
        }
        
        MoviesListContainer.sharedContainer.register(MoviesListViewModel.self) { resolver in
            let getMoviesListUseCase = resolver.resolve(GetMoviesListUseCase.self)!
            return MoviesListViewModel(getMoviesListUseCase: getMoviesListUseCase)
        }
        
        return MoviesListViewController()
    }
}

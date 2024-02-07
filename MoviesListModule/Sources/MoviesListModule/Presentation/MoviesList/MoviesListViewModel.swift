//
//  MoviesListViewModel.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation

class MoviesListViewModel {
    
    private let getMoviesListUseCase: GetMoviesListUseCase
    
    init(getMoviesListUseCase: GetMoviesListUseCase) {
        self.getMoviesListUseCase = getMoviesListUseCase
    }
    
    func getMoviesList() {
        getMoviesListUseCase.getMoviesList { moviesList, success, error in
            print(3)
        }
    }
}

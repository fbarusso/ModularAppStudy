//
//  MoviesListViewModel.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation

protocol MoviesListViewModelDelegate {
    func didGetMoviesList()
}

class MoviesListViewModel {
    
    var delegate: MoviesListViewModelDelegate?
    
    private let getMoviesListUseCase: GetMoviesListUseCase
    
    var moviesList: [MovieEntity] = []
    
    init(getMoviesListUseCase: GetMoviesListUseCase) {
        self.getMoviesListUseCase = getMoviesListUseCase
    }
    
    func getMoviesList() {
        getMoviesListUseCase.getMoviesList { moviesList, success, error in
            guard let moviesList = moviesList else { return }
            self.moviesList = moviesList
            self.delegate?.didGetMoviesList()
        }
    }
}

//
//  MoviesListViewController.swift
//  
//
//  Created by MB Labs on 06/02/24.
//

import UIKit

class MoviesListViewController: UIViewController {

    private let viewModel = MoviesListContainer.sharedContainer.resolve(MoviesListViewModel.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.getMoviesList()
    }
}

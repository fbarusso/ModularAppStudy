//
//  MoviesListViewController.swift
//  
//
//  Created by MB Labs on 06/02/24.
//

import UIKit
import UIKitModule

class MoviesListViewController: UIViewController {

    private let viewModel = MoviesListContainer.sharedContainer.resolve(MoviesListViewModel.self)
    
    private let moviesListTableView = UITableView()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.getMoviesList()
        viewModel?.delegate = self
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Em cartaz"
        
        view.addSubview(moviesListTableView)
        moviesListTableView.fillSuperview(padding: UIConstants.smallVerticalPadding)
        moviesListTableView.delegate = self
        moviesListTableView.dataSource = self
        moviesListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.moviesList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel?.moviesList[indexPath.row].originalTitle
        return cell
    }
}

extension MoviesListViewController: MoviesListViewModelDelegate {
    func didGetMoviesList() {
        //moviesListTableView.reloadData()
    }
}

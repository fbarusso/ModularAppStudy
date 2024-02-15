//
//  MoviesListViewController.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import CoordinatorModule
import UIKit
import UIKitModule

class MoviesListViewController: BaseViewController {
    // MARK: - Properties

    private let viewModel = MoviesListContainer.shared.resolve(MoviesListViewModel.self)!
    private let collectionViewHeight = 200.0
    private let collectionViewCellWidthRatio = 0.66

    // MARK: - Components

    private var nowPlayingLabel: UILabel = {
        let label = UILabel()

        label.text = "Em cartaz"
        label.font = .systemFont(ofSize: FontSize.big, weight: .bold)
        label.textColor = UIColor(customColor: .themeLight)

        return label
    }()

    private let nowPlayingMoviesListCollectionView = CustomCarousel(scrollDirection: .horizontal)

    private var popularLabel: UILabel = {
        let label = UILabel()

        label.text = "Populares"
        label.font = .systemFont(ofSize: FontSize.big, weight: .bold)
        label.textColor = UIColor(customColor: .themeLight)

        return label
    }()

    private let popularMoviesListCollectionView = CustomCarousel(scrollDirection: .horizontal)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        viewModel.delegate = self
        viewModel.getNowPlayingMoviesList()
        viewModel.getPopularMoviesList()
    }

    // MARK: - Helpers

    private func setupView() {
        view.addSubview(nowPlayingLabel)
        nowPlayingLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: VerticalPadding.medium, paddingLeft: HorizontalPadding.small, paddingRight: HorizontalPadding.small)

        view.addSubview(nowPlayingMoviesListCollectionView)
        nowPlayingMoviesListCollectionView.anchor(top: nowPlayingLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: VerticalPadding.medium, height: collectionViewHeight)

        nowPlayingMoviesListCollectionView.delegate = self
        nowPlayingMoviesListCollectionView.dataSource = self
        nowPlayingMoviesListCollectionView.register(MoviesListCollectionViewCell.self, forCellWithReuseIdentifier: MoviesListCollectionViewCell.nowPlayingMoviesListReuseIdentifier)

        view.addSubview(popularLabel)
        popularLabel.anchor(top: nowPlayingMoviesListCollectionView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: VerticalPadding.medium, paddingLeft: HorizontalPadding.small, paddingRight: HorizontalPadding.small)

        view.addSubview(popularMoviesListCollectionView)
        popularMoviesListCollectionView.anchor(top: popularLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: VerticalPadding.medium, height: collectionViewHeight)

        popularMoviesListCollectionView.delegate = self
        popularMoviesListCollectionView.dataSource = self
        popularMoviesListCollectionView.register(MoviesListCollectionViewCell.self, forCellWithReuseIdentifier: MoviesListCollectionViewCell.popularMoviesListReuseIdentifier)
    }
}

// MARK: - UICollectionView protocols

extension MoviesListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        collectionView == nowPlayingMoviesListCollectionView ? viewModel.nowPlayingMoviesList.count : viewModel.popularMoviesList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == nowPlayingMoviesListCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesListCollectionViewCell.nowPlayingMoviesListReuseIdentifier, for: indexPath) as! MoviesListCollectionViewCell

            cell.setup(movieEntity: viewModel.nowPlayingMoviesList[indexPath.row])

            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesListCollectionViewCell.popularMoviesListReuseIdentifier, for: indexPath) as! MoviesListCollectionViewCell

            cell.setup(movieEntity: viewModel.popularMoviesList[indexPath.row])

            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = height * collectionViewCellWidthRatio
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieEntity = collectionView == nowPlayingMoviesListCollectionView ? viewModel.nowPlayingMoviesList[indexPath.row] : viewModel.popularMoviesList[indexPath.row]
        CoordinatorSingleton.navigate(viewController: MovieDetailsViewController(movieEntity: movieEntity))
    }
}

// MARK: - ViewModel delegate

extension MoviesListViewController: MoviesListViewModelDelegate {
    func didGetNowPlayingMoviesList() {
        nowPlayingMoviesListCollectionView.reloadData()
    }

    func didGetPopularMoviesList() {
        popularMoviesListCollectionView.reloadData()
    }
}

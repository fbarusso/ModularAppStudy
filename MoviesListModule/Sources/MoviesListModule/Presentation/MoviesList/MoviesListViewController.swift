//
//  MoviesListViewController.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import UIKit
import UIKitModule

class MoviesListViewController: UIViewController {
    // MARK: - Properties

    private let coordinator = MoviesListContainer.shared.resolve(MoviesListCoordinator.self)
    private let viewModel = MoviesListContainer.shared.resolve(MoviesListViewModel.self)!
    private let collectionViewHeigth = 200.0
    private let collectionViewCellWidthRatio = 0.66

    // MARK: - Components

    private var nowPlayingLabel: UILabel = {
        let label = UILabel()

        label.text = "Em cartaz"
        label.font = .systemFont(ofSize: FontSize.big, weight: .bold)
        label.textColor = UIColor(customColor: .themeLight)

        return label
    }()

    private var nowPlayingMoviesListCollectionView: UICollectionView?

    private var popularLabel: UILabel = {
        let label = UILabel()

        label.text = "Populares"
        label.font = .systemFont(ofSize: FontSize.big, weight: .bold)
        label.textColor = UIColor(customColor: .themeLight)

        return label
    }()

    private var popularMoviesListCollectionView: UICollectionView?

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
        view.backgroundColor = UIColor(customColor: .themeDark)

        view.addSubview(nowPlayingLabel)
        nowPlayingLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: VerticalPadding.medium, paddingLeft: HorizontalPadding.small, paddingRight: HorizontalPadding.small)

        setupNowPlayingMoviesListCollectionView()
    }

    private func setupNowPlayingMoviesListCollectionView() {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.minimumLineSpacing = VerticalPadding.medium
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: VerticalPadding.small, bottom: 0, right: VerticalPadding.small)

        nowPlayingMoviesListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        guard let nowPlayingMoviesListCollectionView else { return }

        nowPlayingMoviesListCollectionView.showsHorizontalScrollIndicator = false
        nowPlayingMoviesListCollectionView.backgroundColor = .clear

        view.addSubview(nowPlayingMoviesListCollectionView)
        nowPlayingMoviesListCollectionView.anchor(top: nowPlayingLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: VerticalPadding.medium, height: collectionViewHeigth)

        nowPlayingMoviesListCollectionView.delegate = self
        nowPlayingMoviesListCollectionView.dataSource = self
        nowPlayingMoviesListCollectionView.register(MoviesListCollectionViewCell.self, forCellWithReuseIdentifier: MoviesListCollectionViewCell.nowPlayingMoviesListReuseIdentifier)

        setupPopularMoviesListCollectionView(nowPlayingMoviesListCollectionView: nowPlayingMoviesListCollectionView)
    }

    private func setupPopularMoviesListCollectionView(nowPlayingMoviesListCollectionView: UICollectionView) {
        view.addSubview(popularLabel)
        popularLabel.anchor(top: nowPlayingMoviesListCollectionView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: VerticalPadding.medium, paddingLeft: HorizontalPadding.small, paddingRight: HorizontalPadding.small)

        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.minimumLineSpacing = VerticalPadding.medium
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: VerticalPadding.small, bottom: 0, right: VerticalPadding.small)

        popularMoviesListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        guard let popularMoviesListCollectionView else { return }

        popularMoviesListCollectionView.showsHorizontalScrollIndicator = false
        popularMoviesListCollectionView.backgroundColor = .clear

        view.addSubview(popularMoviesListCollectionView)
        popularMoviesListCollectionView.anchor(top: popularLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: VerticalPadding.medium, height: collectionViewHeigth)

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

    func collectionView(_: UICollectionView, didSelectItemAt _: IndexPath) {
        coordinator?.navigateToMovieDetails()
    }
}

// MARK: - ViewModel delegate

extension MoviesListViewController: MoviesListViewModelDelegate {
    func didGetNowPlayingMoviesList() {
        nowPlayingMoviesListCollectionView?.reloadData()
    }

    func didGetPopularMoviesList() {
        popularMoviesListCollectionView?.reloadData()
    }
}

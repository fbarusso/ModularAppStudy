//
//  MoviesListViewController.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import CoordinatorModule
import SkeletonView
import UIKit
import UIKitModule

class MoviesListViewController: BaseViewController {
    // MARK: - Properties

    private let viewModel = MoviesListContainer.shared.resolve(MoviesListViewModel.self)!
    private let collectionViewHeight = 200.0
    private let collectionViewCellWidthRatio = 0.66

    // MARK: - Components

    private let nowPlayingLabel = CustomLabel(text: "Em cartaz", font: .systemFont(ofSize: FontSize.big, weight: .bold), isSkeletonable: true)
    private let nowPlayingMoviesListCollectionView = CustomCarousel(scrollDirection: .horizontal)
    private var popularLabel = CustomLabel(text: "Populares", font: .systemFont(ofSize: FontSize.big, weight: .bold), isSkeletonable: true)
    private let popularMoviesListCollectionView = CustomCarousel(scrollDirection: .horizontal)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        viewModel.delegate = self
        viewModel.getInitialData()
    }

    // MARK: - Helpers

    private func setupView() {
        view.addSubview(nowPlayingLabel)
        nowPlayingLabel.anchorToViewTop(view: view)

        view.addSubview(nowPlayingMoviesListCollectionView)
        nowPlayingMoviesListCollectionView.anchorBelow(view: nowPlayingLabel, horizontalPadding: .none)
        nowPlayingMoviesListCollectionView.setHeight(collectionViewHeight)

        view.addSubview(popularLabel)
        popularLabel.anchorBelow(view: nowPlayingMoviesListCollectionView)

        view.addSubview(popularMoviesListCollectionView)
        popularMoviesListCollectionView.anchorBelow(view: popularLabel, horizontalPadding: .none)
        popularMoviesListCollectionView.setHeight(collectionViewHeight)

        setupCollectionViews()
    }

    private func setupCollectionViews() {
        nowPlayingMoviesListCollectionView.delegate = self
        nowPlayingMoviesListCollectionView.dataSource = self
        nowPlayingMoviesListCollectionView.register(MoviesListCollectionViewCell.self, forCellWithReuseIdentifier: MoviesListCollectionViewCell.nowPlayingMoviesListReuseIdentifier)

        popularMoviesListCollectionView.delegate = self
        popularMoviesListCollectionView.dataSource = self
        popularMoviesListCollectionView.register(MoviesListCollectionViewCell.self, forCellWithReuseIdentifier: MoviesListCollectionViewCell.popularMoviesListReuseIdentifier)
    }

    override func didSetIsLoading(isLoading: Bool) {
        let views = [nowPlayingLabel, nowPlayingMoviesListCollectionView, popularLabel, popularMoviesListCollectionView]
        isLoading ? showSkeleton(in: views) : hideSkeleton(in: views)
    }
}

// MARK: - SkeletonCollectionViewDataSource

extension MoviesListViewController: SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt _: IndexPath) -> SkeletonView.ReusableCellIdentifier {
        switch skeletonView {
        case nowPlayingMoviesListCollectionView:
            MoviesListCollectionViewCell.nowPlayingMoviesListReuseIdentifier
        default:
            MoviesListCollectionViewCell.popularMoviesListReuseIdentifier
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        switch collectionView {
        case nowPlayingMoviesListCollectionView:
            viewModel.nowPlayingMoviesList.count
        default:
            viewModel.popularMoviesList.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case nowPlayingMoviesListCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesListCollectionViewCell.nowPlayingMoviesListReuseIdentifier, for: indexPath) as! MoviesListCollectionViewCell

            cell.setup(movieEntity: viewModel.nowPlayingMoviesList[indexPath.row])

            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesListCollectionViewCell.popularMoviesListReuseIdentifier, for: indexPath) as! MoviesListCollectionViewCell

            cell.setup(movieEntity: viewModel.popularMoviesList[indexPath.row])

            return cell
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MoviesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = height * collectionViewCellWidthRatio
        return CGSize(width: width, height: height)
    }
}

// MARK: - UICollectionViewDelegate

extension MoviesListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieEntity = collectionView == nowPlayingMoviesListCollectionView ? viewModel.nowPlayingMoviesList[indexPath.row] : viewModel.popularMoviesList[indexPath.row]
        CoordinatorSingleton.navigate(viewController: MovieDetailsViewController(movieEntity: movieEntity))
    }
}

// MARK: - ViewModel delegate

extension MoviesListViewController: MoviesListViewModelDelegate {
    func didGetInitialData() {
        nowPlayingMoviesListCollectionView.reloadData()
        popularMoviesListCollectionView.reloadData()
    }
}

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

class MoviesListViewController: BaseScrollableViewController {
    // MARK: - Properties

    private let viewModel = MoviesListContainer.shared.resolve(MoviesListViewModel.self)!
    private let collectionViewHeight = 200.0
    private let collectionViewCellWidthRatio = 0.66

    // MARK: - Components

    private let userNameLabel = CustomLabel(text: "Batatinha", font: .systemFont(ofSize: FontSize.medium, weight: .bold), isSkeletonable: true)
    private let nowPlayingLabel = CustomLabel(text: "Em cartaz", font: .systemFont(ofSize: FontSize.big, weight: .bold), isSkeletonable: true)
    private let nowPlayingMoviesListCollectionView = CustomCarousel(scrollDirection: .horizontal)
    private var popularLabel = CustomLabel(text: "Melhores avaliações", font: .systemFont(ofSize: FontSize.big, weight: .bold), isSkeletonable: true)
    private let topRatedMoviesListCollectionView = CustomCarousel(scrollDirection: .horizontal)
    private var upcomingLabel = CustomLabel(text: "Próximos lançamentos", font: .systemFont(ofSize: FontSize.big, weight: .bold), isSkeletonable: true)
    private let upcomingMoviesListCollectionView = CustomCarousel(scrollDirection: .horizontal)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        viewModel.delegate = self
        viewModel.getInitialData()
    }

    // MARK: - Helpers

    private func setupView() {
        scrollableContentView.isSkeletonable = true
        addSubviewToScrollableContentView(userNameLabel)
        userNameLabel.anchorToViewTop(view: scrollableContentView)
        
        addSubviewToScrollableContentView(nowPlayingLabel)
        nowPlayingLabel.anchorBelow(view: userNameLabel)

        addSubviewToScrollableContentView(nowPlayingMoviesListCollectionView)
        nowPlayingMoviesListCollectionView.anchorBelow(view: nowPlayingLabel, horizontalPadding: .none)
        nowPlayingMoviesListCollectionView.setHeight(collectionViewHeight)

        addSubviewToScrollableContentView(popularLabel)
        popularLabel.anchorBelow(view: nowPlayingMoviesListCollectionView)

        addSubviewToScrollableContentView(topRatedMoviesListCollectionView)
        topRatedMoviesListCollectionView.anchorBelow(view: popularLabel, horizontalPadding: .none)
        topRatedMoviesListCollectionView.setHeight(collectionViewHeight)
        
        addSubviewToScrollableContentView(upcomingLabel)
        upcomingLabel.anchorBelow(view: topRatedMoviesListCollectionView)

        addSubviewToScrollableContentView(upcomingMoviesListCollectionView)
        upcomingMoviesListCollectionView.anchorBelow(view: upcomingLabel, horizontalPadding: .none)
        upcomingMoviesListCollectionView.setHeight(collectionViewHeight)
        
        upcomingMoviesListCollectionView.anchorToSuperviewBottomOnly()

        setupCollectionViews()
    }

    private func setupCollectionViews() {
        nowPlayingMoviesListCollectionView.delegate = self
        nowPlayingMoviesListCollectionView.dataSource = self
        nowPlayingMoviesListCollectionView.register(MoviesListCollectionViewCell.self, forCellWithReuseIdentifier: MoviesListCollectionViewCell.nowPlayingMoviesListReuseIdentifier)

        topRatedMoviesListCollectionView.delegate = self
        topRatedMoviesListCollectionView.dataSource = self
        topRatedMoviesListCollectionView.register(MoviesListCollectionViewCell.self, forCellWithReuseIdentifier: MoviesListCollectionViewCell.topRatedMoviesListReuseIdentifier)
        
        upcomingMoviesListCollectionView.delegate = self
        upcomingMoviesListCollectionView.dataSource = self
        upcomingMoviesListCollectionView.register(MoviesListCollectionViewCell.self, forCellWithReuseIdentifier: MoviesListCollectionViewCell.upcomingMoviesListReuseIdentifier)
    }

    override func didSetIsLoading(isLoading: Bool) {
        isLoading ? scrollableContentView.showDefaultSkeleton() : scrollableContentView.hideDefaultSkeleton()
    }
}

// MARK: - SkeletonCollectionViewDataSource

extension MoviesListViewController: SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt _: IndexPath) -> SkeletonView.ReusableCellIdentifier {
        switch skeletonView {
        case nowPlayingMoviesListCollectionView:
            MoviesListCollectionViewCell.nowPlayingMoviesListReuseIdentifier
        case topRatedMoviesListCollectionView:
            MoviesListCollectionViewCell.topRatedMoviesListReuseIdentifier
        default:
            MoviesListCollectionViewCell.upcomingMoviesListReuseIdentifier
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        switch collectionView {
        case nowPlayingMoviesListCollectionView:
            viewModel.nowPlayingMoviesList.count
        case topRatedMoviesListCollectionView:
            viewModel.topRatedMoviesList.count
        default:
            viewModel.upcomingMoviesList.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case nowPlayingMoviesListCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesListCollectionViewCell.nowPlayingMoviesListReuseIdentifier, for: indexPath) as! MoviesListCollectionViewCell

            cell.setup(movieEntity: viewModel.nowPlayingMoviesList[indexPath.row])

            return cell
        case topRatedMoviesListCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesListCollectionViewCell.topRatedMoviesListReuseIdentifier, for: indexPath) as! MoviesListCollectionViewCell

            cell.setup(movieEntity: viewModel.topRatedMoviesList[indexPath.row])

            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesListCollectionViewCell.upcomingMoviesListReuseIdentifier, for: indexPath) as! MoviesListCollectionViewCell

            cell.setup(movieEntity: viewModel.upcomingMoviesList[indexPath.row])

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
        switch collectionView {
        case nowPlayingMoviesListCollectionView:
            CoordinatorSingleton.navigate(viewController: MovieDetailsViewController(movieEntity: viewModel.nowPlayingMoviesList[indexPath.row]))
        case topRatedMoviesListCollectionView:
            CoordinatorSingleton.navigate(viewController: MovieDetailsViewController(movieEntity: viewModel.topRatedMoviesList[indexPath.row]))
        default:
            CoordinatorSingleton.navigate(viewController: MovieDetailsViewController(movieEntity: viewModel.upcomingMoviesList[indexPath.row]))
        }
    }
}

// MARK: - ViewModel delegate

extension MoviesListViewController: MoviesListViewModelDelegate {
    func didGetInitialData() {
        DispatchQueue.main.async {
            self.userNameLabel.text = ("Olá \(self.viewModel.userName ?? ""), o que vamos assistir hoje?")
            self.nowPlayingMoviesListCollectionView.reloadData()
            self.topRatedMoviesListCollectionView.reloadData()
            self.upcomingMoviesListCollectionView.reloadData()
        }
    }
}

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
    
    private let viewModel = MoviesListContainer.sharedContainer.resolve(MoviesListViewModel.self)
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
    
    // MARK: - Lifecycle
        
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.getNowPlayingMoviesList()
        viewModel?.delegate = self
        setupView()
    }
    
    // MARK: - Helpers
    
    private func setupView() {
        view.backgroundColor = UIColor(customColor: .themeDark)
        
        view.addSubview(nowPlayingLabel)
        nowPlayingLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: VerticalPadding.medium, paddingLeft: HorizontalPadding.small, paddingRight: HorizontalPadding.small)
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.minimumLineSpacing = VerticalPadding.medium
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: VerticalPadding.small, bottom: 0, right: VerticalPadding.small)
        
        nowPlayingMoviesListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        
        guard let collectionView = nowPlayingMoviesListCollectionView else { return }
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        
        view.addSubview(collectionView)
        collectionView.anchor(top: nowPlayingLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: VerticalPadding.medium, height: collectionViewHeigth)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MoviesListCollectionViewCell.self, forCellWithReuseIdentifier: MoviesListCollectionViewCell.reuseIdentifier)
    }
}

// MARK: - UICollectionView protocols

extension MoviesListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.nowPlayingMoviesList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesListCollectionViewCell.reuseIdentifier, for: indexPath) as! MoviesListCollectionViewCell
        
        if let movieEntity = viewModel?.nowPlayingMoviesList[indexPath.row] {
            cell.setup(movieEntity: movieEntity)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = height * collectionViewCellWidthRatio
        return CGSize(width: width, height: height)
    }
}

// MARK: - ViewModel delegate

extension MoviesListViewController: MoviesListViewModelDelegate {
    func didGetNowPlayingMoviesList() {
        nowPlayingMoviesListCollectionView?.reloadData()
    }
}

//
//  MoviesListCollectionViewCell.swift
//
//
//  Created by MB Labs on 09/02/24.
//

import SkeletonView
import UIKit
import UIKitModule

class MoviesListCollectionViewCell: UICollectionViewCell {
    static let nowPlayingMoviesListReuseIdentifier = String(describing: MoviesListCollectionViewCell.self).appending("nowPlayingMoviesList")
    static let topRatedMoviesListReuseIdentifier = String(describing: MoviesListCollectionViewCell.self).appending("topRatedMoviesList")
    static let upcomingMoviesListReuseIdentifier = String(describing: MoviesListCollectionViewCell.self).appending("upcomingMoviesList")

    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        isSkeletonable = true
        contentView.isSkeletonable = true
        contentView.layer.cornerRadius = CornerRadius.small
        contentView.layer.masksToBounds = true
        contentView.addSubview(imageView)
        imageView.isSkeletonable = true
        imageView.fillSuperview()
    }

    override func prepareForReuse() {
        imageView.kf.cancelDownloadTask()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(movieEntity: MovieEntity) {
        imageView.setImageWithCaching(imagePath: movieEntity.posterPath, size: .w400)
    }
}

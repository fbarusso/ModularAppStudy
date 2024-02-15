//
//  MovieDetailsViewController.swift
//
//
//  Created by MB Labs on 14/02/24.
//

import UIKit
import UIKitModule

class MovieDetailsViewController: BaseScrollableViewController {
    // MARK: - Properties

    private let movieEntity: MovieEntity
    private let imageViewHeightRaio = 1.5

    // MARK: - Components

    private let imageView = UIImageView()

    private let titleLabel: UILabel = {
        let label = UILabel()

        label.font = .systemFont(ofSize: FontSize.big, weight: .bold)
        label.textColor = UIColor(customColor: .themeLight)

        return label
    }()

    private let overviewLabel: UILabel = {
        let label = UILabel()

        label.font = .systemFont(ofSize: FontSize.medium)
        label.textColor = UIColor(customColor: .themeLight)
        label.numberOfLines = 0

        return label
    }()

    private let originalTitleLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let voteAverageLabel = UILabel()
    private let voteCountLabel = UILabel()

    // MARK: - Init

    init(movieEntity: MovieEntity) {
        self.movieEntity = movieEntity
        super.init()
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Helpers

    private func setupView() {
        addSubviewToScrollableContentView(imageView)
        imageView.anchor(top: scrollableViewTopAnchor, left: scrollableViewLeftAnchor, right: scrollableViewRightAnchor, height: view.frame.width * imageViewHeightRaio)
        imageView.setImageWithCaching(imagePath: movieEntity.posterPath, size: .original)

        addSubviewToScrollableContentView(titleLabel)
        titleLabel.anchor(top: imageView.bottomAnchor, left: scrollableViewLeftAnchor, right: scrollableViewRightAnchor, paddingTop: VerticalPadding.medium, paddingLeft: HorizontalPadding.small, paddingRight: HorizontalPadding.small)
        titleLabel.text = movieEntity.title

        addSubviewToScrollableContentView(overviewLabel)
        overviewLabel.anchor(top: titleLabel.bottomAnchor, left: scrollableViewLeftAnchor, right: scrollableViewRightAnchor, paddingTop: VerticalPadding.small, paddingLeft: HorizontalPadding.small, paddingRight: HorizontalPadding.small)
        overviewLabel.text = movieEntity.overview

        let movieDetailsStackView = UIStackView(arrangedSubviews: [originalTitleLabel, releaseDateLabel, voteAverageLabel, voteCountLabel])
        movieDetailsStackView.axis = .vertical

        addSubviewToScrollableContentView(movieDetailsStackView)

        movieDetailsStackView.anchor(top: overviewLabel.bottomAnchor, left: scrollableViewLeftAnchor, right: scrollableViewRightAnchor, paddingTop: VerticalPadding.medium, paddingLeft: HorizontalPadding.small, paddingRight: HorizontalPadding.small)

        anchorToScrollableContentViewBottom(view: movieDetailsStackView, padding: VerticalPadding.big)

        setupMovieDetails()
    }

    private func setupMovieDetails() {
        originalTitleLabel.setHalfBold(boldString: "Titulo original: ", regularString: movieEntity.originalTitle)
        releaseDateLabel.setHalfBold(boldString: "Data de lançamento: ", regularString: movieEntity.releaseDate)
        voteAverageLabel.setHalfBold(boldString: "Avaliação média: ", regularString: String(movieEntity.voteAverage))
        voteCountLabel.setHalfBold(boldString: "Número de avaliações: ", regularString: String(movieEntity.voteCount))
    }
}

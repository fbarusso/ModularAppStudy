//
//  MovieDetailsViewController.swift
//
//
//  Created by MB Labs on 14/02/24.
//

import UIKit
import UIKitModule

class MovieDetailsViewController: BaseViewController {
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
        view.addSubview(imageView)
        imageView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: view.frame.width * imageViewHeightRaio)
        imageView.setImageWithCaching(imagePath: movieEntity.posterPath, size: .original)

        view.addSubview(titleLabel)
        titleLabel.anchor(top: imageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: VerticalPadding.medium, paddingLeft: HorizontalPadding.small, paddingRight: HorizontalPadding.small)
        titleLabel.text = movieEntity.title

        view.addSubview(overviewLabel)
        overviewLabel.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: VerticalPadding.small, paddingLeft: HorizontalPadding.small, paddingRight: HorizontalPadding.small)
        overviewLabel.text = movieEntity.overview
    }
}

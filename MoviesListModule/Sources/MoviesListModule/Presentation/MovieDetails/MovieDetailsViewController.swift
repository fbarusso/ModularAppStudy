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
    }
}

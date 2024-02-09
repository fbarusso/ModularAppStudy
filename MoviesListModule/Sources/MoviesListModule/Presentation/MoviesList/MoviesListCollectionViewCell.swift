//
//  MoviesListCollectionViewCell.swift
//  
//
//  Created by MB Labs on 09/02/24.
//

import UIKit

class MoviesListCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: MoviesListCollectionViewCell.self)
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    override func prepareForReuse() {
        imageView.kf.cancelDownloadTask()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(movieEntity: MovieEntity) {
        imageView.setImageWithCaching(imagePath: movieEntity.posterPath, size: .w400)
    }
}

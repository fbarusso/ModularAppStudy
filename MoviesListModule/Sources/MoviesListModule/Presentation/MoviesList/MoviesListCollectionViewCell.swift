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
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(imageView)
        imageView.fillSuperview()
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.backgroundColor = .red
    }
    
}

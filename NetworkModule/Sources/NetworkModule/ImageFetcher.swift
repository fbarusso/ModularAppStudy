//
//  ImageFetcher.swift
//
//
//  Created by MB Labs on 09/02/24.
//


import UIKit
import Kingfisher

public enum ImageSize: String {
    case original = "original/"
    case w400 = "w400/"
}

public extension UIImageView {
    func setImageWithCaching(imagePath: String?, size: ImageSize) {
        guard let imagePath = imagePath else { return }
        let url = URL(string: "\(NetworkConstants.imagesBaseURL)\(size.rawValue)\(imagePath)")
        self.kf.setImage(with: url)
    }
}

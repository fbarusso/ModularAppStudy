//
//  UIImageView.swift
//
//
//  Created by MB Labs on 09/02/24.
//

import Kingfisher
import UIKit

public enum ImageSize: String {
    case original = "original/"
    case w400 = "w400/"
}

public extension UIImageView {
    func setImageWithCaching(imagePath: String?, size: ImageSize) {
        guard let imagePath = imagePath else { return }
        let url = URL(string: "https://image.tmdb.org/t/p/\(size.rawValue)\(imagePath)")
        kf.setImage(with: url)
    }
}

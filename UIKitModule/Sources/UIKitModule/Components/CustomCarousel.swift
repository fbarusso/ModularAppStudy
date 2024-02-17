//
//  CustomCarousel.swift
//
//
//  Created by MB Labs on 15/02/24.
//

import SkeletonView
import UIKit

public class CustomCarousel: UICollectionView {
    public convenience init(minimumLineSpacing: CGFloat = HorizontalPadding.small.rawValue,
                            scrollDirection: ScrollDirection = .horizontal,
                            sectionInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: HorizontalPadding.small.rawValue, bottom: 0, right: HorizontalPadding.small.rawValue),
                            showsHorizontalScrollIndicator: Bool = false,
                            backgroundColor: UIColor = .clear,
                            isSkeletonable: Bool = true)
    {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.minimumLineSpacing = minimumLineSpacing
        collectionViewFlowLayout.scrollDirection = scrollDirection
        collectionViewFlowLayout.sectionInset = sectionInset

        self.init(frame: .zero, collectionViewLayout: collectionViewFlowLayout)

        self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        self.backgroundColor = backgroundColor
        self.isSkeletonable = isSkeletonable
    }
}

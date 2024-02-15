//
//  CustomCarousel.swift
//
//
//  Created by MB Labs on 15/02/24.
//

import UIKit

public class CustomCarousel: UICollectionView {
    public convenience init(minimumLineSpacing: CGFloat = HorizontalPadding.small,
                            scrollDirection: ScrollDirection = .horizontal,
                            sectionInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: HorizontalPadding.small, bottom: 0, right: HorizontalPadding.small),
                            showsHorizontalScrollIndicator: Bool = false,
                            backgroundColor: UIColor = .clear)
    {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.minimumLineSpacing = minimumLineSpacing
        collectionViewFlowLayout.scrollDirection = scrollDirection
        collectionViewFlowLayout.sectionInset = sectionInset

        self.init(frame: .zero, collectionViewLayout: collectionViewFlowLayout)

        self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        self.backgroundColor = backgroundColor
    }
}

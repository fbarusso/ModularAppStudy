//
//  UIConstants.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation

public enum HorizontalPadding: CGFloat {
    case none = 0.0
    case small = 16.0
    case medium = 32.0
}

public enum VerticalPadding: CGFloat {
    case none = 0.0
    case small = 8.0
    case medium = 16.0
    case big = 32.0
    case veryBig = 64.0
}

public enum FontSize {
    public static let small = 12.0
    public static let medium = 16.0
    public static let big = 32.0
    public static let veryBig = 48.0
}

public enum CornerRadius {
    public static let small = 8.0
    public static let medium = 16.0
}

public enum SkeletonViewConstants {
    public static let transitionDuration = 0.25
}

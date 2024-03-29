// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIKitModule",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "UIKitModule",
            targets: ["UIKitModule"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.0.0")),
        .package(url: "https://github.com/Juanpe/SkeletonView.git", .upToNextMajor(from: "1.30.4")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "UIKitModule",
            dependencies: ["Kingfisher", "SkeletonView"],
            resources: [.process("Assets/Fonts")]
        ),
        .testTarget(
            name: "UIKitModuleTests",
            dependencies: ["UIKitModule"]
        ),
    ]
)

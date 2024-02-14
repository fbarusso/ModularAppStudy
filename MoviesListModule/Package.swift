// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MoviesListModule",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MoviesListModule",
            targets: ["MoviesListModule"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0"),
        .package(path: "../UIKitModule"),
        .package(path: "../NetworkModule"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MoviesListModule",
            dependencies: ["Swinject", "UIKitModule", "NetworkModule"]
        ),
        .testTarget(
            name: "MoviesListModuleTests",
            dependencies: ["MoviesListModule"]
        ),
    ]
)

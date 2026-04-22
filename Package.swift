// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftExtensionKit",
    platforms: [
        .iOS(.v15),
    ], 
    products: [
        .library(
            name: "SwiftExtensionKit",
            targets: ["SwiftExtensionKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift", .upToNextMajor(from: "6.10.2")),
        .package(url: "https://github.com/layoutBox/FlexLayout", branch: "master"),
        .package(url: "https://github.com/siteline/swiftui-introspect", branch: "main"),
        .package(url: "https://github.com/airbnb/lottie-spm", .upToNextMajor(from: "4.6.0")),
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.7.1")),
    ],
    targets: [
        .target(
            name: "SwiftExtensionKit",
            dependencies: [
                "RxSwift",
                .product(name: "RxCocoa", package: "RxSwift"),
                "FlexLayout",
                .product(name: "SwiftUIIntrospect", package: "swiftui-introspect"),
                .product(name: "Lottie", package: "lottie-spm"),
                "SnapKit",
            ]
        ),
        .testTarget(
            name: "SwiftExtensionKitTests",
            dependencies: [
                "SwiftExtensionKit",
                "RxSwift",
                .product(name: "RxCocoa", package: "RxSwift"),
                "FlexLayout",
                .product(name: "SwiftUIIntrospect", package: "swiftui-introspect"),
                .product(name: "Lottie", package: "lottie-spm"),
                "SnapKit",
            ]),
    ]
)

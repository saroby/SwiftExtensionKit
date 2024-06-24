// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftExtensionKit",
    platforms: [
        .iOS(.v14),
    ], 
    products: [
        .library(
            name: "SwiftExtensionKit",
            targets: ["SwiftExtensionKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.7.0")),
    ],
    targets: [
        .target(
            name: "SwiftExtensionKit",
            dependencies: [
                "RxSwift",
                .product(name: "RxCocoa", package: "RxSwift"),
            ]
        ),
        .testTarget(
            name: "SwiftExtensionKitTests",
            dependencies: [
                "SwiftExtensionKit",
                "RxSwift",
                .product(name: "RxCocoa", package: "RxSwift"),
            ]),
    ]
)

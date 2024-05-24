// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftExtensionKit",
    platforms: [
        .iOS(.v17),
    ], 
    products: [
        .library(
            name: "SwiftExtensionKit",
            targets: ["SwiftExtensionKit"]),
    ],
    targets: [
        .target(
            name: "SwiftExtensionKit"),
        .testTarget(
            name: "SwiftExtensionKitTests",
            dependencies: ["SwiftExtensionKit"]),
    ]
)

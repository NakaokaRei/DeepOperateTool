// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeepOperatePackage",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "App",
            targets: ["AppFeature"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AppFeature",
            dependencies: [
                "ViewModel"
            ]
        ),
        .target(
            name: "Managers",
            dependencies: []
        ),
        .target(
            name: "MultipeerClient",
            dependencies: []
        ),
        .target(
            name: "ViewModel",
            dependencies: [
                "Managers",
                "MultipeerClient"
            ]
        ),
        .testTarget(
            name: "DeepOperatePackageTests",
            dependencies: [
                "AppFeature",
                "Managers"
            ]
        )
    ]
)

// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iOSPackage",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "iOSPackage",
            targets: ["iOSView"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../Packages/DeepOperatePackage")
    ],
    targets: [
        .target(
            name: "iOSView",
            dependencies: [
                "iOSViewModel"
            ]
        ),
        .target(
            name: "iOSViewModel",
            dependencies: [
                "iOSManagers",
                .product(name: "MultipeerClient", package: "DeepOperatePackage")
            ]
        ),
        .target(
            name: "iOSManagers",
            dependencies: []
        ),
        .testTarget(
            name: "iOSPackageTests",
            dependencies: ["iOSManagers"]
        ),
    ]
)

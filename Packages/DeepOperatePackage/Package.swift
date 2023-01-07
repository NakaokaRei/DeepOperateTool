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
        .library(name: "MultipeerClient", targets: ["MultipeerClient"]),
        .library(name: "VideoCapture", targets: ["VideoCapture"]),
        .library(name: "HandPoseManager", targets: ["HandPoseManager"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MultipeerClient",
            dependencies: []
        ),
        .target(
            name: "VideoCapture",
            dependencies: []
        ),
        .target(
            name: "HandPoseManager",
            dependencies: []
        ),
    ]
)

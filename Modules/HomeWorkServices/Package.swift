// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HomeWorkServices",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "HomeWorkServices",
            targets: ["HomeWorkServices"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "../TheNewsAPI", from: "0.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "HomeWorkServices",
            dependencies: ["TheNewsAPI"]),
        .testTarget(
            name: "HomeWorkServicesTests",
            dependencies: ["HomeWorkServices"]),
    ]
)

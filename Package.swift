// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KeepinAPI",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/OpenKitten/MongoKitten.git", from: "4.0.0"),
        .package(url: "https://github.com/qutheory/vapor.git", from: "2.0.0"),
        .package(url: "https://github.com/vapor/auth-provider.git", from: "1.0.0"),
        .package(url: "https://github.com/vapor/jwt-provider.git", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "KeepinAPI",
            dependencies: ["KeepinServices", "AuthProvider", "JWTProvider"]),
        .target(
            name: "KeepinServices",
            dependencies: ["MongoKitten"]),
        .testTarget(
            name: "KeepinServicesTests",
            dependencies: ["KeepinServices"]),
    ]
)

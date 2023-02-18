// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenAISolutions",
    platforms: [
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v8),
        .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "OpenAIClient",
            targets: ["OpenAIClient"]),
        .library(
            name: "OpenAIGTP",
            targets: ["OpenAIGTP"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/lukacs-m/SimpleNetwork", .upToNextMajor(from: "0.1.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "OpenAIClient",
            dependencies: [
                .product(name: "SimpleNetwork", package: "SimpleNetwork"),
            ]),
        .target(
            name: "OpenAIGTP",
            dependencies: [
                "OpenAIClient",
            ]),
        .testTarget(
            name: "OpenAIClientTests",
            dependencies: ["OpenAIClient"]),
        .testTarget(
            name: "OpenAIGPTTests",
            dependencies: ["OpenAIGTP"]),
    ]
)

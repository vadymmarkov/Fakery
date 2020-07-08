// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Fakery",
    products: [
        .library(name: "Fakery", targets: ["Fakery"])
    ],
    dependencies: [
    // Test dependencies
    .package(url: "https://github.com/Quick/Quick.git", from: "2.0.0"),
    .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.0"),

    ],
    targets: [
      .target(name: "Fakery", resources: [.copy("Resources/Locales")]),
      .testTarget(name: "FakeryTests", dependencies: ["Fakery","Quick", "Nimble"], path: "Tests/Fakery")
    ]
)

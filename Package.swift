// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Fakery",
    platforms: [
        .macOS(.v10_10), .iOS(.v9), .tvOS(.v9)
    ],
    products: [
      .library(name: "Fakery", targets: ["Fakery"])
    ],
    dependencies: [
      // Test dependencies
      .package(url: "https://github.com/Quick/Quick.git", from: "3.1.2"),
      .package(url: "https://github.com/Quick/Nimble.git", from: "9.0.0"),
    ],
    targets: [
      .target(name: "Fakery", resources: [.process("Resources")]),
      .testTarget(name: "FakeryTests", dependencies: ["Fakery", "Quick", "Nimble"], path: "Tests/Fakery")
    ]
)

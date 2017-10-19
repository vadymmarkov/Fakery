// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Fakery",
    products: [
      .library(name: "Fakery", targets: ["Fakery"])
    ],
    targets: [
      .target(name: "Fakery")
    ]
)

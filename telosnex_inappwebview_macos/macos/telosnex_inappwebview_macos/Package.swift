// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "telosnex_inappwebview_macos",
    platforms: [
        .macOS("10.15"),
    ],
    products: [
        .library(name: "telosnex-inappwebview-macos", targets: ["telosnex_inappwebview_macos"])
    ],
    dependencies: [
      .package(url: "https://github.com/apple/swift-collections.git", from: "1.2.1")
    ],
    targets: [
        .target(
            name: "telosnex_inappwebview_macos",
            dependencies: [
                .product(name: "Collections", package: "swift-collections")
            ],
            resources: [
                .process("Resources")
            ]
        )
    ]
)

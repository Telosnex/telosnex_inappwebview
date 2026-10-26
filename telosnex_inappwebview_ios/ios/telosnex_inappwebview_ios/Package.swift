// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "telosnex_inappwebview_ios",
    platforms: [
        .iOS("12.0"),
    ],
    products: [
        .library(name: "telosnex-inappwebview-ios", targets: ["telosnex_inappwebview_ios"])
    ],
    dependencies: [
      .package(url: "https://github.com/apple/swift-collections.git", from: "1.2.1")
    ],
    targets: [
        .target(
            name: "telosnex_inappwebview_ios",
            dependencies: [
                .product(name: "Collections", package: "swift-collections")
            ],
            resources: [
                .process("Resources")
            ]
        )
    ]
)

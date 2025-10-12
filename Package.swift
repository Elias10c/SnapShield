// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "SnapShield",
    platforms: [
        .iOS(.v16),
        .tvOS(.v16),
        .visionOS(.v1),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "SnapShield",
            targets: ["SnapShield"]
        ),
    ],
    targets: [
        .target(
            name: "SnapShield"
        ),

    ]
)

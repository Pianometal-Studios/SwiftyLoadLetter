// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let name = "SwiftyLoadLetter"

let package = Package(
    name: name,
    defaultLocalization: "en",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
        .visionOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26)
    ],
    products: [
        .library(name: name, targets: [name]),
    ],
    targets: [
        .target(
            name: name,
            swiftSettings: swiftSettings),
        .testTarget(
            name: "SwiftyLoadLetterTests",
            dependencies: ["SwiftyLoadLetter"],
            swiftSettings: swiftSettings
        ),
    ],
    swiftLanguageModes: [.v6],
)

/// - Returns: An array of Swift settings for the package targets.
private let swiftSettings: [SwiftSetting] = [
    .defaultIsolation(nil),
    .enableUpcomingFeature("StrictConcurrency"),
    .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
    .enableUpcomingFeature("InferIsolatedConformances"),
]

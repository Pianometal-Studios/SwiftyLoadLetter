// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
// ┌───────────────────────────────────────────────────────────────────┐
// │                                                                   │
// │   ╔═══════════════════════════════════════════════════════════╗   │
// │   ║                                                           ║   │
// │   ║     ███████╗██╗    ██╗██╗███████╗████████╗██╗   ██╗       ║   │
// │   ║     ██╔════╝██║    ██║██║██╔════╝╚══██╔══╝╚██╗ ██╔╝       ║   │
// │   ║     ███████╗██║ █╗ ██║██║█████╗     ██║    ╚████╔╝        ║   │
// │   ║     ╚════██║██║███╗██║██║██╔══╝     ██║     ╚██╔╝         ║   │
// │   ║     ███████║╚███╔███╔╝██║██║        ██║      ██║          ║   │
// │   ║     ╚══════╝ ╚══╝╚══╝ ╚═╝╚═╝        ╚═╝      ╚═╝          ║   │
// │   ║                                                           ║   │
// │   ║            ╦  ┌─┐┌─┐┌┬┐  ╦  ┌─┐┌┬┐┌┬┐┌─┐┬─┐               ║   │
// │   ║            ║  │ │├─┤ ││  ║  ├┤  │  │ ├┤ ├┬┘               ║   │
// │   ║            ╩═╝└─┘┴ ┴─┴┘  ╩═╝└─┘ ┴  ┴ └─┘┴┴─               ║   │
// │   ║                                                           ║   │
// │   ╚═══════════════════════════════════════════════════════════╝   │
// │                                                                   │
// │            ___                                                    │
// │           /   \                                                   │
// │          | ( ) |   "Yeah, if you could just go ahead and use      │
// │           \___/     this package that'd be greaaaat..."           │
// │             |                                                     │
// │         ____┴____                                                 │
// │        |         |                                                │
// │        |   ___   |                                                │
// │        |  |TPS|  |                                                │
// │        |  |RPT|  |                                                │
// │        |__|___|__|                                                │
// │           |   |                                                   │
// │          _|   |_                                   "...yeah"      │
// │                                                                   │
// └───────────────────────────────────────────────────────────────────┘
//

import PackageDescription

private let name = "SwiftyLoadLetter"

let package = Package(
    name: name,
    defaultLocalization: "en",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
        .macCatalyst(.v26),
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

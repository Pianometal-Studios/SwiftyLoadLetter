// swift-tools-version: 6.4
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

/// An array of Swift settings for the package targets.
private let swiftSettings: [SwiftSetting] = [
    .defaultIsolation(nil),
    .strictMemorySafety(),
    .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
    .enableUpcomingFeature("InferIsolatedConformances"),
    .enableUpcomingFeature("ExistentialAny"),
    .enableUpcomingFeature("MemberImportVisibility"),
    .enableUpcomingFeature("InternalImportsByDefault"),
    .enableUpcomingFeature("ImmutableWeakCaptures"),
]

let package = Package(
    name: name,
    defaultLocalization: "en",
    platforms: [
        .iOS(.v27),
        .macOS(.v27),
        .visionOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27)
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

//
//  TargetEnvironment.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 9/7/26.
//  Apache License 2.0
//

import Foundation
import StoreKit

/// A namespace describing the build environment the app is currently running in.
///
/// `TargetEnvironment` answers questions about *how* the running binary was built and
/// distributed, rather than *what* it contains — the natural companion to ``MainBundle``,
/// which reads the bundle’s own metadata.
///
/// ## Use Cases
/// - Gating diagnostic or developer-only UI to debug builds.
/// - Skipping network and persistence work while rendering SwiftUI previews.
/// - Distinguishing a TestFlight build from an App Store release.
/// - Detecting an iPhone or iPad app running on Apple Vision Pro.
@frozen public enum TargetEnvironment: Sendable {
    
    /// Indicates whether the binary was compiled with the `DEBUG` flag.
    ///
    /// - Returns: `true` in debug builds; otherwise `false`.
    ///
    /// - Note: A release build distributed through TestFlight also returns `false`.
    ///   Use ``isTestFlight()`` to identify a TestFlight build.
    public static var isDebug: Bool {
#if DEBUG
        return true
#else
        return false
#endif
    }
    
    /// Indicates whether the process is rendering a SwiftUI preview in Xcode.
    ///
    /// - Returns: `true` when Xcode sets `XCODE_RUNNING_FOR_PREVIEWS`; otherwise `false`.
    public static var isPreview: Bool {
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    
    /// Indicates whether an iPhone or iPad app is running on Apple Vision Pro.
    ///
    /// - Returns: `true` for a compatible iOS app running on visionOS; otherwise `false`,
    ///   including on systems that predate `ProcessInfo.isiOSAppOnVision`.
    public static var isiOSAppOnVisionPro: Bool {
        guard #available(iOS 26.1, macOS 26.1, tvOS 26.1, watchOS 26.1, visionOS 26.1, *) else {
            return false
        }
        return ProcessInfo.processInfo.isiOSAppOnVision
    }
    
    /// Indicates whether the app was installed through TestFlight.
    ///
    /// Reads StoreKit’s `AppTransaction`, whose environment is `.sandbox` for a TestFlight
    /// build and `.production` for an App Store release. A build run directly from Xcode
    /// reports `.xcode`, and so returns `false`.
    ///
    /// - Returns: `true` when the app transaction is verified and its environment is
    ///   `.sandbox`; otherwise `false`.
    ///
    /// - Note: This replaces the older `Bundle.main.appStoreReceiptURL` heuristic, which
    ///   Apple deprecated in favor of `AppTransaction`.
    public static func isTestFlight() async -> Bool {
        do {
            guard case .verified(let transaction) = try await AppTransaction.shared else {
                logger(.swift, message: "Unable to verify AppTransaction")
                return false
            }
            return transaction.environment == .sandbox
        } catch {
            logger(.swift, error: error)
            return false
        }
    }
}

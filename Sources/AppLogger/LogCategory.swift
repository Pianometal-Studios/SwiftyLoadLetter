//
//  LogCategory.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 3/23/26.
//  Apache License 2.0
//
// ---------------------------------------------------------------------------
//  █████╗ ██████╗ ██████╗ ██╗      ██████╗  ██████╗  ██████╗ ███████╗██████╗
// ██╔══██╗██╔══██╗██╔══██╗██║     ██╔═══██╗██╔════╝ ██╔════╝ ██╔════╝██╔══██╗
// ███████║██████╔╝██████╔╝██║     ██║   ██║██║  ███╗██║  ███╗█████╗  ██████╔╝
// ██╔══██║██╔═══╝ ██╔═══╝ ██║     ██║   ██║██║   ██║██║   ██║██╔══╝  ██╔══██╗
// ██║  ██║██║     ██║     ███████╗╚██████╔╝╚██████╔╝╚██████╔╝███████╗██║  ██║
// ╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝
//
//                Smackin' up the print() statement since 2026
//
// ---------------------------------------------------------------------------
//            Universal logging system with emoji prefixes for easy
//                  scanning in Console.app and Xcode output
// ---------------------------------------------------------------------------

import Foundation
import os

/// A centralized, strongly-typed logging category used throughout the app.
///
/// LogCategory defines semantic categories (such as network, auth, and bluetooth) that
/// map to dedicated `os.Logger` instances. Each case provides:
/// - A human-readable `name` (e.g., "Network").
/// - An emoji `emoji` prefix for quick visual scanning in Console.app.
/// - A combined `category` string ("🌐 Network") used when creating the underlying logger.
/// - A lazily created `logger` bound to the app’s bundle identifier as the subsystem.
///
/// ## Usage
/// - `debug(_:)` and `info(_:)`: Not persisted to disk; best for development-time diagnostics.
/// - `notice(_:)`, `warning(_:)`, `error(_:)`, `fault(_:)`, `critical(_:)`: Persisted to disk and
///   appropriate for production telemetry, with increasing urgency.
///
/// - SeeAlso: LogCategory integrates with the free-form `logger(_:,message:type:)` and
/// `logger(_:,error:type:)` helper functions to standardize message formatting and ensure
/// consistent subsystem/category labeling across the app.
///
/// - Note: The subsystem is derived from the app’s bundle identifier; if unavailable, a fallback
///   placeholder is used.
///
/// - Important: Messages use `.auto` privacy by default to help avoid inadvertent disclosure of sensitive
///   data in logs.
public enum LogCategory:
    String,
    Staticable,
    Searchable,
    Describable,
    Listable {
    
    /// App Store Connect interactions and API calls, including authentication, data retrieval, and
    /// error handling.
    case asc
    
    /// Authentication events, such as sign-in attempts, sign-outs, token refreshes, and
    /// auth-related errors.
    case auth
    
    /// Bluetooth connectivity events, including device discovery, connection status changes,
    /// data transmission, and Bluetooth-related errors.
    case bluetooth
    
    /// Firebase-related logs, covering interactions with Firebase services such as Analytics,
    /// Crashlytics, Remote Config, and Firestore. This includes event logging, error reporting,
    /// and configuration updates.
    case firebase
    
    /// General-purpose logs that don't fit into other specific categories, such as miscellaneous
    /// app events, non-critical errors, or informational messages that are relevant across
    /// multiple domains.
    case general
    
    /// Geolocation services logs, including location updates, permission changes, geofencing
    /// events, and location-related errors.
    case location
    
    /// Network-related logs, such as API requests and responses, connectivity status changes,
    /// and network errors.
    case network
    
    /// RevenueCat purchases and subscriptions, including purchase attempts, successful
    /// transactions, subscription status changes, and RevenueCat-related errors.
    case revenueCat
    
    /// General Swift, SwiftUI, and Xcode related logs, such as debugging information about view
    /// rendering, state changes, and Swift language features.
    case swift
    
    /// Logs specific to SwiftData operations and behaviors, including data model interactions,
    /// fetch requests, save operations, and SwiftData-related errors.
    case swiftData
    
    /// Hardware, system software, and OS-level events and diagnostics, such as memory
    /// warnings, performance metrics, system notifications, and other logs related to the
    /// underlying platform and environment.
    case system
    
    public var details: String {
        switch self {
        case .asc:        
            "Logs related to App Store Connect interactions and API calls."
        case .network:
            "Network-related logs, such as API requests and responses."
        case .firebase:
            "Logs related to Firebase services and interactions."
        case .auth:
            "Authentication events, including sign-in and sign-out."
        case .revenueCat:
            "Logs pertaining to RevenueCat purchases and subscriptions."
        case .swift:
            "General Swift, SwiftUI, and Xcode related logs."
        case .swiftData:
            "Logs specific to SwiftData operations and behaviors."
        case .system:
            "Hardware, system software, and OS-level events and diagnostics."
        case .bluetooth:
            "Logs related to Bluetooth connectivity and events."
        case .location:
            "Logs pertaining to location services and geolocation events."
        case .general:
            "General-purpose logs that don't fit into other categories."
        }
    }
    
    public var emoji: String {
        switch self {
        case .asc:        "🍎"
        case .network:    "🌐"
        case .firebase:   "🔥"
        case .auth:       "🔐"
        case .revenueCat: "💰"
        case .swift:      "🖼️"
        case .swiftData:  "💾"
        case .system:     "🎛️"
        case .bluetooth:  "📡"
        case .location:   "📍"
        case .general:    "🪵"
        }
    }
    
    /// Instance of logger for this category, lazily initialized with the app's bundle identifier as the subsystem
    /// and the category's emoji label as the category.
    ///
    /// - Returns: The underlying `os.Logger` instance for this category.
    private var logger: Logger {
        Logger(
            subsystem: MainBundle.identifier ?? "No BundleID",
            category: "\(emoji) \(name)")
    }
    
    public var name: String {
        switch self {
        case .asc:        "App Store Connect"
        case .network:    "Network"
        case .firebase:   "Firebase"
        case .auth:       "Auth"
        case .revenueCat: "RevenueCat"
        case .swift:      "Swift"
        case .swiftData:  "SwiftData"
        case .system:     "System"
        case .bluetooth:  "Bluetooth"
        case .location:   "Location"
        case .general:    "General"
        }
    }
    
    /// Logs a message at an explicit `OSLogType` level.
    ///
    /// ## Example
    /// ```swift
    /// LogCategory.network.log("Retrying request", type: .error)
    /// ```
    ///
    /// - Parameters:
    ///   - message: The message to log.
    ///   - type: The `OSLogType` level to use.
    func log(_ message: String, type: OSLogType = .default) {
        logger.log(level: type, "\(type.emoji) \(message, privacy: .auto)")
#if DEBUG
        printOnDebug("\(emoji) \(name)", "\(type.emoji) \(type.name)", "ℹ️ \(message)")
#endif
    }
    
    public static let navigationTitle = "LogCategory"
}

// MARK: - Preview

#if DEBUG
import SwiftUI
#Preview {
    NavigationStack {
        List(LogCategory.allCases.sorted()) { category in
            LabeledContent { EmptyView() } label: {
                Text("\(category.emoji) \(category.name)")
                    .bold()
                Text(category.details)
            }
        }
        .navigationTitle(LogCategory.navigationTitle)
        .navigationSubtitle(subtitle: "All logging categories with descriptions")
    }
}
#endif

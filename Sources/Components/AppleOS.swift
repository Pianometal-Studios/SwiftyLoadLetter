//
//  AppleOS.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

/// Enumeration of Apple operating systems.
///
/// Each case corresponds to one of Apple's OS families and
/// provides convenient, platform-specific metadata such as a human-readable device name,
/// an SF Symbols glyph identifier, and a canonical display name.
///
/// ## Conformances
/// - `Staticable`: Provides coding, identification, and transfer capabilities.
/// - `Searchable`: Enables use in searchable lists and UI elements.
/// - `Iconable`: Supplies SF Symbol icons for visual representation.
public enum AppleOS:
    String,
    Staticable,
    Searchable,
    Iconable,
    Listable {
    
    case iOS
    case iPadOS
    case macOS
    case visionOS
    case tvOS
    case watchOS
    
    /// - Returns: A device name commonly associated with the OS, such
    ///   as "iPhone" for iOS or "Mac" for macOS.
    public var device: String {
        switch self {
        case .iOS:      "iPhone"
        case .iPadOS:   "iPad"
        case .macOS:    "Mac"
        case .tvOS:     "Apple TV"
        case .watchOS:  "Apple Watch"
        case .visionOS: "Vision Pro"
        }
    }
    
    public var icon: String {
        switch self {
        case .iOS:      "iphone"
        case .iPadOS:   "ipad"
        case .macOS:    "desktopcomputer"
        case .tvOS:     "appletv"
        case .watchOS:  "applewatch"
        case .visionOS: "vision.pro"
        }
    }
    
    public var name: String {
        switch self {
        case .iOS:      "iOS"
        case .iPadOS:   "iPadOS"
        case .macOS:    "macOS"
        case .tvOS:     "tvOS"
        case .watchOS:  "watchOS"
        case .visionOS: "visionOS"
        }
    }
    
    /// Determines if the platform corresponds to the current operating system.
    ///
    /// - Returns: `true` if the platform corresponds to the current operating system.
    @MainActor public var isCurrent: Bool {
#if os(iOS)
#if canImport(UIKit)
        if UIDevice.current.userInterfaceIdiom == .pad {
            return self == .iPadOS
        } else {
            return self == .iOS
        }
#else
        return self == .iOS
#endif
#elseif os(macOS)
        return self == .macOS
#elseif os(tvOS)
        return self == .tvOS
#elseif os(watchOS)
        return self == .watchOS
#elseif os(visionOS)
        return self == .visionOS
#else
        logger(.system, message: "Current operating system is unknown.")
        return false
#endif
    }
    
    /// Indicates whether this OS supports touch input as a primary interaction method.
    public var supportsTouchInput: Bool {
        switch self {
        case .iOS, .iPadOS, .visionOS: true
        case .macOS, .tvOS, .watchOS:  false
        }
    }
    
    /// The current operating system.
    ///
    /// - Returns: The `AppleOS` case corresponding to the current operating system,
    ///   or `nil` if the operating system cannot be determined.
    @MainActor public static var current: AppleOS {
        guard let os = Self.allCases.first(where: { $0.isCurrent }) else {
            fatalError("Unable to determine current operating system.")
        }
        return os
    }
    
    public static let navigationTitle: String = "Apple Operating Systems"
}

// MARK: - Preview

#if DEBUG
import SwiftUI
#Preview {
    NavigationStack {
        List {
            ForEach(AppleOS.allCases) { os in
                LabeledContent {
                    if os.isCurrent {
                        Image(systemName: "checkmark.seal")
                            .font(.title)
                            .foregroundStyle(.green)
                            .symbolRenderingMode(.hierarchical)
                            .symbolVariant(.fill)
                    }
                } label: {
                    Label {
                        Text(os.name)
                        Text(os.device)
                    } icon: {
                        Image(systemName: os.icon)
                    }
                }
            }
        }
        .navigationTitle(AppleOS.navigationTitle)
        .navigationSubtitle(subtitle: "Current: \(AppleOS.current.name)")
    }
}
#endif

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
public enum AppleOS:
    String,
    Staticable,
    Searchable,
    Iconable {
    
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
#if os(iOS) && canImport(UIKit)
        if UIDevice.current.userInterfaceIdiom == .pad {
            return self == .iPadOS
        } else {
            return self == .iOS
        }
#elseif os(macOS)
        self == .macOS
#elseif os(tvOS)
        self == .tvOS
#elseif os(watchOS)
        self == .watchOS
#elseif os(visionOS)
        self == .visionOS
#else
        logger(.system, message: "Current operating system is unknown.")
        false
#endif
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI
#Preview {
    List {
        ForEach(AppleOS.allCases) { os in
            LabeledContent {
                if os.isCurrent {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.title)
                        .foregroundStyle(.green)
                        .symbolRenderingMode(.hierarchical)
                }
            } label: {
                Label {
                    Text(os.name)
                        .bold()
                    Text(os.device)
                } icon: {
                    Image(systemName: os.icon)
                        .font(.title2)
                }
            }
        }
    }
}
#endif

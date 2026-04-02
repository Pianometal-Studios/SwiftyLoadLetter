//
//  AppleOS.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import Foundation

/// Enumeration of Apple operating systems.
///
/// Each case corresponds to one of Apple's OS families and
/// provides convenient, platform-specific metadata such as a human-readable device name,
/// an SF Symbols glyph identifier, and a canonical display name.
///
/// - Complexity: O(1) for all properties and methods, as they rely on simple enum cases and switch statements.
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
    
    public var name: String { rawValue }
    
    /// Determines if the platform corresponds to the current operating system.
    ///
    /// - Returns: `true` if the platform corresponds to the current operating system.
    public var isCurrent: Bool {
#if os(iOS)
        self == .iOS || self == .iPadOS
#elseif os(macOS)
        self == .macOS
#elseif os(tvOS)
        self == .tvOS
#elseif os(watchOS)
        self == .watchOS
#elseif os(visionOS)
        self == .visionOS
#else
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
            Label {
                Text(os.name)
                    .bold()
                Text(os.device)
                if os.isCurrent {
                    Text("Current")
                        .foregroundStyle(.red)
                }
            } icon: {
                Image(systemName: os.icon)
                    .font(.title2)
            }
        }
    }
}
#endif

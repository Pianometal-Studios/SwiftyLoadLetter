//
//  UserInterfaceSizeClass.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/8/26.
//  MIT License
//

import SwiftUI

public extension UserInterfaceSizeClass {
    
    /// - Returns: `true` if the size class is `.compact`, otherwise `false`
    var isCompact: Bool {
        self == .compact
    }
    
    var icon: String {
        switch self {
        case .compact:    "rectangle.compress.vertical"
        case .regular:    "rectangle.expand.vertical"
        @unknown default: "questionmark"
        }
    }
    
    var name: String {
        switch self {
        case .compact:    "Compact"
        case .regular:    "Regular"
        @unknown default: "Unknown"
        }
    }
    
    /// An array of all standard `UserInterfaceSizeClass` cases
    ///
    /// - Returns: [.compact, .regular]
    static let allCases: [UserInterfaceSizeClass] = [
        .compact,
        .regular
    ]
}

public extension UserInterfaceSizeClass? {
    
    /// Determines if the size class is compact, treating `nil` as compact for safety.
    ///
    /// - Returns: `true` if the size class is `.compact` or `nil`,
    ///   otherwise `false`
    ///
    /// - Note: Assumes `nil` represents an unknown size class, which is
    ///   treated as compact for safety.
    var isCompact: Bool {
        guard let self else {
            logger(.swift, message: "Unknown size class, assuming compact")
            return true
        }
        return self == .compact
    }
    
    var name: String {
        guard let self else {
            logger(.swift, message: "Unknown size class")
            return "Unknown"
        }
        return self.name
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(UserInterfaceSizeClass.allCases, id: \.self) {
            Label($0.name, systemImage: $0.icon)
        }
        .navigationTitle("UserInterfaceSizeClass")
        .navigationSubtitle(subtitle: "All cases of UserInterfaceSizeClass")
    }
}
#endif

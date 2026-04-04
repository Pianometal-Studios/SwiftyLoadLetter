//
//  UserInterfaceSizeClass.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/8/26.
//  MIT License
//

import SwiftUI

public extension UserInterfaceSizeClass {
    
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
    
    var name: String {
        guard let self else {
            printOnDebug("⚠️ Unknown size class name")
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

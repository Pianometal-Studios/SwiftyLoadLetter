//
//  ColorScheme.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/8/26.
//  Apache License 2.0
//

import SwiftUI

public extension ColorScheme {
    
    var color: Color {
        isDark ? .indigo : .orange
    }
    
    var icon: String {
        isDark ? "moon" : "sun.max"
    }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    /// Indicates whether the current `ColorScheme` is Dark Mode.
    ///
    /// - Returns:
    ///   - `true` for Dark Mode
    ///   - `false` for Light Mode and unknown cases (e.g., when `ColorScheme`
    ///   is `nil`)
    var isDark: Bool {
        self == .dark
    }
    
    var name: String {
        isDark ? "Dark" : "Light"
    }
}

public extension ColorScheme? {
    
    var color: Color {
        guard let self else {
            logger(.swift, message: "Unknown ColorScheme")
            return .secondary
        }
        return self.color
    }
    
    var icon: String {
        guard let self else {
            logger(.swift, message: "Unknown ColorScheme")
            return "questionmark"
        }
        return self.icon
    }
    
    /// - SeeAlso: `ColorScheme.isDark`
    var isDark: Bool {
        guard let self else {
            logger(.swift, message: "Unknown ColorScheme")
            return false
        }
        return self.isDark
    }
    
    var name: String {
        guard let self else {
            logger(.swift, message: "Unknown ColorScheme")
            return "Unknown"
        }
        return self.name
    }
}

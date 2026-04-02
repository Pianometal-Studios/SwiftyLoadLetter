//
//  ColorScheme.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/8/26.
//  MIT License
//

import SwiftUI

// MARK: - ColorScheme

public extension ColorScheme {
    
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
    
    var icon: String {
        isDark ? "moon" : "sun.max"
    }
    
    var color: Color {
        isDark ? .indigo : .orange
    }
}

public extension ColorScheme? {
    
    /// - SeeAlso: `ColorScheme.isDark`
    var isDark: Bool {
        guard let self else {
            printOnDebug("⚠️ Unknown ColorScheme")
            return false
        }
        return self.isDark
    }
    
    var name: String {
        guard let self else {
            printOnDebug("⚠️ Unknown ColorScheme")
            return "Unknown"
        }
        return self.name
    }
    
    var icon: String {
        guard let self else {
            printOnDebug("⚠️ Unknown ColorScheme")
            return "questionmark"
        }
        return self.icon
    }
    
    var color: Color {
        guard let self else {
            printOnDebug("⚠️ Unknown ColorScheme")
            return .gray
        }
        return self.color
    }
}

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
    ///   - `false` for Light Mode
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var isDark: Bool { self == .dark }
    
    /// Name representing the current `ColorScheme`.
    ///
    /// - Returns:
    ///   - `"Dark"` for Dark Mode
    ///   - `"Light"` for Light Mode
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var name: String { isDark ? "Dark" : "Light" }
    
    /// SF Symbol representing the current `ColorScheme`.
    ///
    /// - Returns:
    ///   - `"moon"` for Dark Mode
    ///   - `"sun.max"` for Light Mode
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var icon: String { isDark ? "moon" : "sun.max" }
    
    /// `Color` associated with the current `ColorScheme`.
    ///
    /// - Returns:
    ///   - `.indigo` for Dark Mode
    ///   - `.orange` for Light Mode
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var color: Color { isDark ? .indigo : .orange }
}

public extension ColorScheme? {
    
    /// - SeeAlso: `ColorScheme.isDark`
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var isDark: Bool {
        guard let self else { return false }
        return self.isDark
    }
    
    /// - SeeAlso: `ColorScheme.name`
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var name: String {
        guard let self else { return "Unknown" }
        return self.name
    }
    
    /// - SeeAlso: `ColorScheme.icon`
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var icon: String {
        guard let self else { return "questionmark" }
        return self.icon
    }
    
    /// - SeeAlso: `ColorScheme.color`
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var color: Color {
        guard let self else { return .gray }
        return self.color
    }
}

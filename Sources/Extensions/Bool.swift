//
//  Bool.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import SwiftUI

public extension Bool {
    
    /// A localized-ready string intended for display to users
    ///
    /// - Returns: "Yes" when `true` and "No" when `false`.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var name: String {
        self ? "Yes" : "No"
    }
    
    /// SF Symbol name suitable for use with `Image(systemName:)`,
    ///
    /// - Returns: "checkmark" when `true` and "xmark" when `false`.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var icon: String {
        self ? "checkmark" : "xmark"
    }
    
    /// `Color` representing the boolean state,
    ///
    /// - Returns: `.green` when `true` and `.red` when `false`.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var color: Color {
        self ? .green : .red
    }
    
    /// Creates a view representing this boolean value using a name,
    /// system image, and color.
    ///
    /// This helper is intended to provide a quick, styled label for true/false states
    ///
    /// - Returns: A SwiftUI `Label`  that displays a `Label` composed
    ///            of `name` and `icon`, tinted with `color` based on the
    ///            given value.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    @MainActor func labelView() -> some View {
        Label(name, systemImage: icon)
            .foregroundStyle(color)
    }
    
    /// An array of all valid `Bool` cases.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    static let allCases: [Bool] = [true, false]
}

// MARK: - Preview

#if DEBUG
#Preview {
    List(Bool.allCases, id: \.self) { 
        Label($0.name, systemImage: $0.icon)
            .foregroundStyle($0.color)
    }
}
#endif

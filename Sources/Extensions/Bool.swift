//
//  Bool.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import SwiftUI

public extension Bool {
    
    var color: Color {
        self ? .green : .red
    }
    
    var emoji: String {
        self ? "✅" : "❌"
    }
    
    var emojiLabel: String {
        "\(emoji) \(name)"
    }
    
    var icon: String {
        self ? "checkmark" : "xmark"
    }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    var name: String {
        self ? "Yes" : "No"
    }
    
    /// Creates a view representing this boolean value using a name,
    /// system image, and color.
    ///
    /// This helper is intended to provide a quick, styled label for true/false states
    ///
    /// - Returns: A SwiftUI `Label`  that displays a `Label` composed
    /// of `name` and `icon`, tinted with `color` based on the given value.
    @MainActor func labelView() -> some View {
        Label(name, systemImage: icon)
            .foregroundStyle(color)
    }
    
    /// An array of all valid `Bool` cases, sorted by `true` first.
    ///
    /// - Returns: [true, false]
    static let allCases: [Self] = [true, false]
}

// MARK: - Preview

#if DEBUG
#Preview {
    List(Bool.allCases, id: \.self) { 
        $0.labelView()
    }
}
#endif

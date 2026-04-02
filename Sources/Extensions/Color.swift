//
//  Color.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import SwiftUI

public extension Color {
    
    /// - Returns: The localized capitalized name of the color based on its description.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var name: String {
        self.description.localizedCapitalized
    }
    
    /// - Returns: An array of all standard system colors, sorted alphabetically by name.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    static let allCases: [Self] = [
        .black,
        .blue,
        .brown,
        .cyan,
        .gray,
        .green,
        .indigo,
        .red,
        .mint,
        .orange,
        .purple,
        .pink,
        .teal,
        .white,
        .yellow
    ]
    
    /// - Returns: A random color generated with random RGB values.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    static var random: Self {
        Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(Color.allCases, id: \.self) { color in
            Label {
                Text(color.name)
            } icon: {
                Image(systemName: "circle")
                    .symbolVariant(.fill)
                    .foregroundStyle(color)
            }
        }
        .navigationTitle("Colors")
    }
}
#endif

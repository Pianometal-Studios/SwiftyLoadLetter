//
//  Color.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import SwiftUI

public extension Color {
    
    var name: String {
        switch self {
        case .black:  "Black"
        case .blue:   "Blue"
        case .brown:  "Brown"
        case .cyan:   "Cyan"
        case .gray:   "Gray"
        case .green:  "Green"
        case .indigo: "Indigo"
        case .red:    "Red"
        case .mint:   "Mint"
        case .orange: "Orange"
        case .purple: "Purple"
        case .pink:   "Pink"
        case .teal:   "Teal"
        case .white:  "White"
        case .yellow: "Yellow"
        default:      "Custom"
        }
    }
    
    /// An array of all standard `Color` cases provided by SwiftUI, sorted alphabetically.
    ///
    /// - Returns: [.black, .blue, .brown, .cyan, .gray, .green, .indigo, .red, .mint, .orange,
    /// .purple, .pink, .teal, .white, .yellow]
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
    
    /// A random color generated with random RGB values.
    ///
    /// - Returns: A random color generated with random RGB values.
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
                    .symbolColorRenderingMode(.gradient)
                    .foregroundStyle(color)
            }
        }
        .navigationTitle("Colors")
    }
}
#endif

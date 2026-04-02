//
//  AccessibilityAdjustmentDirection.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import SwiftUI

public extension AccessibilityAdjustmentDirection {
    
    /// - Returns: A detailed description of the adjustment direction.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var details: String {
        switch self {
        case .increment: "Increases the value"
        case .decrement: "Decreases the value"
        @unknown default: "Adjusts the value"
        }
    }
    
    /// - Returns: A `Color` representing the adjustment direction.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var color: Color {
        switch self {
        case .increment: .green
        case .decrement: .red
        @unknown default: .gray
        }
    }
    
    /// - Returns: An SF Symbol name suitable for use with `Image(systemName:)`.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var icon: String {
        switch self {
        case .increment: "plus"
        case .decrement: "minus"
        @unknown default: "questionmark"
        }
    }
    
    /// - Returns: String representing the adjustment direction.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var name: String {
        switch self {
        case .increment: "Increase"
        case .decrement: "Decrease"
        @unknown default: "Unknown"
        }
    }
    
    /// - Returns: An array of all valid `AccessibilityAdjustmentDirection` cases.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    static let allCases: [AccessibilityAdjustmentDirection] = [
        .increment,
        .decrement
    ]
}

// MARK: - Preview

#if DEBUG
#Preview {
    List(AccessibilityAdjustmentDirection.allCases, id: \.self) { direction in
        Label {
            Text(direction.name)
            Text(direction.details)
        } icon: {
            Image(systemName: direction.icon)
                .foregroundColor(direction.color)
        }
    }
}
#endif

//
//  AccessibilityAdjustmentDirection.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import SwiftUI

public extension AccessibilityAdjustmentDirection {
    
    var details: String {
        switch self {
        case .increment: "Increases the value"
        case .decrement: "Decreases the value"
        @unknown default: "Adjusts the value"
        }
    }
    
    var color: Color {
        switch self {
        case .increment: .green
        case .decrement: .red
        @unknown default: .gray
        }
    }
    
    var icon: String {
        switch self {
        case .increment: "plus"
        case .decrement: "minus"
        @unknown default: "questionmark"
        }
    }
    
    var name: String {
        switch self {
        case .increment: "Increase"
        case .decrement: "Decrease"
        @unknown default: "Unknown"
        }
    }
    
    var object: DescribableObject {
        .init(name, icon: icon, details: details)
    }
    
    /// An array of all valid `AccessibilityAdjustmentDirection` cases, sorted in a logical
    /// order (increment followed by decrement).
    ///
    /// - Returns: [.increment, .decrement]
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

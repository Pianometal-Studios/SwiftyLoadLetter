//
//  CompassPoint.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/25/26.
//  MIT License
//

import Foundation

/// An enumeration representing the four cardinal directions on a compass.
///
/// Each case provides properties for its abbreviation, icon, name, and opposite direction.
@frozen public enum CompassPoint: String, Staticable, Searchable, Iconable, Listable {
    
    case north
    case south
    case east
    case west
    
    /// - Returns: Single-letter abbreviation for the given compass point.
    public var abbreviation: String {
        switch self {
        case .north: "N"
        case .south: "S"
        case .east:  "E"
        case .west:  "W"
        }
    }
    
    public var icon: String {
        switch self {
        case .north: "arrow.up"
        case .south: "arrow.down"
        case .east:  "arrow.right"
        case .west:  "arrow.left"
        }
    }
    
    public var name: String {
        switch self {
        case .north: "North"
        case .south: "South"
        case .east:  "East"
        case .west:  "West"
        }
    }
    
    /// - Returns: The opposite compass direction.
    public var opposite: Self {
        switch self {
        case .north: .south
        case .south: .north
        case .east:  .west
        case .west:  .east
        }
    }
    
    public static let navigationTitle = "Compass Points"
}

// MARK: - Preview

#if DEBUG
import SwiftUI
#Preview {
    NavigationStack {
        List(CompassPoint.allCases) { compassPoint in
            Section {
                LabeledContent("Abbreviation", value: compassPoint.abbreviation)
                LabeledContent("Opposite", value: compassPoint.opposite.name)
            } header: {
                Label(compassPoint.name, systemImage: compassPoint.icon)
                    .symbolVariant(.circle.fill)
                    .symbolRenderingMode(.hierarchical)
            }
        }
        .navigationTitle(CompassPoint.navigationTitle)
        .navigationSubtitle(subtitle: "Compass properties and details")
    }
}
#endif

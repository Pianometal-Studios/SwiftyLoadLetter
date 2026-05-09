//
//  Colorable.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import SwiftUI

/// A lightweight protocol for types that have a `Color` associated with them.
///
/// Conforming to `Colorable` allows a type to expose a primary or representative color
/// that can be used for UI styling, theming, or visualization (e.g., tinting icons,
/// backgrounds, or labels).
///
/// ## Example
/// ```swift
/// struct Crayon: Nameable, Colorable {
///     let name: String
///     let color: Color
/// }
/// ```
public protocol Colorable {
    
    /// - Returns: SwiftUI `Color` representing the conforming type.
    var color: Color { get }
}

public struct ColorableObject: Searchable, Iconable, Describable, Colorable, Sendable {
    
    public let id: UUID
    public let name: String
    public let icon: String
    public let details: String
    public let color: Color
    
    public var hasDetails: Bool {
        !details.isEmpty
    }
    
    public var hasIcon: Bool {
        !icon.isEmpty
    }
    
    public init(
        _ name: String,
        icon: String = "",
        details: String = "",
        color: Color
    ) {
        self.id = .init()
        self.name = name
        self.icon = icon
        self.details = details
        self.color = color
    }
}

// MARK: - Preview

#if DEBUG
private struct Crayon: Nameable, Colorable {
    let name: String
    let color: Color
}
#Preview {
    let crayon = Crayon(name: "Blue", color: .blue)
    Label {
        Text(crayon.name)
    } icon: {
        Image(systemName: "circle")
            .symbolVariant(.fill)
            .symbolColorRenderingMode(.gradient)
            .foregroundStyle(crayon.color)
    }
}
#endif

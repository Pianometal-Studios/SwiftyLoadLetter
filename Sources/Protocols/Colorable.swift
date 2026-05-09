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

// MARK: - Colorable Object

/// A simple struct that conforms to `Searchable`, `Iconable`, `Describable`, and `Colorable`, representing an
/// object with a name, an optional SF Symbol icon, descriptive details, and an associated color.
///
/// ## Example
///
/// ```swift
/// let colorableObject = ColorableObject(
///     "Example",
///     icon: "star.fill",
///     details: "This is a colorable object.",
///     color: .yellow)
/// ```
public struct ColorableObject: Searchable, Iconable, Describable, Colorable, Sendable {
    
    public let id: UUID
    public let name: String
    public let icon: String
    public let details: String
    public let color: Color
    
    /// - Returns: `true` if the `details` property is not empty.
    public var hasDetails: Bool {
        !details.isEmpty
    }
    
    /// - Returns: `true` if the `icon` property is not empty.
    public var hasIcon: Bool {
        !icon.isEmpty
    }
    
    /// Initializes a new `ColorableObject` with the specified name, optional icon, details, and color.
    ///
    /// - Parameters:
    ///   - name: The display name of the object.
    ///   - icon: An optional SF Symbol name representing the object's icon (default is an empty string).
    ///   - details: A human‑readable description or summary of the object (default is an empty string).
    ///   - color: A SwiftUI `Color` associated with the object, used for styling or visualization.
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

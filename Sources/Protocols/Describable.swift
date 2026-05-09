//
//  Describable.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import Foundation

/// A lightweight protocol for types that can provide a human‑readable description of themselves,
///
/// Conform to `Describable` when you want to expose a concise, user‑facing explanation or
/// additional context about a value beyond its primary title or name. For example, a model might
/// conform to both `Nameable` (for a short title) and `Describable` (for longer details).
///
/// ## Example
/// ```swift
/// struct Magazine: Nameable, Describable {
///     let name = "Nintendo Power"
///     let details = "Now you're playing with power!"
/// }
/// ```
public protocol Describable {
    
    /// - Returns: A human‑readable, user‑facing description or summary of the value.
    var details: String { get }
}

// MARK: - Describable Object

/// A simple struct that conforms to `Searchable`, `Iconable`, and `Describable`, representing an
/// object with a name, an optional SF Symbol icon, and a descriptive details string.
public struct DescribableObject: Searchable, Iconable, Describable, Sendable, Codable {
    
    public let id: UUID
    public let name: String
    public let icon: String
    public var details: String
    
    /// - Returns: `true` if the `icon` property is not empty.
    public var hasIcon: Bool {
        !icon.isEmpty
    }
 
    /// Initializes a new `DescribableObject` with the specified name, optional icon, and details.
    ///
    /// - Parameters:
    ///   - name: The display name of the object.
    ///   - icon: An optional SF Symbol name representing the object's icon (default is an empty string).
    ///   - details: A human‑readable description or summary of the object
    public init(
        _ name: String,
        icon: String = "",
        details: String
    ) {
        self.id = .init()
        self.name = name
        self.icon = icon
        self.details = details
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI
private struct Magazine: Nameable, Describable {
    let name = "Walking"
    let details = "They have a magazine for walking. WALKING!"
}
#Preview {
    let magazine = Magazine()
    LabeledContent { EmptyView() } label: {
        Text(magazine.name)
        Text(magazine.details)
    }
    .padding()
}
#endif

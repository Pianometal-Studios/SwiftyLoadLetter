//
//  Iconable.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import Foundation

/// A protocol for types that have an associated SF Symbol icon.
///
/// ## Example
/// ```swift
/// private struct MyLabel: Nameable, Iconable {
///     let name = "Shield"
///     let icon = "shield.fill"
/// }
/// ```
///
/// - PreCondition: The SF Symbol name provided by the `icon` property must be
/// valid and available for the specified target.
public protocol Iconable {
    
    /// - Returns: SF Symbol name suitable for use with `Image(systemName:)`.
    var icon: String { get }
}

// MARK: - Iconable Object

/// A simple struct that conforms to `Searchable` and `Iconable`, representing an
/// object with a name and an associated SF Symbol icon.
///
/// ## Example
public struct IconableObject: Searchable, Iconable, Sendable, Codable {
    
    public let id: UUID
    public let name: String
    public let icon: String
    
    /// Creates a new `IconableObject` with the specified name and icon.
    ///
    /// - Parameters:
    ///   - name: The display name of the object.
    ///   - icon: The SF Symbol name representing the object's icon.
    public init(_ name: String, icon: String) {
        self.id = .init()
        self.name = name
        self.icon = icon
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI
#Preview {
    let label = IconableObject("Defense", icon: "shield.fill")
    Label(label.name, systemImage: label.icon)
}
#endif

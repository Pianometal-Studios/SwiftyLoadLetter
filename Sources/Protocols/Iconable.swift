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

public struct IconableObject: Searchable, Iconable, Sendable, Codable {
    
    public let id: UUID
    public let name: String
    public let icon: String
    
    public init(_ name: String, icon: String) {
        self.id = .init()
        self.name = name
        self.icon = icon
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI
private struct MyLabel: Nameable, Iconable {
    let name = "Shield"
    let icon = "shield.fill"
}
#Preview {
    let label = MyLabel()
    Label(label.name, systemImage: label.icon)
}
#endif

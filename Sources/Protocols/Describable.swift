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

public struct DescribableObject: Searchable, Iconable, Describable, Sendable, Codable {
    
    public let id: UUID
    public let name: String
    public let icon: String
    public var details: String
    
    public var hasIcon: Bool {
        !icon.isEmpty
    }
    
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

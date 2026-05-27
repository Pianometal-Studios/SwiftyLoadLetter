//
//  Emojiable.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/5/26.
//  Apache License 2.0
//

import Foundation

/// A protocol for types that can be represented using emojis, providing a simple way to
/// associate a visual symbol with the type.
///
/// This protocol is ideal for enums or models that benefit from a concise, emoji-based representation,
/// such as status indicators, categories, or any type where a single emoji can effectively convey meaning.
///
/// ## Example
///
/// ```swift
/// enum PrinterStatus: Emojiable {
///     case idle
///     case printing
///     case error
///
///     var emoji: String {
///         switch self {
///         case .idle: "🖨️"
///         case .printing: "⏳"
///         case .error: "❌"
///         }
///     }
/// }
/// ```
public protocol Emojiable {
    
    /// A string representation of the conforming type using emojis.
    ///
    /// - Note: Works best with one emoji. Ex: "🖨️"
    var emoji: String { get }
}

public extension Emojiable where Self: Nameable {
    
    /// Combines the `emoji` and `name` properties into a single
    /// string for display purposes.
    ///
    /// ## Example
    /// ```swift
    /// struct SwiftyLoadLetter: Nameable, Emojiable {
    ///    let name = "SwiftyLoadLetter"
    ///    let emoji: "🖨️"
    /// }
    /// let package = Printer(name: "SwiftyLoadLetter", emoji: "🖨️")
    /// Text(package.label) // Displays "🖨️ SwiftyLoadLetter"
    /// ```
    ///
    /// - Returns: A string that concatenates the `emoji`
    ///   and `name` properties.
    var emojiLabel: String {
        "\(emoji) \(name)"
    }
}

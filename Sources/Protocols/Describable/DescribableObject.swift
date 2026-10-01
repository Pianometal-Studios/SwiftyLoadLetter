//
//  DescribableObject.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/25/26.
//  Apache License 2.0
//

import Foundation

/// A simple struct that conforms to `Searchable`, `Iconable`, and `Describable`, representing an
/// object with a name, an SF Symbol icon, and a descriptive details string.
///
/// Its identity comes from its name and icon. Two objects built from the same pair have the same
/// `id`, and changing `details` keeps it, so one object can describe a changing state without
/// becoming a new item. Equality still compares the details.
public struct DescribableObject: Searchable, Iconable, Describable, Sendable, Codable {
    
    public let id: String
    public let name: String
    public let icon: String
    public var details: String
 
    /// Initializes a new `DescribableObject` with the specified name, icon, and details.
    ///
    /// The object's `id` is `name` and `icon` joined by a `|`, which no SF Symbol name contains,
    /// so no other pair produces the same `id`. `details` doesn't affect it.
    ///
    /// - Parameters:
    ///   - name: The display name of the object.
    ///   - icon: SF Symbol name representing the object's icon.
    ///   - details: A human‑readable description or summary of the object
    public init(
        _ name: String,
        icon: String,
        details: String
    ) {
        self.id = "\(name)|\(icon)"
        self.name = name
        self.icon = icon
        self.details = details
    }
    
    /// Creates an object from a decoder, deriving its `id` from the decoded name and icon.
    ///
    /// Any `id` in the payload is ignored, so a decoded object always equals one built from the
    /// same name, icon and details.
    ///
    /// - Parameter decoder: The decoder to read from.
    /// - Throws: `DecodingError` when the name, icon or details is missing or isn't a string.
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        try self.init(
            container.decode(String.self, forKey: .name),
            icon: container.decode(String.self, forKey: .icon),
            details: container.decode(String.self, forKey: .details))
    }
}

//
//  IconableObject.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/25/26.
//  Apache License 2.0
//

import Foundation

/// A simple struct that conforms to `Searchable` and `Iconable`, representing an
/// object with a name and an associated SF Symbol icon.
///
/// Its identity comes from its content. Two objects built from the same name and icon have the
/// same `id` and compare equal, so one built inside a view's `body` is the same value on every
/// render and can sit in a `ForEach`, a selection or an animation's value like any other model.
public struct IconableObject: Searchable, Iconable, Sendable, Codable {
    
    public let id: String
    public let name: String
    public let icon: String
    
    /// Creates a new `IconableObject` with the specified name and icon.
    ///
    /// The object's `id` is `name` and `icon` joined by a `|`, which no SF Symbol name contains,
    /// so no other pair produces the same `id`.
    ///
    /// - Parameters:
    ///   - name: The display name of the object.
    ///   - icon: The SF Symbol name representing the object's icon.
    public init(_ name: String, icon: String) {
        self.id = "\(name)|\(icon)"
        self.name = name
        self.icon = icon
    }
    
    /// Creates an object from a decoder, deriving its `id` from the decoded name and icon.
    ///
    /// Any `id` in the payload is ignored, so a decoded object always equals one built from the
    /// same name and icon.
    ///
    /// - Parameter decoder: The decoder to read from.
    /// - Throws: `DecodingError` when the name or icon is missing or isn't a string.
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        try self.init(
            container.decode(String.self, forKey: .name),
            icon: container.decode(String.self, forKey: .icon))
    }
}

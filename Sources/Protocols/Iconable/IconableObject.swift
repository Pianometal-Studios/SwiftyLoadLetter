//
//  IconableObject.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/25/26.
//  MIT License
//

import Foundation

/// A simple struct that conforms to `Searchable` and `Iconable`, representing an
/// object with a name and an associated SF Symbol icon.
public struct IconableObject: Searchable, Iconable, Sendable, Codable {
    
    public let id: String
    public let name: String
    public let icon: String
    
    /// Creates a new `IconableObject` with the specified name and icon.
    ///
    /// - Parameters:
    ///   - name: The display name of the object.
    ///   - icon: The SF Symbol name representing the object's icon.
    public init(_ name: String, icon: String) {
        self.id = UUID().uuidString
        self.name = name
        self.icon = icon
    }
}

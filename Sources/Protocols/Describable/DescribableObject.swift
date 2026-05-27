//
//  DescribableObject.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/25/26.
//  Apache License 2.0
//

import Foundation

/// A simple struct that conforms to `Searchable`, `Iconable`, and `Describable`, representing an
/// object with a name, an optional SF Symbol icon, and a descriptive details string.
public struct DescribableObject: Searchable, Iconable, Describable, Sendable, Codable {
    
    public let id: String
    public let name: String
    public let icon: String
    public var details: String
 
    /// Initializes a new `DescribableObject` with the specified name, optional icon, and details.
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
        self.id = UUID().uuidString
        self.name = name
        self.icon = icon
        self.details = details
    }
}

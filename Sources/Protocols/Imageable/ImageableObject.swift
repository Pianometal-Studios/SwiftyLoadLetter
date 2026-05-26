//
//  ImageableObject.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/25/26.
//  MIT License
//

import SwiftUI

/// A simple struct that conforms to `Searchable` and `Imageable`, representing an
/// object with a name and an associated image resource.
public struct ImageableObject: Searchable, Imageable, Sendable {
    
    public let id: UUID
    public let name: String
    public let image: ImageResource
    
    /// Creates a new `ImageableObject` with the specified name, image resource, and optional details.
    ///
    /// - Parameters:
    ///   - name: The display name of the object.
    ///   - image: The `ImageResource` representing the object's image.
    public init(_ name: String, image: ImageResource) {
        self.id = .init()
        self.name = name
        self.image = image
    }
}

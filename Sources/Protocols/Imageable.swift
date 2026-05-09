//
//  Imageable.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import SwiftUI

/// A lightweight protocol that marks a type as capable of providing a SwiftUI image resource.
///
/// Conforming types expose a single `image` property that returns an `ImageResource`,
/// which can be used to construct a SwiftUI `Image`.
///
/// ## Use Cases
/// - Abstract image retrieval logic away from view code.
/// - Provide a consistent image for enums or models (e.g., tab bar items, list rows).
/// - Centralize asset references to avoid hard‑coded strings and improve type safety.
///
/// ## Example
/// ```swift
/// enum Tab: Imageable {
///
///     case home
///     case settings
///
///     var image: ImageResource {
///         switch self {
///         case .home: .homeIcon
///         case .settings: .settingsIcon
///         }
///     }
/// }
/// ```
public protocol Imageable {
    
    /// - Note: The `@MainActor` annotation indicates that the `image` property
    /// should be accessed on the main thread, which is important for UI-related resources.
    /// - Returns: An `ImageResource` representing the conforming type.
    @MainActor var image: ImageResource { get }
}

// MARK: - Imageable Object

/// A simple struct that conforms to `Searchable` and `Imageable`, representing an
/// object with a name and an associated image resource.	
public struct ImageableObject: Searchable, Imageable, Describable, Sendable {
    
    public let id: UUID
    public let name: String
    public let image: ImageResource
    public var details: String
    
    /// - Returns: A Boolean value indicating whether the `details` property contains non‑empty text.
    public var hasDetails: Bool {
        !details.isEmpty
    }
    
    /// Creates a new `ImageableObject` with the specified name, image resource, and optional details.
    ///
    /// - Parameters:
    ///   - name: The display name of the object.
    ///   - image: The `ImageResource` representing the object's image.
    ///   - details: An optional string providing additional information about the object (default is an empty string).
    public init(
        _ name: String,
        image: ImageResource,
        details: String = ""
    ) {
        self.id = .init()
        self.name = name
        self.image = image
        self.details = details
    }
}

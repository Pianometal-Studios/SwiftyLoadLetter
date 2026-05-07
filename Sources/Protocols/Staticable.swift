//
//  Staticable.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import Foundation
import UniformTypeIdentifiers
import CoreTransferable

/// A convenience protocol that unifies common static, value-like requirements for types,
/// especially string-backed enumerations intended to be safely shared across concurrency domains.
///
/// ## Example Usage
/// - Define an enum of static values (e.g., feature flags, route names, field keys) backed by `String`.
/// - Use the cases as `CodingKey`s when implementing custom `Codable` logic.
/// - Iterate all cases with `CaseIterable` for validation or UI lists.
/// - Pass values across tasks/actors thanks to `Sendable`.
/// - Transfer types conforming to this protocol via drag and drop or copy/paste operations.
///
/// ## Use Cases
/// - Stable identifiers and keys in data models and network payloads.
/// - Configuration namespaces and feature toggles.
/// - Routing and analytics event names.
/// - Schema-like keys used across decoding/encoding boundaries.
/// - Transferable items in drag-and-drop or sharing operations.
///
/// - Requires:
///   - `Identifiable`: Each instance has a stable identity (often derived from its raw value).
///   - `Codable`: Support encoding/decoding for persistence and networking.
///   - `CaseIterable`: Provide a finite, discoverable set of values.
///   - `Hashable` (and `Equatable`): Participate in hashing for use in sets and dictionary keys.
///   - `CodingKey`: Enable use as keys in `Codable` containers.
///   - `Sendable`: Allow safe transfer across concurrency boundaries.
///   - `Transferable`: Support system-level data transfer operations.
///   - `RawRepresentable` where `RawValue == String`: Enable ergonomic serialization and display.
public protocol Staticable:
    Identifiable,
    Codable,
    CaseIterable,
    Hashable,
    CodingKey,
    Sendable,
    Equatable,
    Transferable,
    RawRepresentable where RawValue == String { }

public extension Staticable {
    
    /// The stable identity of this instance, implemented as the instance itself.
    ///
    /// This default implementation satisfies the `Identifiable` protocol requirement
    /// by returning `self`, allowing the entire enum case to serve as its own unique identifier.
    /// This approach works well for static enumerations where each case is inherently unique.
    ///
    /// - Returns: The instance itself as its identity.
    var id: Self { self }
    
    /// A stable, name-spaced identifier suitable for use with `TabView` `customizationID` modifier.
    ///
    /// This value is constructed by combining the app's bundle identifier with the receiver's
    /// `rawValue`, producing a unique, predictable key that avoids collisions across apps and
    /// modules. For example: "com.example.myapp.someId".
    ///
    /// - Use as a persistent identifier when registering or restoring tab configurations.
    /// - Helpful for analytics or state restoration keys that must remain stable across launches.
    ///
    /// - Returns:
    ///   - If `Bundle.main.bundleIdentifier` is available, returns "<bundleID>.<rawValue>".
    ///   - If the bundle identifier is unavailable, logs a debug warning and returns `rawValue`.
    var customizationID: String {
        guard let bundleIdentifier = MainBundle.identifier else {
            logger(
                .swift,
                message: "Returning customizationID without namespace",
                type: .error)
            return rawValue
        }
        return "\(bundleIdentifier).\(rawValue)"
    }
    
    /// The transfer representation for this type, enabling drag-and-drop and copy/paste operations.
    ///
    /// This default implementation uses `CodableRepresentation` with a custom content type
    /// derived from the app's bundle identifier (via `UTType.fromBundle`). This allows
    /// conforming types to participate in system-level data transfer operations while
    /// maintaining type safety and automatic encoding/decoding via `Codable`.
    ///
    /// - Returns: A `CodableRepresentation` configured for the conforming type with
    ///   a bundle-specific content type.
    ///
    /// - Note: The content type is based on `UTType.fromBundle`, which uses your app's
    ///   bundle identifier to create a unique uniform type identifier.
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(for: Self.self, contentType: UTType.fromBundle)
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI
private enum DemoObject: String, Staticable {
    case first, second, third
}
#Preview {
    let random = DemoObject.allCases.randomElement() ?? .first
    Text(random.customizationID)
}
#endif

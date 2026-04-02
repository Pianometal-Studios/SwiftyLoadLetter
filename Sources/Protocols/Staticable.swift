//
//  Staticable.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import Foundation

/// A convenience protocol that unifies common static, value-like requirements for types,
/// especially string-backed enumerations intended to be safely shared across concurrency domains.
///
/// ## Example Usage
/// - Define an enum of static values (e.g., feature flags, route names, field keys) backed by `String`.
/// - Use the cases as `CodingKey`s when implementing custom `Codable` logic.
/// - Iterate all cases with `CaseIterable` for validation or UI lists.
/// - Pass values across tasks/actors thanks to `Sendable`.
///
/// ## Use Cases
/// - Stable identifiers and keys in data models and network payloads.
/// - Configuration namespaces and feature toggles.
/// - Routing and analytics event names.
/// - Schema-like keys used across decoding/encoding boundaries.
///
/// - Requires:
///   - `Identifiable` so each instance has a stable identity (often derived from its raw value).
///   - Support encoding/decoding via `Codable` for persistence and networking.
///   - Provide a finite, discoverable set of values via `CaseIterable`.
///   - Participate in hashing (`Hashable`) for use in sets and dictionary keys.
///   - Behave as a `CodingKey`, enabling use as keys in `Codable` containers.
///   - `Sendable`, allowing safe transfer across concurrency boundaries.
///   - Must support equality comparison (`Equatable`).
///   - `RawRepresentable` with a `String` raw value, enabling ergonomic serialization and display.
///
/// - Authors: [@pianometal](https://github.com/pianometal)
public protocol Staticable:
    Identifiable,
    Codable,
    CaseIterable,
    Hashable,
    CodingKey,
    Sendable,
    Equatable,
    RawRepresentable where RawValue == String { }

public extension Staticable {
    
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
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var customizationID: String {
        guard let bundleIdentifier = MainBundle.identifier else {
            printOnDebug("⚠️ Bundle identifier is nil. Using \(rawValue) for customizationID.")
            return rawValue
        }
        return "\(bundleIdentifier).\(rawValue)"
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

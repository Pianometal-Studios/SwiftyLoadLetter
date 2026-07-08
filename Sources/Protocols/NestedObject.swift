//
//  NestedObject.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 7/8/26.
//  Apache License 2.0
//

import Foundation

/// A lightweight marker protocol for types that represent nested, non-top-level
/// persistent objects (e.g., embedded value types or subrecords) that still need
/// to participate in common Swift and app infrastructure features.
///
/// - Unlike top-level records, nested objects typically do not manage their own
///   storage locations or references; they are usually stored as fields within
///   another record.
/// - The `ID` associated type comes from `Identifiable`. Implementers are free to
///   choose an appropriate identity type (e.g., `String`, `UUID`) depending on the
///   semantics of the nested object.
/// - Ensure that any properties not intended to be persisted or transmitted are
///   excluded or handled via custom `Codable` implementations.
///
/// - Requires:
///   - `Codable`: so values can be serialized to and from storage or network representations (such as JSON).
///   - `Sendable`: to safely cross concurrency domains when used with Swift Concurrency.
///   - `Identifiable`: to provide a stable identity when used in lists, caches, or diffing.
///   - `Hashable`: to enable use in sets, as dictionary keys, and for efficient diffing.
public protocol NestedObject: Codable,
                              Sendable,
                              Identifiable,
                              Hashable { }

//
//  Formatters.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/11/26.
//  Apache License 2.0
//

import Foundation

/// A namespace for shared formatter instances.
public enum Formatters {
    
    /// A shared, lazily initialized `ByteCountFormatter` configured for human-readable memory sizes.
    ///
    /// ## Configuration
    /// - `allowedUnits`: `.useAll` to allow the formatter to choose the most appropriate unit
    ///   (bytes, KB, MB, GB, etc.) based on the value.
    /// - `countStyle`: `.memory` to format values using memory semantics (base-2 units,
    ///   e.g., KB = 1024 bytes).
    ///
    /// ## Example
    /// ```swift
    /// let sizeInBytes: Int64 = 5_242_880
    /// let text = Formatters.byteCount.string(fromByteCount: sizeInBytes) // "5 MB"
    /// ```
    ///
    /// - Important: This instance is configured once at initialization and must not be mutated
    ///   afterward. It is marked `nonisolated(unsafe)` because `ByteCountFormatter` is not
    ///   `Sendable`, but concurrent read-only access via `string(fromByteCount:)` is safe.
    ///   Concurrent mutation is not.
    ///
    /// - Returns: A shared `ByteCountFormatter` instance for formatting byte counts in a
    ///   human-readable way.
    nonisolated(unsafe) public static let byteCount: ByteCountFormatter = {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = .useAll
        formatter.countStyle = .memory
        return formatter
    }()
}

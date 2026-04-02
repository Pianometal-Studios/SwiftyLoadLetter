//
//  Formatters.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/11/26.
//  MIT License
//

import Foundation

/// A namespace for shared formatter instances.
public enum Formatters {
    
    /// A shared, lazily initialized `ByteCountFormatter` configured for human‑readable memory sizes.
    /// 
    /// - Configuration:
    ///   - `allowedUnits`: `.useAll` to allow the formatter to choose the most appropriate unit
    ///     (bytes, KB, MB, GB, etc.) based on the value.
    ///   - `countStyle`: `.memory` to format values using memory semantics (base‑2 units,
    ///     e.g., KB = 1024 bytes).
    ///
    /// - Use this formatter to display file sizes, memory usage, or any byte counts in a
    ///   localized, user‑friendly string without repeatedly creating new formatter instances.
    ///
    /// Example:
    /// ```swift
    /// let sizeInBytes: Int64 = 5_242_880 // 5 MB
    /// let text = Formatters.byteCount.string(fromByteCount: sizeInBytes) // "5 MB" (locale dependent)
    /// ```
    @MainActor public static let byteCount: ByteCountFormatter = {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = .useAll
        formatter.countStyle = .memory
        return formatter
    }()
}

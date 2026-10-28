//
//  String.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 10/28/26.
//  Apache License 2.0
//

import Foundation

public extension String {
    
    /// Indicates whether the string is empty or contains only whitespace and newlines.
    ///
    /// ## Example
    /// ```swift
    /// "".isBlank      // true
    /// " \n\t".isBlank // true
    /// " a ".isBlank   // false
    /// ```
    ///
    /// - Returns: `true` when nothing remains after trimming; otherwise `false`.
    var isBlank: Bool {
        trimmed.isEmpty
    }
    
    /// The string without leading and trailing whitespace and newlines.
    ///
    /// Whitespace inside the string is left alone.
    ///
    /// ## Example
    /// ```swift
    /// "  Hello, world!\n".trimmed // "Hello, world!"
    /// ```
    ///
    /// - Returns: The result of `trimmingCharacters(in: .whitespacesAndNewlines)`.
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

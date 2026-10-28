//
//  Collection.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 10/28/26.
//  Apache License 2.0
//

import Foundation

public extension Collection {
    
    /// The collection itself, or `nil` when it has no elements.
    ///
    /// Use this to collapse "missing" and "empty" into a single `nil`, so a caller tests one
    /// thing instead of both. It works on any collection, including `Array`, `Set`,
    /// `Dictionary`, and `String`.
    ///
    /// ## Example
    /// ```swift
    /// let matches = items.filter { $0.isFavorite }
    /// return matches.nilIfEmpty
    ///
    /// let nickname = field.trimmed.nilIfEmpty ?? "Anonymous"
    /// ```
    ///
    /// - Returns: `self` when it contains at least one element; otherwise `nil`.
    var nilIfEmpty: Self? {
        isEmpty ? nil : self
    }
}

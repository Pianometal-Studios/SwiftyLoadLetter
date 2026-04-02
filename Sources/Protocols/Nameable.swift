//
//  Nameable.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import Foundation

/// A simple protocol that represents any type that can be identified by a human‑readable name.
///
/// ## Example
/// ```swift
/// struct Person: Nameable {
///     let name: String
/// }
/// let person = Person(name: "Ada")
/// Text(person.name)
/// ```
///

public protocol Nameable {
    
    /// - Returns: A human‑readable name identifying the conforming type.
    var name: String { get }
}

public extension Nameable {
    
    /// Returns a Boolean value indicating whether the left-hand side value should be
    /// ordered before the right-hand side value by comparing their `name` properties.
    ///
    /// This default implementation enables `Nameable` types to participate in
    /// sorting and other ordered operations by using a lexicographical comparison of
    /// their human‑readable `name`s.
    ///
    /// - Parameters:
    ///   - lhs: A `Nameable` value to compare for ordering.
    ///   - rhs: Another `Nameable` value to compare to `lhs`.
    ///
    /// - Returns: `true` if `lhs.name` is lexicographically less than `rhs.name`;
    ///   otherwise, `false`.
    ///
    /// - Complexity: O(m), where m is the length of the shorter name being compared.
    ///
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.name < rhs.name
    }
}

public extension Collection where Element: Nameable {
    
    /// Returns the elements whose `name` contains the given search text, using a
    /// case‑insensitive, locale‑aware comparison.
    ///
    /// /// The search checks if each element’s `name` contains the provided `text`.
    /// `@inlineable` is used to suggest to the compiler that it is allowed to inline this
    /// function. This can improve performance by eliminating the function call
    /// overhead, especially in performance-critical code paths or tight loops.
    ///
    /// If `text` is empty, all elements are returned.
    ///
    /// - Parameter text: The text to search for within each element’s `name`.
    ///
    /// - Returns: An array of elements whose `name` matches the provided text.
    ///
    /// - Note: Matching uses `localizedCaseInsensitiveContains(_:)`, which respects the current locale.
    ///
    /// - Complexity: O(n), where n is the number of elements in the collection.
    @inlinable func search(_ text: String) -> [Element] {
        filter {
            text.isEmpty ||
            $0.name.localizedCaseInsensitiveContains(text)
        }
    }
}

//
//  Listable.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 4/17/25.
//  Apache License 2.0
//

import Foundation

/// A marker protocol for types that can be displayed within a list-based UI and provide a
/// static navigation title for that context.
public protocol Listable {
    
    /// Used for navigation bars, section headers, or destinations when presenting
    /// collections of instances of the conforming type.
    static var navigationTitle: String { get }
}

public extension Listable {
    
    /// Automatically generates a collection name from the type's `navigationTitle`.
    ///
    /// The collection name is created by:
    /// 1. Converting the `navigationTitle` to lowercase
    /// 2. Removing all whitespace, newlines, and punctuation characters
    /// 3. Joining the remaining components into a single string
    ///
    /// ## Example
    /// - "User Profiles" → "userprofiles"
    /// - "My-Items" → "myitems"
    /// - "Task List!" → "tasklist"
    ///
    /// This approach ensures collection names are clean, lowercase strings suitable
    /// for use as database collection identifiers.
    ///
    /// - Returns: A sanitized collection name derived from `navigationTitle`.
    static var collection: String {
        navigationTitle
            .lowercased()
            .components(separatedBy: .whitespacesAndNewlines.union(.punctuationCharacters))
            .joined()
    }
}

//
//  Searchable.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import Foundation

/// A convenience composition that models an entity suitable for search features.
///
/// Use `Searchable` for models that will appear in searchable lists, indexes,
/// and autocomplete UIs.
///
/// - Requires:
///   - `Nameable`: Provides a `name` (or similar) property used for display and matching.
///   - `Identifiable`: Supplies a unique `id` for stable identity across sessions.
///   - `Hashable`: Enables efficient collection operations and diffing.
///   - `Comparable`: Allows consistent sorting of search results.
///
/// - Authors: [@pianometal](https://github.com/pianometal)
public protocol Searchable:
    Nameable,
    Identifiable,
    Hashable,
    Comparable { }

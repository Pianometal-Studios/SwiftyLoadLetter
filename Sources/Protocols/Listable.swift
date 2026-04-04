//
//  Listable.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 4/17/25.
//  MIT License
//

import Foundation

/// A marker protocol for types that can be displayed within a list-based UI and provide a
/// static navigation title for that context.
public protocol Listable {
    
    /// Used for navigation bars, section headers, or destinations when presenting
    /// collections of instances of the conforming type.
    static var navigationTitle: String { get }
}

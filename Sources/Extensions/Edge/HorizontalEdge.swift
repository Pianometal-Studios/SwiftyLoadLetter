//
//  HorizontalEdge.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/8/26.
//  MIT License
//

import SwiftUI

public extension HorizontalEdge {
    
    /// Converts a `HorizontalEdge` to its corresponding `Edge`.
    ///
    /// - Returns: An `Edge` instance corresponding to the `HorizontalEdge`.
    func toEdge() -> Edge {
        switch self {
        case .leading: .leading
        case .trailing: .trailing
        }
    }
}

public extension Edge {
    
    /// Converts an `Edge` to its corresponding `HorizontalEdge` if applicable.
    ///
    /// - Returns: A `HorizontalEdge` instance corresponding to the `Edge`, or `nil` if not horizontal.
    func horizontal() -> HorizontalEdge? {
        switch self {
        case .leading: .leading
        case .trailing: .trailing
        default: nil
        }
    }
}

//
//  VerticalEdge.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/8/26.
//  Apache License 2.0
//

import SwiftUI

public extension VerticalEdge {
    
    /// Converts a `VerticalEdge` to its corresponding `Edge`.
    ///
    /// - Returns: An `Edge` instance corresponding to the `VerticalEdge`.
    func toEdge() -> Edge {
        switch self {
        case .top: .top
        case .bottom: .bottom
        }
    }
}

public extension Edge {
    
    /// Converts an `Edge` to its corresponding `VerticalEdge` if applicable.
    ///
    /// - Returns: A `VerticalEdge` instance corresponding to the `Edge`, or `nil` if not vertical.
    func vertical() -> VerticalEdge? {
        switch self {
        case .top: .top
        case .bottom: .bottom
        default: nil
        }
    }
}

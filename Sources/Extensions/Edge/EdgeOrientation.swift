//
//  EdgeOrientation.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/8/26.
//  MIT License
//

import SwiftUI

public extension Edge {
    
    /// Defines two primary orientations for `Edge` values.
    ///
    /// ## Horizontal
    /// Represents edges that are either `.leading` or `.trailing`.
    ///
    /// ## Vertical
    /// Represents edges that are either `.top` or `.bottom`.
    enum Orientation: String, Staticable {
        
        /// `Edge.leading` or `Edge.trailing`
        case horizontal
        
        /// `Edge.top` or `Edge.bottom`
        case vertical
    }
    
    /// Converts the current `Edge` to a specific `Edge` based on the given orientation.
    ///
    /// This method interprets the receiver as either a horizontal or vertical edge
    /// depending on the provided `orientation`, and returns the corresponding
    /// canonical `Edge` value.
    ///
    /// - Parameter orientation: The axis (`.horizontal` or `.vertical`) that determines how to interpret the current edge.
    ///
    /// - Returns: The corresponding `Edge` on the specified orientation, or `nil` if the precondition is not met.
    ///
    /// - Precondition:
    ///   - When `orientation` is `.horizontal`, `self` is `.leading` or `.trailing`;
    ///   - When `orientation` is `.vertical`, `self` is `.top` or `.bottom`.
    func toEdge(_ orientation: Edge.Orientation) -> Self? {
        switch orientation {
        case .horizontal: horizontal()?.toEdge()
        case .vertical: vertical()?.toEdge()
        }
    }
}

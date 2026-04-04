//
//  Colorable.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import SwiftUI

/// A lightweight protocol for types that have a `Color` associated with them.
///
/// Conforming to `Colorable` allows a type to expose a primary or representative color
/// that can be used for UI styling, theming, or visualization (e.g., tinting icons,
/// backgrounds, or labels).
///
/// ## Example
/// ```swift
/// struct Crayon: Nameable, Colorable {
///     let name: String
///     let color: Color
/// }
/// ```
public protocol Colorable {
    
    /// - Returns: SwiftUI `Color` representing the conforming type.
    var color: Color { get }
}

// MARK: - Preview

#if DEBUG
private struct Crayon: Nameable, Colorable {
    let name: String
    let color: Color
}
#Preview {
    let crayon = Crayon(name: "Blue", color: .blue)
    Label {
        Text(crayon.name)
    } icon: {
        Image(systemName: "circle")
            .symbolVariant(.fill)
            .symbolColorRenderingMode(.gradient)
            .foregroundStyle(crayon.color)
    }
}
#endif

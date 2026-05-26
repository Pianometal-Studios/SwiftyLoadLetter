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

public extension Colorable where Self: Nameable & Iconable & Describable {
    
    /// Displays a message indicating that the content is unavailable, along with an icon
    /// and a description.
    ///
    /// This view is intended to be used when the content is unavailable due to an error
    /// or other issue, and it provides a visual indication of the problem along with a
    /// description of the issue.
    ///
    /// - Returns: A view that displays a message indicating that the content is
    ///   unavailable, along with an icon and a description.
    @MainActor var contentUnavailableView: some View {
        DescribableCardView(self, color: color)
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    PressureLevel.normal.contentUnavailableView
        .symbolVariant(.fill)
        .symbolColorRenderingMode(.gradient)
}
#endif

//
//  Describable.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import Foundation

/// A lightweight protocol for types that can provide a human‑readable description of themselves,
///
/// Conform to `Describable` when you want to expose a concise, user‑facing explanation or
/// additional context about a value beyond its primary title or name. For example, a model might
/// conform to both `Nameable` (for a short title) and `Describable` (for longer details).
///
/// ## Example
/// ```swift
/// struct Magazine: Nameable, Describable {
///     let name = "Nintendo Power"
///     let details = "Now you're playing with power!"
/// }
/// ```
public protocol Describable {
    
    /// - Returns: A human‑readable, user‑facing description or summary of the value.
    var details: String { get }
}

public extension Describable where Self: Nameable & Iconable {
    
    /// Displays a message indicating that the content is unavailable, along with an icon
    /// and a description.
    ///
    /// This view is intended to be used when the content is unavailable due to an error
    /// or other issue, and it provides a visual indication of the problem along with a
    /// description of the issue.
    ///
    /// - Returns: A view that displays a message indicating that the content is
    ///   unavailable, along with an icon and a description.
    var contentUnavailableView: some View {
        ContentUnavailableView(
            name,
            systemImage: icon,
            description: Text(details))
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI
private struct Magazine: Nameable, Describable, Iconable {
    let name = "Walking"
    let icon = "figure.walk"
    let details = "They have a magazine for walking.\nWALKING!!!"
}
#Preview {
    Magazine()
        .contentUnavailableView
        .padding()
}
#endif

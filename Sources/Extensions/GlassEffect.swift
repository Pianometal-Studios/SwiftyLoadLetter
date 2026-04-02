//
//  GlassEffect.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/8/26.
//  MIT License
//

import SwiftUI

public extension View {
    
    /// Applies a system glass material effect to the view with configurable style, shape, interactivity, and tint
    /// for platforms other than visionOS.
    ///
    /// This modifier wraps the platform glass effect (via `glassEffect`) and makes writing code
    /// for cross-platform development on `visionOS` easier by providing a no-op implementation
    /// on that platform.
    ///
    /// ## Example
    /// ```swift
    /// VStack {
    ///     Text("Default")
    ///         .padding()
    ///         .glass()
    ///     Text("Modified")
    ///         .padding()
    ///         .glass(
    ///             isRegular: false,
    ///             shape: .capsule,
    ///             isInteractive: false,
    ///             tint: .blue.opacity(0.2))
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - isRegular: Determines whether to use the regular glass material (`true`)
    ///    or clear glass material (`false`). Defaults to `true`.
    ///   - shape: The shape used to clip and define the boundary of the glass effect.
    ///    Defaults to `.buttonBorder`.
    ///   - isInteractive: Indicates whether the glass should present interactive affordances,
    ///     such as hover or pressed states, when applicable. Defaults to `true`.
    ///   - tint: Optional color to tint the glass material. Pass `nil` to use the system’s default neutral
    ///     tint. Defaults to `nil`.
    ///
    /// - Returns:
    ///   - A view that renders the receiver with the specified glass material effect applied, when
    ///   not running on visionOS.
    ///   - On visionOS, the original view is returned unmodified.
    ///
    /// - Important: On visionOS, this implementation is a no-op and returns the original view unmodified.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    @ViewBuilder func glass(
        isRegular: Bool = true,
        shape: some Shape = .buttonBorder,
        isInteractive: Bool = true,
        tint: Color? = nil
    ) -> some View {
#if !os(visionOS)
        let glass: Glass = isRegular ? .regular : .clear
        glassEffect(
            glass
                .interactive(isInteractive)
                .tint(tint),
            in: shape)
#else
        self
#endif
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    VStack {
        if AppleOS.visionOS.isCurrent {
            ContentUnavailableView(
                AppleOS.visionOS.name,
                systemImage: AppleOS.visionOS.icon,
                description: Text("This modifier is a no-op on \(AppleOS.visionOS.details)"))
        }
        Text("Default")
            .padding()
            .glass()
        Text("Modified")
            .padding()
            .glass(
                isRegular: false,
                shape: .capsule,
                isInteractive: false,
                tint: .blue.opacity(0.2))
    }
}
#endif

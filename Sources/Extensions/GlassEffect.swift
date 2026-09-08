//
//  GlassEffect.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/8/26.
//  Apache License 2.0
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
    /// The drawn glass is also the tap target. `shape` is applied as the view’s `contentShape`
    /// alongside the glass, because `glassEffect` renders the shape while hit testing still
    /// follows the receiver’s visible content — so a small label centered in a larger
    /// transparent frame would *look* full size while only its glyph registered a touch.
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
    /// Because the hit area comes from the same `shape` that draws the glass, the two can never
    /// drift apart, and a glass control built over a transparent frame is tappable to its edges:
    ///
    /// ```swift
    /// Button(action: deleteDigit) {
    ///     Image(systemName: "delete.left")
    ///         .frame(width: 60, height: 62)
    ///         .glass(shape: .rect(cornerRadius: 14))
    /// }
    /// .buttonStyle(.plain)
    /// ```
    ///
    /// - Parameters:
    ///   - isRegular: Determines whether to use the regular glass material (`true`)
    ///    or clear glass material (`false`). Defaults to `true`.
    ///   - shape: The shape used to clip and define the boundary of the glass effect, and the
    ///    shape made hit-testable so taps land anywhere on the drawn glass.
    ///    Defaults to `.buttonBorder`.
    ///   - isInteractive: Indicates whether the glass should present interactive affordances,
    ///     such as hover or pressed states, when applicable. Defaults to `true`.
    ///   - tint: Optional color to tint the glass material. Pass `nil` to use the system’s default neutral
    ///     tint. Defaults to `nil`.
    ///
    /// - Returns:
    ///   - A view that renders the receiver with the specified glass material effect applied and
    ///   `shape` as its hit area, when not running on visionOS.
    ///   - On visionOS, the original view is returned unmodified.
    ///
    /// - Important: On visionOS, this implementation is a no-op and returns the original view
    ///   unmodified. No glass is drawn there, so none is implied as a hit area and
    ///   `contentShape` is left off as well.
    ///
    /// - Note: A `contentShape` on a non-interactive view is inert, so decorative glass is
    ///   unaffected, and a consumer who already added a matching `contentShape` of their own
    ///   simply has a redundant one.
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
        .contentShape(shape)
#else
        self
#endif
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    @Previewable @State var edgeTapCount = 0
    VStack {
        if AppleOS.visionOS.isCurrent {
            ContentUnavailableView(
                AppleOS.visionOS.name,
                systemImage: AppleOS.visionOS.icon,
                description: Text("This modifier is a no-op on \(AppleOS.visionOS.device)"))
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
        Button { edgeTapCount += 1 } label: {
            Image(systemName: "delete.left")
                .glass(shape: .capsule)
        }
        .buttonStyle(.plain)
        Text("Corner taps: \(edgeTapCount)")
            .font(.caption)
            .foregroundStyle(.secondary)
    }
}
#endif

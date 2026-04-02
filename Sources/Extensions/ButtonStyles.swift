//
//  ButtonStyles.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/8/26.
//  MIT License
//

import SwiftUI

public extension View {
    
    /// Applies a platform-appropriate `glass` button style to the view, with an option to fall back to a supplied primitive button style.
    ///
    /// This helper allows more flexible coding practices when writing for multiple platforms, specifically `visionOS`. It will choose between a custom glass
    /// appearance and standard SwiftUI button styles based on:
    /// - The style you pass in (e.g., prominent vs. regular)
    /// - The current platform (e.g., `visionOS` does not support `Glass` at all)
    ///
    /// ## Behavior
    /// - If the provided style is `BorderedProminentButtonStyle` or `GlassProminentButtonStyle`, the view
    /// receives a prominent glass style on supported platforms, or `.borderedProminent` on visionOS.
    /// - For all other styles, the view receives the regular glass style on supported platforms, or the provided primitive
    /// style on visionOS.
    ///
    /// - Parameter primitiveButtonStyle: The desired primitive button style to use as input and as a fallback on
    /// platforms where the glass style is unavailable. Defaults to `.bordered`.
    ///
    /// - Returns: A view with the appropriate button style applied.
    ///
    /// - Note: On platforms where the glass style is unsupported (such as visionOS), this method falls back to standard
    /// SwiftUI styles to ensure consistent behavior.
    ///
    /// - Important: Providing `glass` or `glassProminent` directly to this method will cause compilation
    /// errors on `visionOS`. Use `borderedProminent` or no parameter to fallback to `bordered`.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    @ViewBuilder func glassButton(
        or primitiveButtonStyle: some PrimitiveButtonStyle = .bordered
    ) -> some View {
        
        switch primitiveButtonStyle {
            
        case is BorderedProminentButtonStyle:
            
#if !os(visionOS)
            buttonStyle(.glassProminent)
#else
            buttonStyle(.borderedProminent)
#endif
            
        default:
            
#if !os(visionOS)
            buttonStyle(.glass)
#else
            buttonStyle(primitiveButtonStyle)
#endif
        }
    }
}

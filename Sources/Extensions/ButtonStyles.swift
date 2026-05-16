//
//  ButtonStyles.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/8/26.
//  MIT License
//

import SwiftUI

public extension View {
    
    
    /// Applies a platform-appropriate glass button style to the view.
    ///
    /// This modifier provides a consistent way to apply glass-style button appearances across
    /// different Apple platforms, automatically adapting to each platform's capabilities and
    /// design guidelines.
    ///
    /// ## Platform Behavior
    ///
    /// - **tvOS**: Always uses `.card` button style, ignoring the fallback parameter.
    /// - **iOS, iPadOS, macOS, watchOS**: Applies `.glass` or `.glassProminent` button
    ///   styles depending on whether the fallback is `.borderedProminent`.
    /// - **visionOS**: Uses the provided fallback `primitiveButtonStyle` since glass
    ///   styles are handled differently in the spatial computing environment.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// Button("Submit") {
    ///     // Action
    /// }
    /// .glassButton()
    ///
    /// Button("Primary Action") {
    ///     // Action
    /// }
    /// .glassButton(or: .borderedProminent)
    /// ```
    /// - Parameter primitiveButtonStyle: A fallback button style to use when glass styles
    ///   are not available or not appropriate for the platform. Defaults to `.bordered`.
    ///   On platforms that support glass styles, this parameter is only used for non-glass
    ///   compatible styles or as a fallback on visionOS.
    ///
    /// - Returns: A view with the appropriate button style applied based on the platform
    ///   and the provided fallback style.
    ///
    /// - Note: Glass button styles provide a modern, translucent appearance that blurs
    ///   content behind them and reflects surrounding colors, creating a cohesive visual
    ///   experience with the system UI.
    @ViewBuilder func glassButton(
        or primitiveButtonStyle: some PrimitiveButtonStyle = .bordered
    ) -> some View {
#if os(tvOS)
        buttonStyle(.card)
#else
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
#endif
    }
}

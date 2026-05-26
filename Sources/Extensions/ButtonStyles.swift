//
//  ButtonStyles.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/8/26.
//  MIT License
//

import SwiftUI

public extension View {
    
    /// Applies a platform-appropriate Liquid Glass button style to the view.
    ///
    /// This modifier provides a consistent way to apply Liquid Glass button appearances across
    /// different Apple platforms, automatically adapting to each platform's capabilities and
    /// design guidelines. Liquid Glass is a dynamic material that combines optical properties
    /// of glass with fluidity, blurring content behind it and reflecting surrounding colors.
    ///
    /// ## Platform Behavior
    ///
    /// - **tvOS**: Uses `.card` button style, which provides the appropriate appearance
    ///   for TV interfaces. The fallback parameter is ignored.
    ///
    /// - **macOS**: Uses `.link` button style, which is the standard approach for Mac
    ///   applications. The fallback parameter is ignored.
    ///
    /// - **iOS, iPadOS, watchOS**: Applies `.glass` or `.glassProminent` button styles
    ///   based on the fallback parameter:
    ///   - When fallback is `.borderedProminent`: Uses `.glassProminent` for emphasis
    ///   - For all other fallback styles: Uses `.glass` for a subtle appearance
    ///
    /// - **visionOS**: Uses the provided fallback style directly since glass effects
    ///   in spatial computing are handled differently. Defaults to `.borderedProminent`
    ///   if you specify that as the fallback, otherwise uses your specified style.
    ///
    /// ## Liquid Glass Features
    ///
    /// Liquid Glass buttons provide:
    /// - Dynamic blur effects that adapt to content behind them
    /// - Color and light reflection from surrounding UI elements
    /// - Real-time reactions to touch and pointer interactions
    /// - Smooth morphing and transitions between states
    /// - Consistent integration with system design language
    ///
    /// ## Usage Examples
    ///
    /// ```swift
    /// // Basic glass button with default style
    /// Button("Submit") {
    ///     submitForm()
    /// }
    /// .glassButton()
    ///
    /// // Prominent glass button for primary actions
    /// Button("Save Changes") {
    ///     saveData()
    /// }
    /// .glassButton(or: .borderedProminent)
    ///
    /// // Using with other button configurations
    /// Button {
    ///     performAction()
    /// } label: {
    ///     Label("Download", systemImage: "arrow.down.circle")
    /// }
    /// .glassButton()
    /// .tint(.blue)
    ///
    /// // In a toolbar with multiple actions
    /// HStack(spacing: 12) {
    ///     Button("Cancel") { cancel() }
    ///         .glassButton()
    ///     Button("Done") { complete() }
    ///         .glassButton(or: .borderedProminent)
    /// }
    /// ```
    ///
    /// - Parameter primitiveButtonStyle: A fallback button style used for platform-specific
    ///   behavior. Defaults to `.bordered`. On iOS, iPadOS, and watchOS, this determines
    ///   whether to use `.glass` or `.glassProminent`. On visionOS, this style is applied
    ///   directly. On tvOS, this parameter is ignored in favor of platform-
    ///   appropriate styles (`.card` and `.link` respectively).
    ///
    /// - Returns: A view with the appropriate button style applied based on the platform
    ///   and fallback style configuration.
    @ViewBuilder func glassButton(
        or primitiveButtonStyle: some PrimitiveButtonStyle = .bordered
    ) -> some View {
#if os(tvOS)
        buttonStyle(.card)
#else
        switch primitiveButtonStyle {
        case is BorderedProminentButtonStyle:
#if os(visionOS)
            buttonStyle(.borderedProminent)
#else
            buttonStyle(.glassProminent)
#endif
        default:
#if os(visionOS)
            buttonStyle(primitiveButtonStyle)
#else
            buttonStyle(.glass)
#endif
        }
#endif
    }
}

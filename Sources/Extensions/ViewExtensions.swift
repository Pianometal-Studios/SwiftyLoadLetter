//
//  ViewExtensions.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/9/26.
//  Apache License 2.0
//

import SwiftUI

public extension View {
    
    /// Applies a visual dimming effect to the view based on a Boolean condition.
    ///
    /// When `isTrue` is `true`, the view is desaturated and partially transparent,
    /// making it appear dimmed. When `isTrue` is `false`, the view is rendered at
    /// full saturation and opacity, maintaining its normal appearance.
    ///
    /// ## Example
    /// ```swift
    /// @State private var isProcessing = false
    /// Button("Submit") {
    ///     // Handle submission
    /// }
    /// .darken(when: isProcessing, disable: true)
    /// ```
    ///
    /// - Parameters:
    ///   - isTrue: A Boolean value that determines whether the view should be dimmed.
    ///   - disable: A Boolean value that determines whether the view should also be disabled
    ///     when dimmed. When `true`, the view is disabled when `isTrue` is `true`. Defaults to `false`.
    ///
    /// - Returns: A view with adjusted saturation, opacity, and optionally disabled state
    ///   reflecting the dimmed appearance.
    func darken(when isTrue: Bool, disable: Bool = false) -> some View {
        self
            .disabled(disable ? isTrue : disable)
            .saturation(isTrue ? 0.15 : 1)
            .opacity(isTrue ? 0.65 : 1)
    }
    
    /// Applies an appropriate `PickerStyle` to the view, preferring a segmented control where supported.
    ///
    /// - Returns: A view that applies a platform-appropriate picker style.
    ///   - `.automatic` on watchOS
    ///   - `.segmented` on all other platforms
    @ViewBuilder func segmentedPicker() -> some View {
#if !os(watchOS)
        pickerStyle(.segmented)
#else
        pickerStyle(.automatic)
#endif
    }
}

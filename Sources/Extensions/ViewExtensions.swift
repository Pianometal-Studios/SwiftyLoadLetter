//
//  ViewExtensions.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/9/26.
//  MIT License
//

import SwiftUI

public extension View {
    
    /// Applies a visual emphasis effect to the view based on a Boolean flag.
    ///
    /// When `isTrue` is `true`, the view is rendered at full saturation and full opacity,
    /// making it appear "lit up." When `isTrue` is `false`, the view is desaturated and
    /// partially transparent, making it appear dimmed.
    ///
    /// ## Example
    /// ```swift
    /// @State private var isSelected = false
    /// Image(systemName: "star.fill")
    ///     .lightUp(isSelected)
    /// ```
    ///
    /// - Parameter isTrue: A Boolean value that determines whether the view should be emphasized.
    ///
    /// - Returns: A view with adjusted saturation and opacity reflecting the emphasis state.
    func lightUp(_ isTrue: Bool) -> some View {
        self
            .saturation(isTrue ? 1 : 0.1)
            .opacity(isTrue ? 1 : 0.5)
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

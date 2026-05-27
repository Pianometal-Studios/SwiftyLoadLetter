//
//  ContentTransition.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/16/26.
//  Apache License 2.0
//

import SwiftUI

public extension View {
    
    /// Applies a content transition that uses the system symbol effect with a "magic replace" animation.
    ///
    /// On platforms that support the "magic" variant, the transition animates with enhanced effects;
    /// otherwise it gracefully falls back to a standard replace transition.
    ///
    /// Use this on views where you expect SF Symbols to update in response to state changes. The transition
    /// will be applied when SwiftUI detects a change to the view’s identity or content during updates.
    ///
    /// ## Example
    /// ```swift
    /// @State private var isLoading = false
    /// Image(systemName: isLoading ? "hourglass" : "checkmark")
    ///     .magicReplace()
    /// ```
    ///
    /// - Returns: A view modified to use the magic replace symbol effect for content transitions.
    func magicReplace() -> some View {
        contentTransition(
            .symbolEffect(
                .replace.magic(
                    fallback: .replace)))
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    @Previewable @State var isLoading = false
    Button { isLoading.toggle() } label: {
        Image(systemName: isLoading.icon)
            .padding()
            .magicReplace()
    }
    .tint(isLoading.color)
    .glassButton()
}
#endif

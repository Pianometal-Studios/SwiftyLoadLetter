//
//  ListRowSeparator.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 4/4/26.
//  Apache License 2.0
//

import SwiftUI

public extension View {
    
    /// Hides the list row separator on supported platforms.
    ///
    /// This modifier conditionally applies `.listRowSeparator(.hidden)` to the view when
    /// running on iOS, macOS, or visionOS, where the API is available. On other platforms,
    /// it becomes a no-op and returns the view unchanged.
    ///
    /// This is especially useful for creating cleaner list appearances without relying on
    /// platform checks at call sites.
    ///
    /// ## Example
    /// ```swift
    /// List {
    ///     Text("Item 1")
    ///         .listRowSeparatorHidden()
    /// }
    /// ```
    ///
    /// - Returns:
    ///   - iOS, macOS, visionOS: Uses `listRowSeparator(.hidden)` to hide separators.
    ///   - Other platforms: No effect.
    @ViewBuilder func listRowSeparatorHidden() -> some View {
#if os(iOS) || os(macOS) || os(visionOS)
        listRowSeparator(.hidden)
#else
        self
#endif
    }
}

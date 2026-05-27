//
//  NavigationSubtitle.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/17/26.
//  Apache License 2.0
//

import SwiftUI

public extension View {
    
    /// Sets a secondary line of text in the navigation bar or title area when supported by the platform.
    ///
    /// On platforms that support navigation subtitles (iOS and macOS at the time of writing),
    /// this modifier applies the given string as a subtitle beneath or alongside the primary
    /// navigation title. On other platforms, the modifier is a no-op and returns the view unchanged.
    ///
    /// ## Example
    ///   ```swift
    ///   // Compiles on all platforms, but subtitle only appears on iOS and macOS
    ///   NavigationStack {
    ///       ApplesView()
    ///           .navigationTitle("My Apples")
    ///           .navigationSubtitle(subtitle: "A list of my favorite apples")
    ///   }
    ///   ```
    ///
    /// - Parameter subtitle: The subtitle text to display in the navigation bar or title area.
    ///
    /// - Returns:
    ///   - **iOS, macOS**: Applies the subtitle using the system-supported navigation subtitle API.
    ///   - **Other platforms**: Has no effect; the original view is returned.
    @ViewBuilder func navigationSubtitle<S>(subtitle: S) -> some View where S: StringProtocol {
#if os(iOS) || os(macOS)
        navigationSubtitle(subtitle)
#else
        self
#endif
    }
}

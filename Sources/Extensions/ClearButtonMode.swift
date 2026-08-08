//
//  ClearButtonMode.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 8/8/26.
//  Apache License 2.0
//

#if !os(watchOS)

public import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

public extension View {
    
    /// Applies a default clear button to text fields on UIKit platforms.
    ///
    /// When this modifier's view appears, it sets `UITextField.appearance().clearButtonMode`
    /// to `.whileEditing`, causing a clear (✕) button to be shown while the user is editing
    /// any UIKit-backed `UITextField` (including SwiftUI `TextField` on iOS) in your app.
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     @State private var name = ""
    ///     var body: some View {
    ///         VStack {
    ///             TextField("Name", text: $name)
    ///                 .textFieldStyle(.roundedBorder)
    ///         }
    ///         .clearButtonMode()
    ///     }
    /// }
    /// ```
    ///
    /// - Note: This has no effect on platforms where UIKit isn't available or on watchOS.
    ///
    /// - Returns: A view that, on appear, configures the global `UITextField` clear button mode.
    ///
    /// - Important: This uses the UIKit appearance proxy and therefore affects all `UITextField`
    ///   instances in the process. If you need per-field control, consider a custom wrapper instead
    ///   of setting the global appearance.
    @ViewBuilder func clearButtonMode() -> some View {
#if canImport(UIKit)
        onAppear {
            UITextField.appearance().clearButtonMode = .whileEditing
        }
#else
        self
#endif
    }
}
#endif

//
//  GridItem.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/8/26.
//  MIT License
//

import SwiftUI

public extension GridItem {
    
    /// Creates an array of flexible `GridItem` instances for use with `LazyVGrid` or `LazyHGrid`.
    ///
    /// This convenience method generates a specified number of grid columns or rows,
    /// each configured with a `.flexible()` size, allowing them to expand or shrink
    /// to evenly distribute available space.
    ///
    /// ## Example
    ///   ```swift
    ///   // Three equally flexible columns
    ///   let columns = GridItem.generate()
    ///
    ///   // Two equally flexible rows
    ///   let rows = GridItem.generate(2)
    ///   ```
    ///
    /// - Parameter count: The number of flexible grid items to create. Defaults to `3`.
    ///
    /// - Returns: An array containing `count` flexible `GridItem` values.
    ///
    /// - Note: Use this to quickly set up uniform grid layouts without manually repeating `GridItem(.flexible())`.
    static func generate(_ count: Int = 3) -> [Self] {
        Array(repeating: GridItem(.flexible()), count: count)
    }
    
    /// Creates an array of `GridItem` values suitable for list-like layouts that adapts to the horizontal size class.
    ///
    /// This helper returns one flexible grid item in compact environments (e.g., iPhone in portrait)
    /// and two flexible grid items in regular environments (e.g., iPad or iPhone in landscape on some devices).
    /// It is intended for quickly configuring `LazyVGrid` or `LazyHGrid` to behave like a list that
    /// becomes a two-column layout when more horizontal space is available.
    ///
    /// ## Example
    ///   ```swift
    ///   @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    ///   var body: some View {
    ///       LazyVGrid(columns: GridItem.list(horizontalSizeClass)) {
    ///           // Content
    ///       }
    ///   }
    ///   ```
    ///
    /// - Parameter sizeClass: The current horizontal `UserInterfaceSizeClass`. Pass the environment value
    ///   from `@Environment(\.horizontalSizeClass)` or `nil` if unknown.
    ///
    /// - Returns: An array of flexible `GridItem` values: one when the size class is `nil` or `.compact`,
    ///   and two when the size class is `.regular`.
    static func list(_ sizeClass: UserInterfaceSizeClass?) -> [Self] {
        guard let sizeClass else { return generate(1) }
        return generate(sizeClass == .regular ? 2 : 1)
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    @Previewable @Environment(\.horizontalSizeClass) var horizontalSizeClass
    ScrollView {
        LazyVGrid(columns: GridItem.list(horizontalSizeClass), pinnedViews: .sectionHeaders) {
            Section {
                ForEach(0..<100) { index in
                    LabeledContent("Item Number", value: index.formatted())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .glass(isInteractive: false, tint: .blue.opacity(0.2))
                }
            } header: {
                Text("GridItem Demo")
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .glass(isRegular: false)
            }
        }
        .padding()
    }
    .safeAreaBar(edge: .bottom) {
        LabeledContent {
            Text(horizontalSizeClass.name)
        } label: {
            Text("Horizontal Size Class")
        }
        .padding()
        .glass(isRegular: false)
        .padding(.horizontal)
    }
}
#endif

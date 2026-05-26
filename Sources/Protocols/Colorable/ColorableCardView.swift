//
//  ColorableCardView.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/6/26.
//  MIT License
//

import SwiftUI

/// A SwiftUI view that displays an object as a card, using its intrinsic color for styling.
///
/// `ColorableCardView` wraps `DescribableCardView` and automatically provides the object's
/// color (from its `Colorable` conformance) as the styling color. This creates a consistent,
/// color-themed card representation for objects that have name, icon, description, and color properties.
///
/// The generic `Object` type must conform to:
/// - ``Nameable``: Provides a human‑readable name
/// - ``Iconable``: Provides an SF Symbol icon name
/// - ``Describable``: Provides descriptive details
/// - ``Colorable``: Provides a SwiftUI `Color` for styling
///
/// ## Example
/// ```swift
/// struct Priority: Nameable, Iconable, Describable, Colorable {
///     let name: String
///     let icon: String
///     let details: String
///     let color: Color
/// }
///
/// let highPriority = Priority(
///     name: "High",
///     icon: "exclamationmark.triangle.fill",
///     details: "Requires immediate attention",
///     color: .red
/// )
///
/// ColorableCardView(highPriority)
///     .symbolVariant(.fill)
/// ```
///
/// - Note: The view inherits the card layout from `DescribableCardView`, which uses
/// `ContentUnavailableView` as its underlying implementation.
public struct ColorableCardView<Object: Nameable & Iconable & Describable & Colorable>: View {
    
    /// The object to display in the card view.
    private let object: Object
    
    public var body: some View {
        
        DescribableCardView(object, color: object.color)
    }
    
    /// Creates a colorable card view that displays the given object.
    ///
    /// The card automatically uses the object's `color` property for styling its icon,
    /// making it visually distinct and associated with the object's semantic meaning.
    ///
    /// - Parameter object: An object conforming to `Nameable`, `Iconable`, `Describable`,
    ///   and `Colorable` to be displayed in the card.
    public init(_ object: Object) {
        self.object = object
    }
}

#if DEBUG
#Preview {
    NavigationStack {
        ScrollView {
            LazyVStack {
                ForEach(PressureLevel.allCases.sorted()) {
                    ColorableCardView($0)
                        .symbolVariant(.fill)
                        .symbolColorRenderingMode(.gradient)
                        .background($0.color.gradient.opacity(0.2))
                        .clipShape(.rect(cornerRadius: 16))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .strokeBorder($0.color)
                        )
                }
            }
            .padding()
        }
        .navigationTitle("ColorableCardView")
    }
}
#endif

//
//  ColorableLabelView.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 7/16/26.
//  Apache License 2.0
//

public import SwiftUI

/// Displays a label composed of a name and a color-tinted system icon.
///
/// The label renders the `name` from a `Nameable` model as the title and the `icon` from an `Iconable`
/// model as a SF Symbol, tinted using the provided `Color`.
///
/// Use this view to present domain types that expose a human-readable name and an SF Symbol in a
/// consistent, compact form.
///
/// ## Example
///
/// ```swift
/// List(AlertSeverity.allCases.sorted()) { severity in
///     ColorableLabelView(severity, color: severity.color)
/// }
/// ```
public struct ColorableLabelView<T: Nameable & Iconable>: View {
    
    private let object: T
    private let color: Color
    
    public var body: some View {
        
        Label {
            
            Text(object.name)
            
        } icon: {
            
            Image(systemName: object.icon)
                .foregroundStyle(color)
        }
    }
    
    /// Creates a colorable label view for the given model.
    ///
    /// - Parameters:
    ///   - object: The model whose `name` and `icon` are displayed.
    ///   - color: The color used to tint the SF Symbol icon.
    public init(_ object: T, color: Color) {
        self.object = object
        self.color = color
    }
}

#if DEBUG
#Preview {
    NavigationStack {
        List(AlertSeverity.allCases.sorted()) {
            ColorableLabelView($0, color: $0.color)
        }
        .navigationTitle(AlertSeverity.navigationTitle)
    }
}
#endif

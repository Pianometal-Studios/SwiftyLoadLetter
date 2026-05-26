//
//  DescribableCardView.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/6/26.
//  MIT License
//

import SwiftUI

/// Displays an object's information in a card format using `ContentUnavailableView`.
///
/// `DescribableCardView` presents an object that conforms to `Nameable`, `Iconable`, and `Describable`
/// protocols in a structured card layout. The view includes a labeled header with an icon and name,
/// along with a description section displaying detailed information.
///
/// - Note: This view uses `ContentUnavailableView` as its container, which provides a consistent
///   system-styled presentation suitable for displaying informational content.
///
/// ## Usage
///
/// ```swift
/// struct Priority: Nameable, Iconable, Describable {
///     let name: String
///     let icon: String
///     let details: String
/// }
///
/// let highPriority = Priority(
///     name: "High Priority",
///     icon: "exclamationmark.triangle.fill",
///     details: "Items requiring immediate attention"
/// )
///
/// DescribableCardView(highPriority, color: .red)
/// ```
///
/// - Generic Parameter Object: A type that conforms to `Nameable`, `Iconable`, and `Describable` protocols.
public struct DescribableCardView<Object: Nameable & Iconable & Describable>: View {
    
    /// The object containing the name, icon, and details to display.
    private let object: Object
    
    /// The color applied to the icon in the card's header.
    private var color: Color
    
    public var body: some View {
        
        ContentUnavailableView {
            
            Label {
                
                Text(object.name)
                
            } icon: {
                
                Image(systemName: object.icon)
                    .foregroundStyle(color)
            }
            
        } description: {
            
            Text(object.details)
        }
    }
    
    /// Creates a new describable card view.
    ///
    /// - Parameters:
    ///   - object: The object to display, which must conform to `Nameable`, `Iconable`, and `Describable`.
    ///   - color: The color for the icon. Defaults to `.secondary`.
    public init(_ object: Object, color: Color = .secondary) {
        self.object = object
        self.color = color
    }
}

#if DEBUG
#Preview {
    NavigationStack {
        ScrollView {
            LazyVStack {
                ForEach(PressureLevel.allCases.sorted()) {
                    DescribableCardView($0)
                }
            }
        }
        .navigationTitle("DescribableCardView")
    }
}
#endif

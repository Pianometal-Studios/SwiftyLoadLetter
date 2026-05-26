//
//  Iconable.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  Apache License 2.0
//

import Foundation

/// A protocol for types that have an associated SF Symbol icon.
///
/// ## Example
/// ```swift
/// private struct MyLabel: Nameable, Iconable {
///     let name = "Shield"
///     let icon = "shield.fill"
/// }
/// ```
///
/// - PreCondition: The SF Symbol name provided by the `icon` property must be
/// valid and available for the specified target.
public protocol Iconable {
    
    /// - Returns: SF Symbol name suitable for use with `Image(systemName:)`.
    var icon: String { get }
}

// MARK: - Preview

#if DEBUG
import SwiftUI
private let label = IconableObject("Defense", icon: "shield.fill")
#Preview {
    Label(label.name, systemImage: label.icon)
}
#endif

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

public extension Iconable where Self: Nameable {
    
    /// The value's name and icon as an ``IconableObject``.
    ///
    /// - Note: This isn't a protocol requirement, so generic code uses this default even when
    ///   the conforming type declares its own `iconableObject`.
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
}

public extension Iconable where Self: Describable & Nameable {
    
    /// The value's name, icon, and details as a ``DescribableObject``.
    ///
    /// - Note: This isn't a protocol requirement, so generic code uses this default even when
    ///   the conforming type declares its own `describableObject`.
    var describableObject: DescribableObject {
        .init(name, icon: icon, details: details)
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI
private let label = IconableObject("Defense", icon: "shield.fill")
#Preview {
    Label(label.name, systemImage: label.icon)
}
#endif

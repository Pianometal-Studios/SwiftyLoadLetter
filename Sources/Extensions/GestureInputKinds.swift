//
//  GestureInputKinds.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 9/19/26.
//  Apache License 2.0
//

import Foundation
public import SwiftUI

public extension GestureInputKinds {
    
    var color: Color {
        switch self {
        case .all:           .purple
        case .directTouch:   .blue
        case .indirectTouch: .teal
        case .pencil:        .orange
        case .pointer:       .green
        default:             .gray
        }
    }
    
    var describableObject: DescribableObject {
        .init(name, icon: icon, details: details)
    }
    
    var details: String {
        switch self {
        case .all:
            "Every input kind the platform can deliver."
        case .directTouch:
            "A finger on the display itself."
        case .indirectTouch:
            "A trackpad or remote, where the touch surface is not the display it drives."
        case .pencil:
            "Apple Pencil."
        case .pointer:
            "A mouse, trackpad pointer, or other pointing device."
        default:
            kinds.isEmpty
            ? "No gesture input kinds."
            : kinds.map(\.details).joined(separator: " ")
        }
    }
    
    var icon: String {
        switch self {
        case .all:           "hand.raised.fingers.spread"
        case .directTouch:   "hand.tap"
        case .indirectTouch: "rectangle.and.hand.point.up.left"
        case .pencil:        "applepencil"
        case .pointer:       "pointer.arrow"
        default:             kinds.isEmpty ? "nosign" : "square.grid.2x2"
        }
    }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    /// The individual input kinds this value contains.
    ///
    /// `GestureInputKinds` is an `OptionSet`, so one value can carry several kinds at once. Use
    /// this to decompose a combined value into the pieces that make it up — one row, label or
    /// icon per kind — rather than rendering the combination as a single opaque item.
    ///
    /// ## Example
    /// ```swift
    /// let kinds: GestureInputKinds = [.pencil, .pointer]
    /// ForEach(kinds.kinds, id: \.rawValue) { kind in
    ///     Label(kind.name, systemImage: kind.icon)
    /// }
    /// ```
    ///
    /// - Returns: The members of ``allCases`` this value contains, in `allCases` order, or an
    ///   empty array when the value is empty.
    var kinds: [Self] {
        Self.allCases.filter { contains($0) }
    }
    
    var name: String {
        switch self {
        case .all:           "All"
        case .directTouch:   "Direct Touch"
        case .indirectTouch: "Indirect Touch"
        case .pencil:        "Pencil"
        case .pointer:       "Pointer"
        default:
            kinds.isEmpty
            ? "None"
            : kinds.map(\.name).formatted(.list(type: .and))
        }
    }
    
    /// An array of the individual `GestureInputKinds` members, ordered from the most direct
    /// input to the most indirect.
    ///
    /// `.all` is deliberately excluded: it is the union of these four, not a fifth kind.
    ///
    /// - Returns: [.directTouch, .pencil, .indirectTouch, .pointer]
    static let allCases: [Self] = [
        .directTouch,
        .pencil,
        .indirectTouch,
        .pointer
    ]
}

// MARK: - Preview

#if DEBUG
#Preview {
    let combined: [GestureInputKinds] = [.all, [.pencil, .pointer], GestureInputKinds()]
    NavigationStack {
        List {
            Section("Individual") {
                ForEach(GestureInputKinds.allCases, id: \.rawValue) { kind in
                    Label {
                        Text(kind.name)
                        Text(kind.details)
                    } icon: {
                        Image(systemName: kind.icon)
                            .foregroundStyle(kind.color)
                    }
                }
            }
            Section("Combined") {
                ForEach(combined, id: \.rawValue) { kinds in
                    Label(kinds.name, systemImage: kinds.icon)
                        .foregroundStyle(kinds.color)
                }
            }
        }
        .navigationTitle("Gesture Input Kinds")
    }
}
#endif

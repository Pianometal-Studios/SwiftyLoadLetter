//
//  ObservationTrackingEventKind.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 9/19/26.
//  Apache License 2.0
//

public import Observation
public import SwiftUI

public extension ObservationTracking.Event.Kind {
    
    var color: Color {
        switch self {
        case .initial:  .blue
        case .willSet:  .orange
        case .didSet:   .green
        case .`deinit`: .red
        default:        .gray
        }
    }
    
    var describableObject: DescribableObject {
        .init(name, icon: icon, details: details)
    }
    
    var details: String {
        switch self {
        case .initial:
            "The first event, delivered when continuous observation begins."
        case .willSet:
            "Delivered immediately before an observed property changes."
        case .didSet:
            "Delivered immediately after an observed property changes."
        case .`deinit`:
            "Delivered when the observed object is deinitialized."
        default:
            "Unknown observation event."
        }
    }
    
    var icon: String {
        switch self {
        case .initial:  "flag"
        case .willSet:  "pencil.line"
        case .didSet:   "checkmark.circle"
        case .`deinit`: "trash"
        default:        "exclamationmark.triangle"
        }
    }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    var name: String {
        switch self {
        case .initial:  "Initial"
        case .willSet:  "Will Set"
        case .didSet:   "Did Set"
        case .`deinit`: "Deinit"
        default:        "Undefined"
        }
    }
    
    /// An array of the `ObservationTracking.Event.Kind` values the SDK vends, in the order a
    /// continuous observation delivers them over an object's lifetime.
    ///
    /// The type is a struct of static properties rather than an enum, so it has no synthesized
    /// `CaseIterable` conformance to draw on.
    ///
    /// - Returns: [.initial, .willSet, .didSet, .deinit]
    static let allCases: [Self] = [
        .initial,
        .willSet,
        .didSet,
        .`deinit`
    ]
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(ObservationTracking.Event.Kind.allCases, id: \.name) { kind in
            Label {
                Text(kind.name)
                Text(kind.details)
            } icon: {
                Image(systemName: kind.icon)
                    .foregroundStyle(kind.color)
            }
        }
        .navigationTitle("Observation Events")
    }
}
#endif

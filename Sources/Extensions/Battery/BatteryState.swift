//
//  BatteryState.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/11/26.
//  MIT License
//

#if os(iOS) || os(visionOS)

import SwiftUI

public extension UIDevice.BatteryState {
    
    /// - Returns: A detailed description of the battery state.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var details: String {
        switch self {
        case .full:       "The battery is fully charged."
        case .charging:   "The battery is currently being charged."
        case .unplugged:  "The device is running on battery power."
        case .unknown:    "The battery state is unknown."
        @unknown default: "The battery state cannot be determined."
        }
    }
    
    /// - Returns: An SF Symbol name suitable for use with `Image(systemName:)`.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var icon: String {
        switch self {
        case .unknown:    "questionmark"
        case .unplugged:  "powerplug.fill"
        case .charging:   "battery.100percent.bolt"
        case .full:       "battery.100percent"
        @unknown default: "exclamationmark.triangle"
        }
    }
    
    /// - Returns: The name of the battery state.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var name: String {
        switch self {
        case .full:       "Full"
        case .charging:   "Charging"
        case .unplugged:  "Unplugged"
        case .unknown:    "Unknown"
        @unknown default: "Undefined"
        }
    }
    
    /// - Returns: An array of all standard `UIDevice.BatteryState` cases.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    static let allCases: [UIDevice.BatteryState] = [
        .full,
        .charging,
        .unplugged,
        .unknown
    ]
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(UIDevice.BatteryState.allCases, id: \.rawValue) { state in
            LabeledContent {
                EmptyView()
            } label: {
                Label {
                    Text(state.name)
                    Text(state.details)
                    
                } icon: {
                    Image(systemName: state.icon)
                }
            }
        }
        .navigationTitle("Battery States")
    }
}
#endif
#endif

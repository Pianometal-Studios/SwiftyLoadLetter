//
//  BatteryState.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/11/26.
//  Apache License 2.0
//

#if os(iOS) || os(visionOS)

import SwiftUI

public extension UIDevice.BatteryState {
    
    var color: Color {
        switch self {
        case .unplugged:   .orange
        case .charging:    .blue
        case .full:        .green
        case .unknown:     .gray
        @unknown default:  .red
        }
    }
    
    var describableObject: DescribableObject {
        .init(name, icon: icon, details: details)
    }
    
    var details: String {
        switch self {
        case .full:       "The battery is fully charged."
        case .charging:   "The battery is currently being charged."
        case .unplugged:  "The device is running on battery power."
        case .unknown:    "The battery state is unknown."
        @unknown default: "The battery state cannot be determined."
        }
    }
    
    var icon: String {
        switch self {
        case .unknown:    "questionmark"
        case .unplugged:  "powerplug.fill"
        case .charging:   "battery.100percent.bolt"
        case .full:       "battery.100percent"
        @unknown default: "exclamationmark.triangle"
        }
    }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    var name: String {
        switch self {
        case .full:       "Full"
        case .charging:   "Charging"
        case .unplugged:  "Unplugged"
        case .unknown:    "Unknown"
        @unknown default: "Undefined"
        }
    }
    
    /// An array of all standard `UIDevice.BatteryState` cases, sorted by typical user relevance.
    ///
    /// - Returns: [`.full`, `.charging`, `.unplugged`, `.unknown`]
    ///
    /// - Note: This array is provided for convenience and does not include any potential future
    /// cases that may be added to `UIDevice.BatteryState`.
    static let allCases: [Self] = [
        .full,
        .charging,
        .unplugged,
        .unknown
    ]
    
    static let navigationTitle = "Battery States"
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(UIDevice.BatteryState.allCases, id: \.rawValue) { state in
            Label {
                Text(state.name)
                Text(state.details)
                
            } icon: {
                Image(systemName: state.icon)
            }
        }
        .navigationTitle("Battery States")
    }
}
#endif
#endif

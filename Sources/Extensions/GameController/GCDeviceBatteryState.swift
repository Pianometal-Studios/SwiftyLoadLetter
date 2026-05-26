//
//  GCDeviceBatteryState.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/26/26.
//  MIT License
//

#if !os(watchOS)

import SwiftUI
import GameController

public extension GCDeviceBattery.State {
    
    var color: Color {
        switch self {
        case .discharging: .orange
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
        case .discharging: "The device is currently discharging."
        case .charging:    "The device is currently charging."
        case .full:        "The device is fully charged."
        case .unknown:     "The battery state is unknown."
        @unknown default:  "The battery state cannot be determined."
        }
    }
    
    var icon: String {
        switch self {
        case .discharging: "powerplug.fill"
        case .charging:    "battery.100percent.bolt"
        case .full:        "battery.100percent"
        case .unknown:     "questionmark"
        @unknown default:  "exclamationmark.triangle"
        }
    }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    var name: String {
        switch self {
        case .discharging: "Discharging"
        case .charging:    "Charging"
        case .full:        "Full"
        case .unknown:     "Unknown"
        @unknown default:  "Undefined"
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
        .discharging,
        .unknown
    ]
    
    static let navigationTitle = "Controller Battery States"
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(GCDeviceBattery.State.allCases, id: \.rawValue) { state in
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

//
//  WKInterfaceDeviceBatteryState.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/16/26.
//  MIT License
//

#if os(watchOS)

import WatchKit
import SwiftUI

public extension WKInterfaceDeviceBatteryState {
    
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
    
    var name: String {
        switch self {
        case .full:       "Full"
        case .charging:   "Charging"
        case .unplugged:  "Unplugged"
        case .unknown:    "Unknown"
        @unknown default: "Undefined"
        }
    }
    
    /// An array of all valid `WKInterfaceDeviceBatteryState` cases, arranged in a logical
    /// order for display purposes.
    ///
    /// - Returns: [`.full`, `.charging`, `.unplugged`, `.unknown`]
    static let allCases: [Self] = [
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
        List(WKInterfaceDeviceBatteryState.allCases, id: \.rawValue) { state in
            HStack {
                Image(systemName: state.icon)
                    .symbolRenderingMode(.multicolor)
                VStack(alignment: .leading) {
                    Text(state.name)
                        .bold()
                    Text(state.details)
                        .font(.caption2)
                        .foregroundStyle(.gray)
                }
            }
        }
        .navigationTitle("Battery States")
    }
}
#endif
#endif

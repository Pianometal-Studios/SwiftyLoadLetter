//
//  UnsatisfiedReason.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/11/26.
//  Apache License 2.0
//

import Network
import SwiftUI

public extension NWPath.UnsatisfiedReason {
    
    var describableObject: DescribableObject {
        .init(name, icon: icon, details: details)
    }
    
    var details: String {
        switch self {
        case .notAvailable:
            "Reason not available."
        case .cellularDenied:
            "Cellular access has been denied by the user."
        case .wifiDenied:
            "Wi-Fi access has been denied by the user."
        case .localNetworkDenied:
            "Local network access has been denied by the user."
        case .vpnInactive:
            "A required VPN connection is not active."
        @unknown default:
            "Unknown network reason."
        }
    }
    
    /// Indicates whether the current unsatisfied reason represents a concrete, user-actionable cause.
    ///
    /// This property returns true when:
    /// - The reason is not `.notAvailable` (which signifies that no specific reason is provided), and
    /// - The reason is included in the curated `allCases` list of recognized reasons.
    ///
    /// Use this to distinguish between meaningful denial/inactive states (e.g., cellular denied, Wi‑Fi denied)
    /// and the absence of a specific reason.
    ///
    /// - Note: `.notAvailable` is explicitly treated as "no reason" and will return `false`.
    ///
    /// - Returns: `true` if the reason is a recognized, actionable unsatisfied reason; otherwise `false`.
    var hasReason: Bool {
        self != .notAvailable &&
        Self.allCases.contains(self)
    }
    
    var icon: String {
        switch self {
        case .notAvailable:       "questionmark.bubble"
        case .cellularDenied:     "antenna.radiowaves.left.and.right.slash"
        case .wifiDenied:         "wifi.slash"
        case .localNetworkDenied: "house.slash"
        case .vpnInactive:        "shield.slash"
        @unknown default:         "exclamationmark.triangle"
        }
    }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    var name: String {
        switch self {
        case .notAvailable:       "Not Available"
        case .cellularDenied:     "Cellular Denied"
        case .wifiDenied:         "Wi-Fi Denied"
        case .localNetworkDenied: "Local Network Denied"
        case .vpnInactive:        "VPN Inactive"
        @unknown default:         "Undefined"
        }
    }
    
    ///An array of all recognized `NWPath.UnsatisfiedReason` cases that represent
    ///actionable causes for an unsatisfied network path.
    ///
    ///- Returns: [.cellularDenied, .localNetworkDenied, .vpnInactive, .wifiDenied,
    ///.notAvailable]
    static let allCases: [Self] = [
        .cellularDenied,
        .localNetworkDenied,
        .vpnInactive,
        .wifiDenied,
        .notAvailable
    ]
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(NWPath.UnsatisfiedReason.allCases, id: \.hashValue) { reason in
            LabeledContent { EmptyView() } label: {
                Label {
                    Text(reason.name)
                    Text(reason.details)
                } icon: {
                    Image(systemName: reason.icon)
                        .symbolVariant(.fill)
                        .foregroundStyle(reason.hasReason ? .red : .gray)
                }
            }
        }
        .navigationTitle("Unsatisfied Reasons")
    }
}
#endif

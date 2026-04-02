//
//  UnsatisfiedReason.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/11/26.
//  MIT License
//

import Network
import SwiftUI

public extension NWPath.UnsatisfiedReason {
    
    /// - Returns: A detailed description of the unsatisfied reason.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
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
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var hasReason: Bool {
        self != .notAvailable &&
        Self.allCases.contains(self)
    }
    
    /// - Returns: An SF Symbol name representing the unsatisfied reason.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var icon: String {
        switch self {
        case .notAvailable:       "questionmark.bubble"
        case .cellularDenied:     "antenna.radiowaves.left.and.right.slash"
        case .wifiDenied:         "wifi.slash"
        case .localNetworkDenied: "house.slash"
        case .vpnInactive:        "shield.slash"
        @unknown default:         "questionmark"
        }
    }
    
    /// - Returns: A localized-ready name representing the unsatisfied reason.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
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
    
    
    /// - Returns: An array of all recognized unsatisfied reasons, excluding `.notAvailable`.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    static let allCases: [Self] = [
        .cellularDenied,
        .localNetworkDenied,
        .vpnInactive,
        .wifiDenied,
        .notAvailable
    ]
}

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

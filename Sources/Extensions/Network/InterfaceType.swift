//
//  InterfaceType.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/11/26.
//  Apache License 2.0
//

import Network
import SwiftUI

public extension NWInterface.InterfaceType {
    
    var color: Color {
        switch self {
        case .other:         .brown
        case .wifi:          .teal
        case .cellular:      .mint
        case .wiredEthernet: .orange
        case .loopback:      .purple
        @unknown default:    .gray
        }
    }
    
    var icon: String {
        switch self {
        case .other:         "questionmark"
        case .wifi:          "wifi"
        case .cellular:      "antenna.radiowaves.left.and.right"
        case .wiredEthernet: "cable.connector"
        case .loopback:      "arrow.uturn.backward"
        @unknown default:    "exclamationmark.triangle"
        }
    }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    var name: String {
        switch self {
        case .other:         "Other"
        case .wifi:          "WiFi"
        case .cellular:      "Cellular"
        case .wiredEthernet: "Ethernet"
        case .loopback:      "Loopback"
        @unknown default:    "Undefined"
        }
    }
    
    /// An array of all valid `NWInterface.InterfaceType` cases, sorted by typical usage frequency.
    ///
    /// - Returns: [.cellular, .loopback, .wifi, .wiredEthernet, .other]
    static let allCases: [Self] = [
        .cellular,
        .loopback,
        .wifi,
        .wiredEthernet,
        .other
    ]
}

#if DEBUG
#Preview {
    NavigationStack {
        List(NWInterface.InterfaceType.allCases, id: \.hashValue) { type in
            Label {
                Text(type.name)
            } icon: {
                Image(systemName: type.icon)
                    .foregroundStyle(type.color)
            }
        }
        .navigationTitle("Interface Types")
    }
}
#endif

//
//  InterfaceType.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/11/26.
//  MIT License
//

import Network
import SwiftUI

public extension NWInterface.InterfaceType {
    
    /// - Returns: A `Color` associated with the interface type.
    ///
    
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
    
    /// - Returns: An SF Symbol name suitable for use with `Image(systemName:)`.
    ///
    
    var icon: String {
        switch self {
        case .other:         "questionmark"
        case .wifi:          "wifi"
        case .cellular:      "antenna.radiowaves.left.and.right"
        case .wiredEthernet: "cable.connector"
        case .loopback:      "arrow.uturn.backward"
        @unknown default:    "questionmark"
        }
    }
    
    /// - Returns: A user-friendly name for the interface type.
    ///
    
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
    
    /// - Returns: All network connection interface types.
    ///
    
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

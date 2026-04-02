//
//  NWPathStatus.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/11/26.
//  MIT License
//

import Network
import SwiftUI

public extension NWPath.Status {
    
    var color: Color {
        switch self {
        case .satisfied:          .green
        case .unsatisfied:        .red
        case .requiresConnection: .orange
        @unknown default:         .gray
        }
    }
    
    var details: String {
        switch self {
        case .satisfied:          "You are connected to the internet."
        case .unsatisfied:        "You are not connected to the internet."
        case .requiresConnection: "A connection is required to access the internet."
        @unknown default:         "Cannot determine network status."
        }
    }
    
    var icon: String {
        switch self {
        case .satisfied:          "wifi"
        case .unsatisfied:        "wifi.slash"
        case .requiresConnection: "wifi.exclamationmark"
        @unknown default:         "questionmark"
        }
    }
    
    /// Indicates whether the device is connected to a network
    ///
    /// - Returns: `true` if the status is `.satisfied`, otherwise `false`.
    var isConnected: Bool {
        self == .satisfied
    }
    
    var name: String {
        switch self {
        case .satisfied:          "Connected"
        case .unsatisfied:        "Not Connected"
        case .requiresConnection: "Requires Connection"
        @unknown default:         "Undefined"
        }
    }
    
    /// An array of all valid `NWPath.Status` cases, sorted by connectivity level.
    ///
    /// - Returns: [.satisfied, .unsatisfied, .requiresConnection]
    static let allCases: [NWPath.Status] = [
        .satisfied,
        .unsatisfied,
        .requiresConnection
    ]
}

#if DEBUG
#Preview {
    NavigationStack {
        List(NWPath.Status.allCases, id: \.hashValue) { status in
            Label {
                Text(status.name)
            } icon: {
                Image(systemName: status.icon)
                    .foregroundStyle(status.color)
            }
        }
        .navigationTitle("Network Statuses")
    }
}
#endif

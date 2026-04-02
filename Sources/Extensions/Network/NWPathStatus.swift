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
    
    /// - Returns: A color representing the network status.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var color: Color {
        switch self {
        case .satisfied:          .green
        case .unsatisfied:        .red
        case .requiresConnection: .orange
        @unknown default:         .gray
        }
    }
    
    /// - Returns: A detailed description of the network status.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var details: String {
        switch self {
        case .satisfied:          "You are connected to the internet."
        case .unsatisfied:        "You are not connected to the internet."
        case .requiresConnection: "A connection is required to access the internet."
        @unknown default:         "Cannot determine network status."
        }
    }
    
    /// - Returns: An SF Symbol name suitable for use with `Image(systemName:)`.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
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
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var isConnected: Bool {
        self == .satisfied
    }
    
    /// - Returns: A user-friendly name for the network status.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var name: String {
        switch self {
        case .satisfied:          "Connected"
        case .unsatisfied:        "Not Connected"
        case .requiresConnection: "Requires Connection"
        @unknown default:         "Undefined"
        }
    }
    
    /// - Returns: An array of all standard `NWPath.Status` cases.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
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

//
//  ConnectionState.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 4/11/26.
//  MIT License
//

import SwiftUI

/// An enum representing general connection states, such as those used in device or network connections.
///
/// Each case has an associated color and name for easy UI representation.
@frozen public enum ConnectionState:
    String,
    Staticable,
    Colorable,
    Searchable,
    Iconable,
    Listable {
    
    /// Represents a state where a connection is active and stable.
    case connected
    
    /// Represents a state where a connection is in the process of being established.
    case connecting
    
    /// Represents a state where an active connection is in the process of being terminated.
    case disconnecting
    
    /// Represents a state where there is no active connection.
    case disconnected
    
    public var color: Color {
        switch self {
        case .connected:     true.color
        case .connecting:    .blue
        case .disconnecting: .orange
        case .disconnected:  false.color
        }
    }
    
    public var icon: String {
        switch self {
        case .connected:     true.icon
        case .disconnected:  false.icon
        case .connecting:    "arrow.trianglehead.2.clockwise"
        case .disconnecting: "arrow.trianglehead.2.counterclockwise"
        }
    }
    
    public var name: String {
        switch self {
        case .connected:     "Connected"
        case .connecting:    "Connecting"
        case .disconnecting: "Disconnecting"
        case .disconnected:  "Disconnected"
        }
    }
    
    public static let navigationTitle = "Connection States"
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(ConnectionState.allCases) { state in
            Label {
                Text(state.name)
            } icon: {
                Image(systemName: state.icon)
                    .foregroundStyle(state.color)
            }
        }
        .navigationTitle(ConnectionState.navigationTitle)
    }
}
#endif

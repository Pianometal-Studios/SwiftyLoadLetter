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
@frozen public enum ConnectionState: String, Staticable, Colorable, Searchable, Iconable {
    
    /// Represents a state where there is no active connection.
    case disconnected
    
    /// Represents a state where a connection is in the process of being established.
    case connecting
    
    /// Represents a state where a connection is active and stable.
    case connected
    
    /// Represents a state where an active connection is in the process of being terminated.
    case disconnecting
    
    public var color: Color {
        switch self {
        case .connected:     .green
        case .connecting:    .blue
        case .disconnecting: .orange
        case .disconnected:  .red
        }
    }
    
    public var icon: String {
        switch self {
        case .connected:    true.icon
        case .disconnected: false.icon
        default:            "arrow.trianglehead.2.clockwise.rotate.90"
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
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(ConnectionState.allCases.sorted()) { state in
            Label {
                Text(state.name)
            } icon: {
                Image(systemName: state.icon)
                    .symbolVariant(.fill)
                    .symbolColorRenderingMode(.gradient)
                    .foregroundStyle(state.color)
            }
        }
        .navigationTitle("Connection States")
    }
}
#endif

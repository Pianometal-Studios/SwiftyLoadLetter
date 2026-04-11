//
//  ConnectionState.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 4/11/26.
//  MIT License
//

import SwiftUI

/// An enum representing general connection states, such as those used in Bluetooth or network connections.
/// Each case has an associated color and name for easy UI representation.
public enum ConnectionState: String, Staticable, Colorable, Searchable {
    
    case disconnected
    case connecting
    case connected
    case disconnecting
    
    public var color: Color {
        switch self {
        case .connected:     .green
        case .connecting:    .blue
        case .disconnecting: .orange
        case .disconnected:  .red
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
                Image(systemName: "circle")
                    .symbolVariant(.fill)
                    .symbolColorRenderingMode(.gradient)
                    .foregroundStyle(state.color)
            }
        }
        .navigationTitle("Connection States")
    }
}
#endif

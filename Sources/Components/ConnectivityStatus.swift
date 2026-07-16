//
//  ConnectivityStatus.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 6/30/26.
//  Apache License 2.0
//

import SwiftUI

/// Represents a current network connectivity state.
public enum ConnectivityStatus:
    String,
    Staticable,
    Searchable,
    Colorable,
    Iconable,
    Listable {
    
    case loading
    case connected
    case offline
    
    public var color: Color {
        switch self {
        case .loading:   .gray
        case .connected: true.color
        case .offline:   false.color
        }
    }
    
    public var icon: String {
        switch self {
        case .loading:   "circle.dashed"
        case .connected: true.icon
        case .offline:   false.icon
        }
    }
    
    public var name: String {
        switch self {
        case .loading:   "Loading"
        case .connected: "Connected"
        case .offline:   "Offline"
        }
    }
    
    public static let navigationTitle = "Connectivity Status"
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(ConnectivityStatus.allCases.sorted()) { status in
            Label {
                Text(status.name)
            } icon: {
                Image(systemName: status.icon)
                    .foregroundStyle(status.color)
            }
        }
        .navigationTitle(ConnectivityStatus.navigationTitle)
    }
}
#endif


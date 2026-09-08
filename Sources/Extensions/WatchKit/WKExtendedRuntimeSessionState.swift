//
//  WKExtendedRuntimeSessionState.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 9/7/26.
//  Apache License 2.0
//

#if os(watchOS)

import WatchKit
import SwiftUI

public extension WKExtendedRuntimeSessionState {
    
    var color: Color {
        switch self {
        case .notStarted: .gray
        case .scheduled:  .blue
        case .running:    .green
        case .invalid:    .red
        @unknown default: .red
        }
    }
    
    var describableObject: DescribableObject {
        .init(name, icon: icon, details: details)
    }
    
    var details: String {
        switch self {
        case .notStarted:
            "The session has never been started."
        case .scheduled:
            "The session is scheduled to start at a future date."
        case .running:
            "The session is actively running."
        case .invalid:
            "The session is not running. It either ended or encountered an error."
        @unknown default:
            "The session state cannot be determined."
        }
    }
    
    var icon: String {
        switch self {
        case .notStarted: "pause.circle"
        case .scheduled:  "calendar.badge.clock"
        case .running:    "play.circle"
        case .invalid:    "xmark.circle"
        @unknown default: "exclamationmark.triangle"
        }
    }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    var name: String {
        switch self {
        case .notStarted: "Not Started"
        case .scheduled:  "Scheduled"
        case .running:    "Running"
        case .invalid:    "Invalid"
        @unknown default: "Undefined"
        }
    }
    
    /// An array of all valid `WKExtendedRuntimeSessionState` cases, ordered by
    /// the lifecycle a session moves through.
    ///
    /// - Returns: [`.notStarted`, `.scheduled`, `.running`, `.invalid`]
    static let allCases: [Self] = [
        .notStarted,
        .scheduled,
        .running,
        .invalid
    ]
    
    static let navigationTitle = "Extended Runtime Sessions"
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(WKExtendedRuntimeSessionState.allCases, id: \.rawValue) { state in
            Label {
                Text(state.name)
                Text(state.details)
            } icon: {
                Image(systemName: state.icon)
                    .foregroundStyle(state.color)
            }
        }
        .navigationTitle(WKExtendedRuntimeSessionState.navigationTitle)
    }
}
#endif
#endif

//
//  PressureLevel.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 4/6/26.
//  MIT License
//

import SwiftUI

/// Represents the current pressure level of a hardware component, such as memory or CPU.
///
/// Each level provides associated properties for color, emoji, icon, name, and details to
/// facilitate consistent UI representation across the app. The `unknown` case handles any
/// unexpected or unrecognized pressure levels gracefully.
@frozen public enum PressureLevel:
    String,
    Staticable,
    Searchable,
    Iconable,
    Colorable,
    Describable {
    
    /// The pressure level is within normal operating parameters.
    case normal
    
    /// The pressure level is elevated and may require attention.
    case warning
    
    /// The pressure level is critical and requires immediate action to prevent system instability.
    case critical
    
    /// The pressure level is unknown, which may indicate an error in retrieving the information
    /// or an unrecognized state.
    case unknown
    
    public var color: Color {
        switch self {
        case .normal:   .green
        case .warning:  .orange
        case .critical: .red
        case .unknown:  .gray
        }
    }
    
    public var details: String {
        switch self {
        case .normal:
            "Pressure is within normal operating parameters."
        case .warning:
            "Pressure is elevated and may require attention."
        case .critical:
            "Pressure is critical. Immediate action required to prevent instability."
        case .unknown:
            "Pressure level is unknown. This may indicate an error retrieving the information."
        }
    }
    
    /// - Returns: An emoji representing the pressure level.
    public var emoji: String {
        switch self {
        case .normal:   "✅"
        case .warning:  "⚠️"
        case .critical: "🚨"
        case .unknown:  "❓"
        }
    }
    
    public var icon: String {
        switch self {
        case .normal:   "checkmark.seal"
        case .warning:  "exclamationmark.triangle"
        case .critical: "xmark.octagon"
        case .unknown:  "questionmark.circle"
        }
    }
    
    public var name: String {
        switch self {
        case .normal:   "Normal"
        case .warning:  "Warning"
        case .critical: "Critical"
        case .unknown:  "Unknown"
        }
    }
    
    public static let navigationTitle = "Pressure Levels"
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(PressureLevel.allCases) { level in
            LabeledContent {
                Text(level.emoji)
            } label: {
                Label {
                    Text(level.name)
                    Text(level.details)
                } icon: {
                    Image(systemName: level.icon)
                        .foregroundStyle(level.color)
                        .symbolVariant(.fill)
                        .symbolColorRenderingMode(.gradient)
                }
            }
        }
        .navigationTitle(PressureLevel.navigationTitle)
        .navigationSubtitle(subtitle: "All system component pressure levels.")
    }
}
#endif

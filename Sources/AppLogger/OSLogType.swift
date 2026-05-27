//
//  OSLogType.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 3/23/26.
//  Apache License 2.0
//
// -----------------------------------------------------------------------------
//  ██████╗ ███████╗██╗      ██████╗  ██████╗ ████████╗██╗   ██╗██████╗ ███████╗
// ██╔═══██╗██╔════╝██║     ██╔═══██╗██╔════╝ ╚══██╔══╝╚██╗ ██╔╝██╔══██╗██╔════╝
// ██║   ██║███████╗██║     ██║   ██║██║  ███╗   ██║    ╚████╔╝ ██████╔╝█████╗
// ██║   ██║╚════██║██║     ██║   ██║██║   ██║   ██║     ╚██╔╝  ██╔═══╝ ██╔══╝
// ╚██████╔╝███████║███████╗╚██████╔╝╚██████╔╝   ██║      ██║   ██║     ███████╗
//  ╚═════╝ ╚══════╝╚══════╝ ╚═════╝  ╚═════╝    ╚═╝      ╚═╝   ╚═╝     ╚══════╝
//
//                    Making .fault feel personal since 2026
// -----------------------------------------------------------------------------
//                        🪵 OSLogType + Extensions 🔗
// -----------------------------------------------------------------------------

import SwiftUI
import os

public extension OSLogType {
    
    var color: Color {
        switch self {
        case .debug:   .green
        case .info:    .blue
        case .default: .orange
        case .error:   .red
        case .fault:   .indigo
        default:       .gray
        }
    }
    
    var details: String {
        switch self {
        case .debug:
            "Used for detailed debugging information, typically only relevant during development and not persisted in production."
        case .info:
            "Used for informational messages that highlight the progress of the application, but are not persisted in production."
        case .default:
            "Used for general informational messages that are persisted to disk and visible in production, often for important events or milestones."
        case .error:
            "Used for error conditions that indicate a failure in the current operation, but the app can continue running. These are persisted to disk and visible in production."
        case .fault:
            "Used for critical conditions that indicate a severe failure, such as a crash or unrecoverable error. These are persisted to disk and visible in production."
        default:
            "Used for log types that do not fit into the standard categories. These may not have defined persistence or visibility characteristics."
        }
    }
    
    var emoji: String {
        switch self {
        case .debug:   "🐛"
        case .info:    "💬"
        case .default: "📋"
        case .error:   "⚠️"
        case .fault:   "🚨"
        default:       "❓"
        }
    }
    
    /// Whether messages logged at this level are persisted to disk and visible in production
    /// without an attached debugger.
    ///
    /// | Level    | Persisted | Visible in Production |
    /// |----------|-----------|-----------------------|
    /// | debug    | ❌        | ❌                    |
    /// | info     | ❌        | ❌                    |
    /// | default  | ✅        | ✅                    |
    /// | error    | ✅        | ✅                    |
    /// | fault    | ✅        | ✅                    |
    var isPersistedInProduction: Bool {
        switch self {
        case .debug, .info: false
        case .default, .error, .fault: true
        default: false
        }
    }
    
    /// A combined emoji and name description of this log type.
    var emojiLabel: String {
        "\(emoji) \(name)"
    }
    
    var name: String {
        switch self {
        case .debug:   "Debug"
        case .info:    "Info"
        case .default: "Notice"
        case .error:   "Error"
        case .fault:   "Fault"
        default:       "Unknown"
        }
    }
    
    /// A relative severity level for this log type, where higher values indicate more severe log messages.
    ///
    /// This allows log messages to be easily categorized and filtered based on their severity level in
    /// logging systems and tools.
    ///
    /// ## Levels
    /// - `debug`: 0 (least severe)
    /// - `info`: 1
    /// - `default`: 2
    /// - `error`: 3
    /// - `fault`: 4 (most severe)
    /// - `default` case: 5 (unknown severity, treated as most severe for sorting purposes)
    ///
    /// - Returns: An integer representing the relative severity of this log type.
    var severity: Int {
        switch self {
        case .debug:   0
        case .info:    1
        case .default: 2
        case .error:   3
        case .fault:   4
        default:       5
        }
    }
    
    /// An array of all standard `OSLogType` cases for iteration and display purposes.
    ///
    /// This includes the standard log types defined by the `OSLogType` enumeration,
    ///  excluding any custom or unknown cases.
    ///
    /// - Returns: An array containing all standard `OSLogType` cases, in order of
    /// increasing `severity`.
    static let allCases: [Self] = [
        .debug,
        .info,
        .default,
        .error,
        .fault
    ]
    
    static let navigationTitle = "OSLogTypes"
}

// MARK: - Preview

#if DEBUG
import SwiftUI
#Preview {
    NavigationStack {
        List(OSLogType.allCases, id: \.self) { type in
            VStack {
                LabeledContent {
#if os(tvOS)
                    Text(type.severity.formatted())
                        .bold()
                        .foregroundStyle(.black.gradient)
                        .padding()
                        .background(type.color.gradient)
                        .clipShape(.circle)
#else
                    Gauge(value: Double(type.severity), in: 0...4) {
                        Text(type.severity.formatted())
                            .foregroundStyle(type.color.gradient)
                    }
                    .gaugeStyle(.accessoryCircularCapacity)
                    .tint(type.color.gradient)
#endif
                } label: {
                    Text(type.emojiLabel)
                        .bold()
                    Text(type.isPersistedInProduction ? "Persisted" : "Not persisted")
                        .foregroundStyle(type.isPersistedInProduction.color.gradient)
                }
                Text(type.details)
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity)
            }
            .onAppear {
                logger(.swift, message: type.emojiLabel)
            }
        }
        .navigationTitle(OSLogType.navigationTitle)
        .navigationSubtitle(subtitle: "Preview of extended properties")
    }
}
#endif

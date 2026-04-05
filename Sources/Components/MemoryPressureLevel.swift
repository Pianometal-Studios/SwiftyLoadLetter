//
//  MemoryPressureLevel.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 4/4/26.
//  MIT License
//

import SwiftUI
import Dispatch

/// Maps `DispatchSource.MemoryPressureEvent` to a user-facing level.
///
/// This enum provides a user-friendly representation of memory pressure levels,
/// including details, colors, and icons for each level. It can be initialized directly from
/// a `DispatchSource.MemoryPressureEvent` to facilitate easy integration
/// with system memory pressure monitoring.
///
/// - Important: `DispatchSource.MemoryPressureEvent.all`  is intentionally
///   replaced with `case unknown` to prevent misuse, as memory pressure levels are
///   mutually exclusive and should not be combined.
@frozen public enum MemoryPressureLevel:
    String,
    Staticable,
    Searchable,
    Iconable,
    Colorable,
    Describable {
    
    case normal
    case warning
    case critical
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
            "Memory pressure is normal. System resources are sufficient for current workloads."
        case .warning:
            "Memory pressure is elevated. Consider closing unused applications."
        case .critical:
            "Memory pressure is critical. Close applications immediately to prevent system instability."
        case .unknown:
            "Memory pressure level is unknown. This may an error in retrieving memory pressure information."
        }
    }
    
    public var icon: String {
        switch self {
        case .normal:   "memorychip"
        case .warning:  "memorychip.fill"
        case .critical: "exclamationmark.triangle.fill"
        case .unknown:  "questionmark.circle.fill"
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
    
    /// Initialize from a `DispatchSource.MemoryPressureEvent`
    ///
    /// - Parameter event: The memory pressure event to map.
    public init(_ event: DispatchSource.MemoryPressureEvent) {
        switch event {
        case .normal:   self = .normal
        case .warning:  self = .warning
        case .critical: self = .critical
        default:        self = .unknown
        }
    }
    
    public static let navigationTitle = "Memory Pressure Levels"
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(MemoryPressureLevel.allCases) { level in
            LabeledContent {
                EmptyView()
            } label: {
                Label(level.name, systemImage: level.icon)
                    .foregroundStyle(level.color)
                Text(level.details)
            }
        }
        .navigationTitle(MemoryPressureLevel.navigationTitle)
        .navigationSubtitle(subtitle: "All memory pressure levels.")
    }
}
#endif

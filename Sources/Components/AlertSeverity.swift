//
//  AlertSeverity.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 7/11/26.
//  Apache License 2.0
//

public import SwiftUI

/// The severity level of an alert
@frozen public enum AlertSeverity:
    String,
    Staticable,
    Searchable,
    Colorable,
    Iconable,
    Listable {
    
    /// Low severity
    case low
    
    /// Medium severity
    case medium
    
    /// High severity
    case high
    
    /// Critical severity
    case critical
    
    /// An unknown severity level
    case unknown
    
    public var color: Color {
        switch self {
        case .low:      .green
        case .medium:   .yellow
        case .high:     .orange
        case .critical: .red
        case .unknown:  .gray
        }
    }
    
    public var icon: String { "circle.fill" }
    
    public var name: String {
        switch self {
        case .low:      "Low"
        case .medium:   "Medium"
        case .high:     "High"
        case .critical: "Critical"
        case .unknown:  "Unknown"
        }
    }
    
    private var sortOrder: Int {
        switch self {
        case .low:      0
        case .medium:   1
        case .high:     2
        case .critical: 3
        case .unknown: -1
        }
    }
    
    public static let navigationTitle = "Severity Levels"
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.sortOrder < rhs.sortOrder
    }
    
    public init(from decoder: any Decoder) throws {
        let raw = try decoder.singleValueContainer().decode(String.self)
        self = AlertSeverity(rawValue: raw) ?? .unknown
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(AlertSeverity.allCases.sorted()) { severity in
            Label {
                Text(severity.name)
            } icon: {
                Image(systemName: severity.icon)
                    .foregroundStyle(severity.color)
            }
        }
        .navigationTitle(AlertSeverity.navigationTitle)
    }
}
#endif

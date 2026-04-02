//
//  LinkQuality.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/11/26.
//  MIT License
//

import Network
import SwiftUI

public extension NWPath.LinkQuality {
    
    /// - Returns: A color representing the link quality.
    ///
    
    var color: Color {
        switch self {
        case .good:       .green
        case .moderate:   .blue
        case .minimal:    .orange
        case .unknown:    .gray
        @unknown default: .red
        }
    }
    
    /// - Returns: An SF Symbol name representing the link quality.
    ///
    
    var icon: String {
        switch self {
        case .good:       "gauge.with.dots.needle.100percent"
        case .moderate:   "gauge.with.dots.needle.67percent"
        case .minimal:    "gauge.with.dots.needle.33percent"
        case .unknown:    "gauge.with.dots.needle.0percent"
        @unknown default: "gauge.open.with.lines.needle.84percent.exclamation"
        }
    }
    
    /// - Returns: A string representing the link quality.
    ///
    
    var name: String {
        switch self {
        case .good:       "Good"
        case .moderate:   "Moderate"
        case .minimal:    "Minimal"
        case .unknown:    "Unknown"
        @unknown default: "Undefined"
        }
    }
    
    /// - Returns: An array of all valid `NWPath.LinkQuality` cases.
    ///
    
    static let allCases: [NWPath.LinkQuality] = [
        .good,
        .moderate,
        .minimal,
        .unknown
    ]
}

#if DEBUG
#Preview {
    NavigationStack {
        List(NWPath.LinkQuality.allCases, id: \.hashValue) { status in
            Label {
                Text(status.name)
            } icon: {
                Image(systemName: status.icon)
                    .foregroundStyle(status.color)
            }
        }
        .navigationTitle("Connection Qualities")
    }
}
#endif

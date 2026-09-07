//
//  LinkQuality.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/11/26.
//  Apache License 2.0
//

import Network
import SwiftUI

public extension NWPath.LinkQuality {
    
    var color: Color {
        switch self {
        case .good:       .green
        case .moderate:   .blue
        case .minimal:    .orange
        case .unknown:    .gray
        @unknown default: .red
        }
    }
    
    var icon: String {
        switch self {
        case .good:       "gauge.with.dots.needle.100percent"
        case .moderate:   "gauge.with.dots.needle.67percent"
        case .minimal:    "gauge.with.dots.needle.33percent"
        case .unknown:    "gauge.open.with.lines.needle.84percent.exclamation"
        @unknown default: "exclamationmark.triangle"
        }
    }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    var name: String {
        switch self {
        case .good:       "Good"
        case .moderate:   "Moderate"
        case .minimal:    "Minimal"
        case .unknown:    "Unknown"
        @unknown default: "Undefined"
        }
    }
    
    /// - Returns: Value between 0 and 100 that provides an approximate visual
    /// representation of the strength of the `LinkQuality`.
    var percentage: Double {
        switch self {
        case .good:       100
        case .moderate:   67
        case .minimal:    33
        case .unknown:    0
        @unknown default: 0
        }
    }
    
    /// An array of all valid `NWPath.LinkQuality` cases, sorted from best to worst quality.
    ///
    /// - Returns: [.good, .moderate, .minimal, .unknown]
    static let allCases: [Self] = [
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

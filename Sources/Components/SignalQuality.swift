//
//  SignalQuality.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 4/11/26.
//  Apache License 2.0
//

import SwiftUI

/// A simple enumeration representing the quality of a signal, such as Wi-Fi or cellular connectivity.
///
/// This is categorized into four levels: excellent, good, fair, and poor, based on common thresholds
/// for signal strength. Each level is associated with a color and an icon that can be used for visual
/// representation in a user interface.
@frozen public enum SignalQuality:
    String,
    Staticable,
    Searchable,
    Colorable,
    Iconable,
    Listable {
    
    case excellent
    case good
    case fair
    case poor
    
    public var color: Color {
        switch self {
        case .excellent: .green
        case .good:      .blue
        case .fair:      .orange
        case .poor:      .red
        }
    }
    
    public var icon: String {
        switch self {
        case .excellent: "waveform.path"
        case .good:      "waveform"
        case .fair:      "waveform.mid"
        case .poor:      "waveform.low"
        }
    }
    
    public var name: String {
        switch self {
        case .excellent: "Excellent"
        case .good:      "Good"
        case .fair:      "Fair"
        case .poor:      "Poor"
        }
    }
    
    /// - Returns: The signal quality level represented as a number
    public var strength: Int {
        switch self {
        case .excellent: 4
        case .good:      3
        case .fair:      2
        case .poor:      1
        }
    }
    
    /// - Returns: Closed range of valid signal quality levels
    public static let range = 1...allCases.count
    
    public static let navigationTitle = "Signal Qualities"
    
    /// Sorted in order of signal ``strength``
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.strength < rhs.strength
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(SignalQuality.allCases.sorted()) { quality in
            Label {
                Text(quality.name)
            } icon: {
                Image(systemName: quality.icon)
                    .symbolColorRenderingMode(.gradient)
                    .foregroundStyle(quality.color)
            }
        }
        .navigationTitle(SignalQuality.navigationTitle)
        .navigationSubtitle(subtitle: "Sorted by signal strength level.")
    }
}
#endif

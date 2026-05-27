//
//  FrequencyBands.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/27/26.
//  Apache License 2.0
//

import SwiftUI
import Network

/// Represents the frequency bands used by Wi-Fi networks, along with their associated properties such as color, icon, name, and signal quality.
public enum FrequencyBands:
    String,
    Staticable,
    Nameable,
    Iconable,
    Colorable,
    Listable {
    
    /// The 2.4 GHz frequency band
    case twoFour
    
    /// The 5.0 GHz frequency band
    case fiveZero
    
    /// The 6.0 GHz frequency band
    case sixZero
    
    public var color: Color {
        switch self {
        case .twoFour:  .cyan
        case .fiveZero: .teal
        case .sixZero:  .mint
        }
    }
    
    public var details: String {
        switch self {
        case .twoFour:
            "Used for Wi-Fi networks and offers longer range but lower speeds compared to higher frequency bands."
        case .fiveZero:
            "Used for Wi-Fi networks and offers higher speeds but shorter range compared to the 2.4 GHz band."
        case .sixZero:
            "Used for Wi-Fi 6E networks, offering higher speeds and lower latency with limited range compared to the 2.4 GHz and 5.0 GHz bands."
        }
    }
    
    /// - Returns: The frequency in GHz associated with the frequency band.
    public var frequency: Double {
        switch self {
        case .twoFour:  2.4
        case .fiveZero: 5.0
        case .sixZero:  6.0
        }
    }
    
    public var icon: String {
        signalQuality.icon
    }
    
    /// - Returns: `true` if the frequency band is considered high-speed (5.0 GHz or 6.0 GHz), otherwise `false`.
    public var isHighSpeed: Bool {
        self != .twoFour
    }
    
    /// - Returns: `true` if the frequency band is considered low-latency (6.0 GHz), otherwise `false`.
    public var isLowLatency: Bool {
        self == .sixZero
    }
    
    public var name: String {
        "\(frequency.formatted()) GHz"
    }
    
    /// - Returns: The signal quality associated with the frequency band, which can be used to indicate the expected performance of a Wi-Fi connection on that band.
    var signalQuality: SignalQuality {
        switch self {
        case .twoFour:  .fair
        case .fiveZero: .good
        case .sixZero:  .excellent
        }
    }
    
    /// - Returns: The link quality associated with the frequency band, which can be used to indicate the expected performance of a Wi-Fi connection on that band.
    public var rangeQuality: NWPath.LinkQuality {
        switch self {
        case .twoFour:  .good
        case .fiveZero: .moderate
        case .sixZero:  .minimal
        }
    }
    
    public static let navigationTitle = "Frequency Bands"
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(FrequencyBands.allCases) { band in
            Section {
                LabeledContent {
                    Text(band.rangeQuality.name)
                } label: {
                    Label {
                        Text("Range")
                    } icon: {
                        Image(systemName: band.rangeQuality.icon)
                            .foregroundStyle(band.rangeQuality.color)
                    }
                }
                LabeledContent {
                    Text(band.isHighSpeed.name)
                } label: {
                    Label("High Speed", systemImage: band.isHighSpeed.icon)
                }
                .listItemTint(band.isHighSpeed.color)
                LabeledContent {
                    Text(band.isLowLatency.name)
                } label: {
                    Label("Low Latency", systemImage: band.isLowLatency.icon)
                }
                .listItemTint(band.isLowLatency.color)
            } header: {
                Label {
                    Text(band.name)
                        .bold()
                } icon: {
                    Image(systemName: band.icon)
                        .foregroundStyle(band.color)
                }
            } footer: {
                Text(band.details)
                    .multilineTextAlignment(.center)
            }
        }
        .navigationTitle(FrequencyBands.navigationTitle)
        .navigationSubtitle(subtitle: "All cases of FrequencyBands")
    }
}
#endif

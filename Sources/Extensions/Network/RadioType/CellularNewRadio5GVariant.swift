//
//  CellularNewRadio5GVariant.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/27/26.
//  Apache License 2.0
//

import Network
import SwiftUI

public extension NWInterface.RadioType.Cellular.NewRadio5GVariant {
    
    var color: Color {
        switch self {
        case .sub6GHz:    .brown
        case .mmWave:     .indigo
        @unknown default: .red
        }
    }
    
    var describableObject: DescribableObject {
        .init(name, icon: icon, details: details)
    }
    
    var details: String {
        switch self {
        case .sub6GHz:    
            "Operates in the sub-6 GHz frequency range, offering broader coverage and better penetration through obstacles."
        case .mmWave:
            "Operates in the millimeter wave frequency range, providing extremely high speeds and low latency but with limited coverage and penetration."
        @unknown default:
            "Details of this 5G variant are unknown."
        }
    }
    
    var icon: String {
        switch self {
        case .sub6GHz:    "wave.3.right"
        case .mmWave:     "dot.radiowaves.right"
        @unknown default: "exclamationmark.triangle"
        }
    }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    /// - Returns: `true` if the 5G variant is mmWave, otherwise `false`
    var isLowLatency: Bool {
        switch self {
        case .sub6GHz:    false
        case .mmWave:     true
        @unknown default: false
        }
    }
    
    /// - Returns: `true` if the 5G variant is mmWave, otherwise `false`
    var isHighSpeed: Bool {
        switch self {
        case .sub6GHz:    false
        case .mmWave:     true
        @unknown default: false
        }
    }
    
    var name: String {
        switch self {
        case .sub6GHz:    "Sub-6 GHz"
        case .mmWave:     "mmWave"
        @unknown default: "Undefined"
        }
    }
    
    /// - Returns: The link quality associated with the frequency band, which can be used to indicate the expected performance of a Wi-Fi connection on that band.
    var rangeQuality: NWPath.LinkQuality {
        switch self {
        case .sub6GHz:    .good
        case .mmWave:     .minimal
        @unknown default: .unknown
        }
    }
    
    /// - Returns: A `SignalQuality` value representing the penetration level of the 5G variant
    var penetrationLevel: SignalQuality {
        switch self {
        case .sub6GHz:    .good
        case .mmWave:     .poor
        @unknown default: .poor
        }
    }

    static let allCases: [Self] = [.sub6GHz, .mmWave]
    
    static let navigationTitle = "5G Variants"
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(NWInterface.RadioType.Cellular.NewRadio5GVariant.allCases, id: \.self) { variant in
            Section {
                LabeledContent {
                    Text(variant.penetrationLevel.name)
                } label: {
                    Label {
                        Text("Penetration")
                    } icon: {
                        Image(systemName: variant.penetrationLevel.icon)
                            .foregroundStyle(variant.penetrationLevel.color)
                    }
                }
                LabeledContent {
                    Text(variant.rangeQuality.name)
                } label: {
                    Label {
                        Text("Range")
                    } icon: {
                        Image(systemName: variant.rangeQuality.icon)
                            .foregroundStyle(variant.rangeQuality.color)
                    }
                }
                LabeledContent {
                    Text(variant.isHighSpeed.name)
                } label: {
                    Label("High Speed", systemImage: variant.isHighSpeed.icon)
                }
                .listItemTint(variant.isLowLatency.color)
                LabeledContent {
                    Text(variant.isLowLatency.name)
                } label: {
                    Label("Low Latency", systemImage: variant.isLowLatency.icon)
                }
                .listItemTint(variant.isLowLatency.color)
            } header: {
                Label {
                    Text(variant.name)
                } icon: {
                    Image(systemName: variant.icon)
                        .foregroundStyle(variant.color)
                        .symbolColorRenderingMode(.gradient)
                }
            } footer: {
                Text(variant.details)
                    .multilineTextAlignment(.center)
            }
        }
        .navigationTitle(NWInterface.RadioType.Cellular.NewRadio5GVariant.navigationTitle)
        .navigationSubtitle(subtitle: "All cases of NWInterface.RadioType.Cellular.NewRadio5GVariant")
    }
}
#endif

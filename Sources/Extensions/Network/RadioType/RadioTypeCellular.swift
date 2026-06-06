//
//  RadioTypeCellular.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/27/26.
//  Apache License 2.0
//

import Network
import SwiftUI

public extension NWInterface.RadioType.Cellular {
    
    var color: Color {
        switch self {
        case .cdma:                      .gray
        case .evdo:                      .brown
        case .gsm:                       .orange
        case .wcdma:                     .green
        case .lte:                       .blue
        case .standalone5G:              .indigo
        case .dualConnectivity5G:        .purple
        @unknown default:                .red
        }
    }
    
    var describableObject: DescribableObject {
        .init(name, icon: icon, details: details)
    }
    
    var details: String {
        switch self {
        case .cdma:                            
            "Code Division Multiple Access"
        case .evdo:
            "Evolution-Data Optimized"
        case .gsm:
            "Global System for Mobile Communications"
        case .wcdma:
            "Wideband Code Division Multiple Access"
        case .lte:
            "Long-Term Evolution"
        case .standalone5G(let variant):
            "5G New Radio (Standalone) - \(variant.name)"
        case .dualConnectivity5G(let variant):
            "5G New Radio (Dual Connectivity) - \(variant.name)"
        @unknown default:
            "Undefined cellular radio type."
        }
    }
    
    var icon: String {
        is5G ? "cellularbars" : "antenna.radiowaves.left.and.right"
    }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    /// `true` if this is a 5G New Radio variant (standalone or
    /// dual-connectivity).
    var is5G: Bool {
        switch self {
        case .standalone5G, .dualConnectivity5G: true
        default:                                 false
        }
    }
    
    var name: String {
        switch self {
        case .cdma:                            "CDMA"
        case .evdo:                            "EV-DO"
        case .gsm:                             "GSM"
        case .wcdma:                           "WCDMA"
        case .lte:                             "LTE"
        case .standalone5G(let variant):       "5G SA (\(variant.name))"
        case .dualConnectivity5G(let variant): "5G NSA (\(variant.name))"
        @unknown default:                      "Undefined"
        }
    }
    
    static let allCases: [Self] = [
        .cdma,
        .evdo,
        .gsm,
        .wcdma,
        .lte,
        .standalone5G(.sub6GHz),
        .standalone5G(.mmWave),
        .dualConnectivity5G(.sub6GHz),
        .dualConnectivity5G(.mmWave)
    ]
    
    static let navigationTitle = "Cellular Types"
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(NWInterface.RadioType.Cellular.allCases, id: \.name) { type in
            Section {
                LabeledContent {
                    Text(type.is5G.name)
                } label: {
                    Label {
                        Text("5G")
                    } icon: {
                        Image(systemName: type.is5G.icon)
                            .foregroundStyle(type.is5G.color)
                    }
                }
            } header: {
                Label {
                    Text(type.name)
                } icon: {
                    Image(systemName: type.icon)
                        .foregroundStyle(type.color)
                        .symbolVariant(.circle.fill)
                        .symbolColorRenderingMode(.gradient)
                }
            } footer: {
                Text(type.details)
                    .padding(.bottom)
            }
        }
        .navigationTitle(NWInterface.RadioType.Cellular.navigationTitle)
        .navigationSubtitle(subtitle: "All cases of NWInterface.RadioType.Cellular")
    }
}
#endif

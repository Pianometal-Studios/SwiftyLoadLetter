//
//  RadioType.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/27/26.
//  Apache License 2.0
//

import Network
import SwiftUI

/// UI-friendly extensions on `NWInterface.RadioType` and its nested
/// `WiFi`, `Cellular`, and `Cellular.NewRadio5GVariant` enums.
///
/// Each type exposes a human-readable `name`, an SF Symbol `icon`, a semantic
/// `color`, and an `allCases` collection for previews and pickers. Cases with
/// associated values (`cell(_:)`, `wifi(_:)`, `standalone5G(_:)`,
/// `dualConnectivity5G(_:)`) delegate to their nested value where appropriate.
public extension NWInterface.RadioType {
    
    var color: Color {
        switch self {
        case .cell(let cellular): cellular.color
        case .wifi(let wifi):     wifi.color
        @unknown default:         .gray
        }
    }



    var icon: String {
        switch self {
        case .cell(let cellular): cellular.icon
        case .wifi(let wifi):     wifi.icon
        @unknown default:         "questionmark"
        }
    }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    /// `true` if this radio type is 5G (standalone or dual-connectivity).
    var is5G: Bool {
        if case .cell(let cellular) = self { return cellular.is5G }
        return false
    }

    /// `true` if this radio type is any cellular variant (`.cell(_)`).
    var isCellular: Bool {
        if case .cell = self { return true }
        return false
    }

    /// `true` if this radio type is any Wi-Fi standard (`.wifi(_)`).
    var isWifi: Bool {
        if case .wifi = self { return true }
        return false
    }
    
    var name: String {
        switch self {
        case .cell(let cellular): cellular.name
        case .wifi(let wifi):     wifi.name
        @unknown default:         "Other"
        }
    }

    /// All representative `NWInterface.RadioType` values, with cellular
    /// variants first (matching `NWInterface.InterfaceType.allCases` ordering)
    /// followed by Wi-Fi standards. 5G cases enumerate both
    /// `NewRadio5GVariant` values.
    static let allCases: [Self] =
        NWInterface.RadioType.Cellular.allCases.map { .cell($0) }
        + NWInterface.RadioType.WiFi.allCases.map { .wifi($0) }
    
    static let navigationTitle = "Radio Types"
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(NWInterface.RadioType.allCases, id: \.name) { type in
            Section {
                LabeledContent {
                    Text(type.isCellular.name)
                } label: {
                    Label("Cellular", systemImage: type.isCellular.icon)
                        .foregroundStyle(type.isCellular.color)
                }
                LabeledContent {
                    Text(type.is5G.name)
                } label: {
                    Label("5G", systemImage: type.is5G.icon)
                        .foregroundStyle(type.is5G.color)
                }
                LabeledContent {
                    Text(type.isWifi.name)
                } label: {
                    Label("WiFi", systemImage: type.isWifi.icon)
                        .foregroundStyle(type.isWifi.color)
                }
            } header: {
                Label {
                    Text(type.name)
                } icon: {
                    Image(systemName: type.icon)
                        .foregroundStyle(type.color)
                }
            }
        }
        .navigationTitle(NWInterface.RadioType.navigationTitle)
        .navigationSubtitle(subtitle: "All cases of NWInterface.RadioType")
    }
}
#endif

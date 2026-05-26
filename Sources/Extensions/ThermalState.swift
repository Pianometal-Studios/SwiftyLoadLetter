//
//  ThermalState.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/11/26.
//  MIT License
//
// -----------------------------------------
//  ╔╦╗╦ ╦╔═╗╦═╗╔╦╗╔═╗╦    ╔═╗╔╦╗╔═╗╔╦╗╔═╗
//   ║ ╠═╣║╣ ╠╦╝║║║╠═╣║    ╚═╗ ║ ╠═╣ ║ ║╣ 
//   ╩ ╩ ╩╚═╝╩╚═╩ ╩╩ ╩╩═╝  ╚═╝ ╩ ╩ ╩ ╩ ╚═╝
// -----------------------------------------
//

import SwiftUI

public extension ProcessInfo.ThermalState {
    
    var color: Color {
        switch self {
        case .nominal:    .green
        case .fair:       .yellow
        case .serious:    .orange
        case .critical:   .red
        @unknown default: .gray
        }
    }
    
    var details: String {
        switch self {
        case .nominal:
            "The thermal state is within normal limits."
        case .fair:
            "The thermal state is slightly elevated."
        case .serious:
            "The thermal state is high."
        case .critical:
            "The thermal state is significantly impacting the performance of the system and the device needs to cool down."
        @unknown default:
            "The thermal state cannot be determined."
        }
    }
    
    var icon: String {
        switch self {
        case .nominal:    "thermometer.low"
        case .fair:       "thermometer.medium"
        case .serious:    "thermometer.high"
        case .critical:   "thermometer.variable"
        @unknown default: "thermometer.medium.slash"
        }
    }
    
    var name: String {
        switch self {
        case .nominal:    "Nominal"
        case .fair:       "Fair"
        case .serious:    "Serious"
        case .critical:   "Critical"
        @unknown default: "Undefined"
        }
    }
    
    /// - Returns: Value between 0 and 100 that provides an approximate visual
    /// representation of the severity of the `ThermalState`.
    var percentage: Double {
        switch self {
        case .nominal:    20
        case .fair:       40
        case .serious:    80
        case .critical:   100
        @unknown default: 0
        }
    }
    
    var object: DescribableObject {
        .init(name, icon: icon, details: details)
    }
    
    /// An array of all standard `ProcessInfo.ThermalState` cases, sorted by severity.
    ///
    /// - Returns: [.nominal, .fair, .serious, .critical]
    static let allCases: [ProcessInfo.ThermalState] = [
        .nominal,
        .fair,
        .serious,
        .critical
    ]
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(ProcessInfo.ThermalState.allCases, id: \.rawValue) { state in
            ProgressView(value: state.percentage, total: 100) {
                Label {
                    Text(state.name)
                    Text(state.details)
                } icon: {
                    Image(systemName: state.icon)
                        .foregroundStyle(state.color)
                        .imageScale(.large)
                }
            }
            .tint(state.color)
            .padding(.vertical)
            .listRowBackground(state.color.opacity(0.1))
        }
        .navigationTitle("Thermal States")
    }
}
#endif

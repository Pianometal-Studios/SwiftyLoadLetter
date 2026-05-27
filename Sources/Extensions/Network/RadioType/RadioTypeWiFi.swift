//
//  RadioTypeWiFi.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/27/26.
//  Apache License 2.0
//

import Network
import SwiftUI

public extension NWInterface.RadioType.WiFi {
    
    var adoptedYear: String {
        switch self {
        case .a:          "1999"
        case .b:          "1999"
        case .g:          "2003"
        case .n:          "2009"
        case .ac:         "2013"
        case .ax:         "2021"
        @unknown default: "Unknown"
        }
    }
    
    var color: Color {
        switch self {
        case .a:          .gray
        case .b:          .brown
        case .g:          .orange
        case .n:          .yellow
        case .ac:         .green
        case .ax:         .blue
        @unknown default: .red
        }
    }
    
    var frequencyBands: [FrequencyBands] {
        switch self {
        case .a:          [.fiveZero]
        case .b:          [.twoFour]
        case .g:          [.twoFour]
        case .n:          [.twoFour, .fiveZero]
        case .ac:         [.fiveZero]
        case .ax:         [.twoFour, .fiveZero, .sixZero]
        @unknown default: []
        }
    }
    
    var generation: Int {
        switch self {
        case .a:          2
        case .b:          1
        case .g:          3
        case .n:          4
        case .ac:         5
        case .ax:         6
        @unknown default: 0
        }
    }
    
    var icon: String { "wifi" }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    var name: String {
        switch self {
        case .a:          "802.11a"
        case .b:          "802.11b"
        case .g:          "802.11g"
        case .n:          "802.11n"
        case .ac:         "802.11ac"
        case .ax:         "802.11ax"
        @unknown default: "Undefined"
        }
    }
    
    var maxSpeed: Int {
        switch self {
        case .a:          54
        case .b:          11
        case .g:          54
        case .n:          600
        case .ac:         3_500
        case .ax:         9_600
        @unknown default: 0
        }
    }
    
    static let navigationTitle = "Wi-Fi Types"
    
    static let allCases: [Self] = [
        .a,
        .b,
        .g,
        .n,
        .ac,
        .ax
    ]
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(NWInterface.RadioType.WiFi.allCases, id: \.self) { type in
            Section {
                LabeledContent {
                    Text(type.adoptedYear)
                } label: {
                    Text("Year Adopted")
                }
                LabeledContent {
                    Text(type.generation.formatted())
                } label: {
                    Text("Generation")
                }
                VStack {
                    Text(FrequencyBands.navigationTitle)
                        .font(.footnote)
                    LazyVGrid(columns: GridItem.generate(FrequencyBands.allCases.count)) {
                        ForEach(FrequencyBands.allCases, id: \.self) { band in
                            Label {
                                Text(band.name)
                            } icon: {
                                Image(systemName: band.icon)
                                    .foregroundStyle(band.color)
                            }
                            .font(.footnote)
                            .padding(4)
                            .background(band.color.quinary)
                            .clipShape(.capsule)
                            .darken(when: !type.frequencyBands.contains(band))
                        }
                    }
                }
            } header: {
                Label {
                    Text(type.name)
                } icon: {
                    Image(systemName: type.icon)
                        .foregroundStyle(type.color)
                        .symbolColorRenderingMode(.gradient)
                }
            } footer: {
                ProgressView(
                    value: Double(type.maxSpeed),
                    total: Double(NWInterface.RadioType.WiFi.ax.maxSpeed)) {
                        LabeledContent {
                            Text("\(type.maxSpeed.formatted()) Mbps")
                        } label: {
                            Text("Max Speed")
                        }
                        .font(.caption)
                    }
                    .tint(type.color)
                    .padding(.horizontal)
            }
        }
        .navigationTitle(NWInterface.RadioType.WiFi.navigationTitle)
        .navigationSubtitle(subtitle: "All cases of NWInterface.RadioType.WiFi")
    }
}
#endif

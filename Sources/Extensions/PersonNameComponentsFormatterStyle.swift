//
//  PersonNameComponentsFormatterStyle.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/30/26.
//  Apache License 2.0
//

import Foundation

public extension PersonNameComponentsFormatter.Style {
    
    var name: String {
        switch self {
        case .default:     "Default"
        case .short:       "Short"
        case .medium:      "Medium"
        case .long:        "Long"
        case .abbreviated: "Abbreviated"
        @unknown default:  "Unknown"
        }
    }
    
    /// An array of all cases of `PersonNameComponentsFormatter.Style`, sorted
    /// by their raw value.
    ///
    /// - Returns: [`.default`, `.short`, `.medium`, `.long`, `.abbreviated`]
    static let allCases: [Self] = [
        .default,
        .short,
        .medium,
        .long,
        .abbreviated
    ]
}

// MARK: - Preview

#if DEBUG
import SwiftUI
#Preview {
    let styles = PersonNameComponentsFormatter.Style.allCases
    NavigationStack {
        List {
            Section("PersonNameComponentsFormatter.Style") {
                LabeledContent("Name", value: "RawValue")
                    .bold()
                ForEach(styles, id: \.self) {
                    LabeledContent(
                        $0.name,
                        value: $0.rawValue.formatted())
                }
            }
        }
        .navigationTitle("All Cases")
    }
}
#endif

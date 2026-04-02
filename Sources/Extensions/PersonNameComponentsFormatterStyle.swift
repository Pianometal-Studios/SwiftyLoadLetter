//
//  PersonNameComponentsFormatterStyle.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/30/26.
//  MIT License
//

import Foundation

public extension PersonNameComponentsFormatter.Style {
    
    /// - Returns: A string representing the name style.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var name: String {
        switch self {
        case .default: "Default"
        case .short: "Short"
        case .medium: "Medium"
        case .long: "Long"
        case .abbreviated: "Abbreviated"
        @unknown default: "Unknown"
        }
    }
    
    /// - Returns: An array of all valid `PersonNameComponentsFormatter.Style` cases.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    static let allCases: [PersonNameComponentsFormatter.Style] = [
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
    NavigationStack {
        List {
            Section("PersonNameComponentsFormatter.Style") {
                LabeledContent("Name", value: "RawValue")
                    .bold()
                ForEach(PersonNameComponentsFormatter.Style.allCases, id: \.self) {
                    LabeledContent($0.name, value: $0.rawValue.formatted())
                }
            }
        }
        .navigationTitle("All Cases")
    }
}
#endif

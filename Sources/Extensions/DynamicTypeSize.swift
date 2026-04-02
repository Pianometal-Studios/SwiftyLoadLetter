//
//  DynamicTypeSize.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/11/26.
//  MIT License
//

import SwiftUI

public extension DynamicTypeSize {
    
    var details: String {
        switch self {
        case .xSmall:         "An extra small size"
        case .small:          "A small size"
        case .medium:         "A medium size"
        case .large:          "A large size"
        case .xLarge:         "An extra large size"
        case .xxLarge:        "An extra extra large size"
        case .xxxLarge:       "An extra extra extra large size"
        case .accessibility1: "The first accessibility size"
        case .accessibility2: "The second accessibility size"
        case .accessibility3: "The third accessibility size"
        case .accessibility4: "The fourth accessibility size"
        case .accessibility5: "The fifth accessibility size"
        @unknown default:     "Undefined"
        }
    }
    
    var name: String {
        switch self {
        case .xSmall:         "X Small"
        case .small:          "Small"
        case .medium:         "Medium"
        case .large:          "Large"
        case .xLarge:         "X Large"
        case .xxLarge:        "XX Large"
        case .xxxLarge:       "XXX Large"
        case .accessibility1: "Accessibility 1"
        case .accessibility2: "Accessibility 2"
        case .accessibility3: "Accessibility 3"
        case .accessibility4: "Accessibility 4"
        case .accessibility5: "Accessibility 5"
        @unknown default:     "Undefined"
        }
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(DynamicTypeSize.allCases, id: \.self) { size in
            LabeledContent {
                EmptyView()
            } label: {
                Text(size.name)
                Text(size.details)
            }
        }
        .navigationTitle("Dynamic Type Sizes")
    }
}
#endif

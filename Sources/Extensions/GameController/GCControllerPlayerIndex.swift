//
//  GCControllerPlayerIndex.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/26/26.
//  Apache License 2.0
//

#if !os(watchOS)

import Foundation
import GameController

public extension GCControllerPlayerIndex {
    
    var icon: String {
        switch self {
        case .indexUnset: "person.crop.circle.badge.questionmark"
        case .index1:     "1.circle.fill"
        case .index2:     "2.circle.fill"
        case .index3:     "3.circle.fill"
        case .index4:     "4.circle.fill"
        @unknown default: "exclamationmark.triangle"
        }
    }
    
    var name: String {
        switch self {
        case .indexUnset: "Unassigned"
        case .index1:     "Player 1"
        case .index2:     "Player 2"
        case .index3:     "Player 3"
        case .index4:     "Player 4"
        @unknown default: "Undefined"
        }
    }
    
    static let allCases: [Self] = [
        .indexUnset,
        .index1,
        .index2,
        .index3,
        .index4
    ]
    
    static let navigationTitle = "Player Indexes"
}

// MARK: - Preview

#if DEBUG
import SwiftUI
#Preview {
    NavigationStack {
        List(GCControllerPlayerIndex.allCases, id: \.self) {
            Label($0.name, systemImage: $0.icon)
        }
        .navigationTitle(GCControllerPlayerIndex.navigationTitle)
    }
}
#endif
#endif

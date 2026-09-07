//
//  WKInterfaceDeviceWristLocation.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 9/7/26.
//  Apache License 2.0
//

#if os(watchOS)

import WatchKit
import SwiftUI

public extension WKInterfaceDeviceWristLocation {
    
    var icon: String {
        switch self {
        case .left:       "hand.point.left"
        case .right:      "hand.point.right"
        @unknown default: "questionmark"
        }
    }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    var name: String {
        switch self {
        case .left:       "Left"
        case .right:      "Right"
        @unknown default: "Undefined"
        }
    }
    
    /// An array of all valid `WKInterfaceDeviceWristLocation` cases.
    ///
    /// - Returns: [`.left`, `.right`]
    static let allCases: [Self] = [
        .left,
        .right
    ]
    
    static let navigationTitle = "Wrist Locations"
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(WKInterfaceDeviceWristLocation.allCases, id: \.rawValue) { location in
            Label {
                Text(location.name)
            } icon: {
                Image(systemName: location.icon)
            }
        }
        .navigationTitle(WKInterfaceDeviceWristLocation.navigationTitle)
    }
}
#endif
#endif

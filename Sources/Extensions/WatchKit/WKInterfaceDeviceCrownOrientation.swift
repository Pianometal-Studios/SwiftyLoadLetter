//
//  WKInterfaceDeviceCrownOrientation.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 9/7/26.
//  Apache License 2.0
//

#if os(watchOS)

import WatchKit
import SwiftUI

public extension WKInterfaceDeviceCrownOrientation {
    
    /// The SF Symbol representing the Digital Crown.
    ///
    /// The same symbol represents every orientation; the crown itself does not change,
    /// only the side of the watch it sits on.
    ///
    /// - Returns: `"digitalcrown.fill"`.
    var icon: String {
        "digitalcrown.fill"
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
    
    /// An array of all valid `WKInterfaceDeviceCrownOrientation` cases.
    ///
    /// - Returns: [`.left`, `.right`]
    static let allCases: [Self] = [
        .left,
        .right
    ]
    
    static let navigationTitle = "Crown Orientations"
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(WKInterfaceDeviceCrownOrientation.allCases, id: \.rawValue) { orientation in
            Label {
                Text(orientation.name)
            } icon: {
                Image(systemName: orientation.icon)
            }
        }
        .navigationTitle(WKInterfaceDeviceCrownOrientation.navigationTitle)
    }
}
#endif
#endif

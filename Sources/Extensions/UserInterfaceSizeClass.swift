//
//  UserInterfaceSizeClass.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/8/26.
//  MIT License
//

import SwiftUI

public extension UserInterfaceSizeClass {
    
    var name: String {
        switch self {
        case .compact:    "Compact"
        case .regular:    "Regular"
        @unknown default: "Unknown"
        }
    }
}

public extension UserInterfaceSizeClass? {
    
    var name: String {
        guard let self else {
            printOnDebug("⚠️ Unknown size class name")
            return "Unknown"
        }
        return self.name
    }
}

//
//  UserInterfaceSizeClass.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/8/26.
//  MIT License
//

import SwiftUI

public extension UserInterfaceSizeClass {
    
    /// - Returns: A string representing the size class.
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var name: String {
        switch self {
        case .compact: "Compact"
        case .regular: "Regular"
        @unknown default: "Unknown"
        }
    }
}

public extension UserInterfaceSizeClass? {
    
    /// - SeeAlso: `UserInterfaceSizeClass.name`
    ///
    /// - Authors: [@pianometal](https://github.com/pianometal)
    var name: String {
        guard let self else {
            printOnDebug("⚠️ Unknown size class name")
            return "Unknown"
        }
        return self.name
    }
}

//
//  ColorSchemeContrast.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 9/7/26.
//  Apache License 2.0
//

import SwiftUI

public extension ColorSchemeContrast {
    
    var color: Color {
        self == .increased ? .blue : .gray
    }
    
    var describableObject: DescribableObject {
        .init(name, icon: icon, details: details)
    }
    
    /// A human-readable description of the contrast level the value represents.
    ///
    /// - Returns: A sentence describing increased or standard contrast.
    var details: String {
        self == .increased
        ? "Increased contrast, drawing content with stronger separation from its background."
        : "Standard contrast, drawing content with the system's default separation."
    }
    
    var icon: String {
        self == .increased ? "circle.righthalf.filled" : "circle.lefthalf.filled"
    }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    var name: String {
        self == .increased ? "Increased" : "Standard"
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(ColorSchemeContrast.allCases, id: \.hashValue) { contrast in
            Label {
                Text(contrast.name)
                Text(contrast.details)
            } icon: {
                Image(systemName: contrast.icon)
                    .foregroundStyle(contrast.color)
            }
        }
        .navigationTitle("Color Scheme Contrasts")
    }
}
#endif

//
//  Label.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 7/14/26.
//  Apache License 2.0
//

public import SwiftUI

public extension Label where Title == Text, Icon == Image {
    
    /// Creates a `Label` from an object that conforms to ``Nameable`` and ``Iconable``
    ///
    /// - Parameter object: An object that conforms to both  ``Nameable`` and ``Iconable``
    nonisolated init(_ object: any Nameable & Iconable) {
        self.init(object.name, systemImage: object.icon)
    }
}

#if DEBUG
#Preview {
    NavigationStack {
        List(CommonAction.allCases.sorted()) { action in
            Button(role: action.role) {
                logger(.swift, message: action.name)
            } label: {
                Label(action)
            }
        }
        .navigationTitle(CommonAction.navigationTitle)
        .navigationSubtitle(subtitle: "Iconable and Nameable initializer")
    }
}
#endif

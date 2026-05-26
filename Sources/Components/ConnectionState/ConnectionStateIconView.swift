//
//  ConnectionStateIconView.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/6/26.
//  MIT License
//

import SwiftUI

/// A SwiftUI view that displays an icon representing a connection state.
///
/// `ConnectionStateIconView` provides a simple, reusable way to display connection status
/// using SF Symbols icons with appropriate colors. The view automatically selects the correct
/// icon and color based on the provided `ConnectionState`.
///
/// ## Example
///
/// ```swift
/// ConnectionStateIconView(.connected)
/// ```
public struct ConnectionStateIconView: View {
    
    /// The connection state to display as an icon.
    private let state: ConnectionState
    
    public var body: some View {
        
        Image(systemName: state.icon)
            .foregroundStyle(state.color)
    }
    
    /// Creates a connection state icon view.
    ///
    /// - Parameter state: The connection state to display as an icon.
    public init(_ state: ConnectionState) {
        self.state = state
    }
}

#if DEBUG
#Preview {
    NavigationStack {
        LazyVGrid(columns: GridItem.generate(ConnectionState.allCases.count)) {
            ForEach(ConnectionState.allCases.sorted()) {
                ConnectionStateIconView($0)
                    .font(.largeTitle.bold())
            }
        }
        .navigationTitle(ConnectionState.navigationTitle)
    }
}
#endif

//
//  ConnectionStateLabelView.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 4/11/26.
//  MIT License
//

import SwiftUI

/// A SwiftUI view that displays a labeled icon representing a connection state.
///
/// `ConnectionStateLabelView` provides a complete, ready-to-use label that combines
/// an icon and text to represent connection status. The view uses SwiftUI's `Label`
/// to create a standard, accessible presentation of connection states.
///
/// ## Example
///
/// ```swift
/// ConnectionStateLabelView(.connected)
/// ```
public struct ConnectionStateLabelView: View {
    
    /// The connection state to display as a label.
    private let state: ConnectionState
    
    public var body: some View {
        
        Label {
            
            Text(state.name)
            
        } icon: {
            
            Image(systemName: state.icon)
                .foregroundStyle(state.color)
        }
    }
    
    /// Creates a connection state label view.
    ///
    /// - Parameter state: The connection state to display as a labeled icon.
    ///
    /// The initializer automatically configures the view with the appropriate
    /// SF Symbol icon, color, and text label for the given state:
    /// - `.connected`: Green checkmark with "Connected"
    /// - `.disconnected`: Red X with "Disconnected"
    /// - `.connecting`: Blue rotating arrows with "Connecting"
    /// - `.disconnecting`: Orange rotating arrows with "Disconnecting"
    ///
    /// ## Example
    ///
    /// ```swift
    /// // Display a connected state label
    /// ConnectionStateLabelView(.connected)
    ///
    /// // Display with custom styling
    /// ConnectionStateLabelView(.connecting)
    ///     .symbolVariant(.fill.circle)
    ///     .font(.headline)
    /// ```
    public init(_ state: ConnectionState) {
        self.state = state
    }
}

#if DEBUG
#Preview {
    NavigationStack {
        List(ConnectionState.allCases) {
            ConnectionStateLabelView($0)
        }
        .navigationTitle("Connection States")
    }
}
#endif

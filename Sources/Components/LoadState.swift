//
//  LoadState.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 7/12/26.
//  Apache License 2.0
//

public import SwiftUI

/// An enum that models the lifecycle of loading operations and provides UI components to display them.
@frozen public enum LoadState:
    String,
    Staticable,
    Searchable,
    Colorable,
    Iconable,
    Listable {
    
    /// The operation is currently in progress.
    case loading
    
    /// The operation completed successfully and data is available.
    case loaded
    
    /// The operation ended with an error.
    case failed
    
    public var color: Color {
        switch self {
        case .loaded:      true.color
        case .loading:     .blue
        case .failed:      false.color
        }
    }
    
    public var icon: String {
        switch self {
        case .loaded:      true.icon
        case .loading:     "arrow.trianglehead.2.clockwise.rotate.90.circle"
        case .failed:      false.icon
        }
    }
    
    public var name: String {
        switch self {
        case .loaded:      "Loaded"
        case .loading:     "Loading"
        case .failed:      "Failed"
        }
    }
    
    public static let navigationTitle = "Loading States"
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(LoadState.allCases.sorted()) { loadState in
            Label {
                Text(loadState.name)
            } icon: {
                Image(systemName: loadState.icon)
                    .foregroundStyle(loadState.color)
                    .symbolVariant(.circle.fill)
            }
        }
        .navigationTitle(LoadState.navigationTitle)
        .navigationSubtitle(subtitle: "Various loading states")
    }
}
#endif

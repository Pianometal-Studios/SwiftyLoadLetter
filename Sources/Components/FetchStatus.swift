//
//  FetchStatus.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 6/29/26.
//  Apache License 2.0
//

public import SwiftUI

/// Where the batched roster fetch currently is, from the UI's point of view.
@frozen public enum FetchStatus:
    String,
    Staticable,
    Searchable,
    Iconable,
    Colorable,
    Listable {
    
    /// No fetch has been attempted yet.
    case idle
    
    /// A fetch is in flight.
    case loading
    
    /// A fetch completed; ``MemberProfileStore/profiles`` holds the result.
    case loaded
    
    /// A fetch failed. The roster still renders from static data.
    case failed
    
    public var color: Color {
        switch self {
        case .idle:    .orange
        case .loading: .blue
        case .loaded:  .green
        case .failed:  .red
        }
    }
    
    public var name: String {
        switch self {
        case .idle:    "Idle"
        case .loading: "Loading"
        case .loaded:  "Loaded"
        case .failed:  "Failed"
        }
    }
    
    public var icon: String {
        switch self {
        case .idle:    "circle.circle.fill"
        case .loading: "arrow.2.circlepath.circle.fill"
        case .loaded:  "checkmark.circle.fill"
        case .failed:  "xmark.circle.fill"
        }
    }
    
    public static let navigationTitle = "Fetch Status"
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(FetchStatus.allCases.sorted()) {
            ColorableLabelView($0, color: $0.color)
        }
        .navigationTitle(FetchStatus.navigationTitle)
    }
}
#endif


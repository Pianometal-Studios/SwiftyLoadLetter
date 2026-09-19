//
//  PeerAuthentication.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 9/19/26.
//  Apache License 2.0
//

public import Network
public import SwiftUI

public extension DTLS.PeerAuthentication {
    
    var color: Color {
        switch self {
        case .none:       .red
        case .optional:   .orange
        case .required:   .green
        @unknown default: .gray
        }
    }
    
    var describableObject: DescribableObject {
        .init(name, icon: icon, details: details)
    }
    
    var details: String {
        switch self {
        case .none:
            "The peer is never asked for a certificate, so nothing about its identity is verified."
        case .optional:
            "The peer is asked for a certificate, and the handshake still succeeds without one."
        case .required:
            "The peer must present a certificate that validates, or the handshake fails."
        @unknown default:
            "Unknown peer authentication preference."
        }
    }
    
    var icon: String {
        switch self {
        case .none:       "lock.open"
        case .optional:   "lock.circle.dotted"
        case .required:   "lock.shield"
        @unknown default: "exclamationmark.triangle"
        }
    }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    var name: String {
        switch self {
        case .none:       "None"
        case .optional:   "Optional"
        case .required:   "Required"
        @unknown default: "Undefined"
        }
    }
    
    /// An array of all `DTLS.PeerAuthentication` cases, sorted from the strictest
    /// preference to the most permissive.
    ///
    /// - Note: Computed rather than a `static let`, because `DTLS.PeerAuthentication` is not
    ///   `Sendable` and a stored static of a non-`Sendable` element type is not concurrency-safe.
    ///
    /// - Returns: [.required, .optional, .none]
    static var allCases: [Self] {
        [
            .required,
            .optional,
            .none
        ]
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(DTLS.PeerAuthentication.allCases, id: \.hashValue) { preference in
            Label {
                Text(preference.name)
                Text(preference.details)
            } icon: {
                Image(systemName: preference.icon)
                    .foregroundStyle(preference.color)
            }
        }
        .navigationTitle("Peer Authentication")
    }
}
#endif

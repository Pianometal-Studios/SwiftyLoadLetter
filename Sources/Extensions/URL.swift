//
//  URL.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/10/26.
//  MIT License
//

import Foundation

public extension URL {
    
    /// Attempts to construct a valid, contactable URL from the provided string.
    ///
    /// This helper validates two things:
    /// 1. The string can be parsed into a `URL`.
    /// 2. The resulting URL has a non-empty `host` component (to ensure it points to a contactable endpoint).
    ///
    /// If either validation fails, a debug message is logged and `nil` is returned.
    ///
    /// - Parameter string: The raw string to convert into a `URL`.
    ///
    /// - Returns: A `URL` whose host is non-empty, or `nil` if validation fails.
    ///
    /// - Note: This function is intended for network/remote URLs. It will reject URLs without a host
    ///         (e.g., file URLs or custom schemes without hosts).
    static func create(_ string: String) -> URL? {
        guard let url = URL(string: string) else {
            printOnDebug("⚠️ Unable to create URL from: \(string)")
            return nil
        }
        guard let host = url.host(), !host.isEmpty else {
            printOnDebug("⚠️ Unable to contact host from: \(url.debugDescription)")
            return nil
        }
        return url
    }
}

public extension String {
    
    /// Converts the string into a URL using SwiftyLoadLetter's `URL.create(_:)`.
    ///
    /// This relies on `URL.create(_:)` from SwiftyLoadLetter, which applies debug
    /// information in the terminal if the URL creation fails.
    ///
    /// - Returns: A `URL` created from the string, or `nil` if the string is not a valid URL.
    var toURL: URL? {
        URL.create(self)
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI
#Preview {
    NavigationStack {
        List {
            LabeledContent {
                if "https://www.apple.com".toURL != nil {
                    true.labelView()
                } else {
                    false.labelView()
                }
            } label: {
                Text("Valid URL")
                Text("Testing with Apple's official website")
            }
            LabeledContent {
                if "".toURL != nil {
                    false.labelView()
                } else {
                    true.labelView()
                }
            } label: {
                Text("Blank URL")
                Text("Testing with an empty string")
            }
            LabeledContent {
                if "   ".toURL != nil {
                    false.labelView()
                } else {
                    true.labelView()
                }
            } label: {
                Text("Whitespace URL")
                Text("Testing with a string of spaces")
            }
            LabeledContent {
                if "ht!tp://invalid-url".toURL != nil {
                    false.labelView()
                } else {
                    true.labelView()
                }
            } label: {
                Text("Invalid URL")
                Text("Testing with a malformed URL")
            }
        }
        .navigationTitle("URL Test Results")
    }
}
#endif

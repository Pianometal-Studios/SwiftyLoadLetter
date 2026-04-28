//
//  MainBundle.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/11/26.
//  MIT License
//

import Foundation

/// A namespace providing convenient, thread-safe accessors for values in the app’s main bundle.
///
/// MainBundle centralizes lookups of common Bundle.main properties and Info.plist entries,
/// adding lightweight diagnostics when expected values are missing.
///
/// ## Use Cases
/// - Reading the app’s bundle identifier.
/// - Accessing the full Info.plist dictionary.
/// - Fetching specific string values from Info.plist keys (e.g., CFBundleName, CFBundleShortVersionString).
public enum MainBundle: Sendable {
    
    /// The app’s bundle identifier string from the main bundle.
    ///
    /// - Returns: The value of `Bundle.main.bundleIdentifier` if available.
    public static var identifier: String? {
        guard let identifier = Bundle.main.bundleIdentifier else {
            printOnDebug("⚠️ Bundle identifier is nil")
            return nil
        }
        return identifier
    }
    
    /// The full contents of the app’s main bundle Info.plist as a dictionary.
    ///
    /// - Returns: A dictionary keyed by `String` with values of type `Any`
    ///   representing the entries from `Bundle.main.infoDictionary`, or `nil` if the
    ///   info dictionary cannot be accessed.
    ///
    public static var infoDictionary: [String : Any]? {
        guard let infoDictionary = Bundle.main.infoDictionary else {
            printOnDebug("⚠️ Bundle infoDictionary is nil")
            return nil
        }
        return infoDictionary
    }
    
    /// Attempts to retrieve a string value from the app’s main bundle Info.plist for a given key, if it exists.
    ///
    /// This helper reads from `Bundle.main.infoDictionary` via `MainBundle.infoDictionary`
    /// and attempts to cast the value associated with the provided key to `String`.
    ///
    /// - Parameter key: The Info.plist key to look up (e.g., `"CFBundleName"`, `
    /// "CFBundleShortVersionString"`).
    ///
    /// - Returns: The string value for the key if it exists and is a `String`; otherwise, `nil`.
    public static func infoDictionary(_ key: String) -> String? {
        guard let value = infoDictionary?[key] as? String else {
            printOnDebug("⚠️ Unable to find \(key) in Info.plist")
            return nil
        }
        return value
    }
}

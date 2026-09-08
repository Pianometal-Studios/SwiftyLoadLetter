//
//  MainBundle.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/11/26.
//  Apache License 2.0
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
    
    /// The app’s user-facing display name from the main bundle Info.plist.
    ///
    /// - Returns: The value of ``Keys/appName`` (`CFBundleDisplayName`), or `nil` when the
    ///   key is absent. Apps that do not set a display name should fall back to ``name``.
    public static var appName: String? {
        infoDictionary(Keys.appName.rawValue)
    }
    
    /// The app’s release version string from the main bundle Info.plist.
    ///
    /// - Returns: The value of ``Keys/appVersion`` (`CFBundleShortVersionString`),
    ///   such as `"1.3.4"`, or `nil` when the key is absent.
    public static var appVersion: String? {
        infoDictionary(Keys.appVersion.rawValue)
    }
    
    /// The app’s build number from the main bundle Info.plist.
    ///
    /// - Returns: The value of ``Keys/build`` (`CFBundleVersion`), or `nil` when the
    ///   key is absent.
    public static var build: String? {
        infoDictionary(Keys.build.rawValue)
    }
    
    /// The app’s bundle identifier string from the main bundle.
    ///
    /// - Returns: The value of `Bundle.main.bundleIdentifier` if available.
    public static var identifier: String? {
        guard let identifier = Bundle.main.bundleIdentifier else {
            logger(.swift, message: "Bundle identifier is nil")
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
            logger(.swift, message: "Bundle infoDictionary is nil")
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
            logger(.swift, message: "Unable to find \(key) in Info.plist")
            return nil
        }
        return value
    }
    
    /// Indicates whether the running bundle is an app extension rather than an app.
    ///
    /// App extensions declare a package type of `"XPC!"`, while apps declare `"APPL"`.
    ///
    /// - Returns: `true` when ``typeIdentifier`` is `"XPC!"`; otherwise `false`.
    public static var isAppExtension: Bool {
        typeIdentifier == "XPC!"
    }
    
    /// The short name of the bundle from the main bundle Info.plist.
    ///
    /// - Returns: The value of ``Keys/name-enum.case`` (`CFBundleName`), or `nil` when the key
    ///   is absent.
    public static var name: String? {
        infoDictionary(Keys.name.rawValue)
    }
    
    /// The bundle’s package type from the main bundle Info.plist.
    ///
    /// - Returns: The value of ``Keys/typeIdentifier`` (`CFBundlePackageType`), such as
    ///   `"APPL"` for an app or `"XPC!"` for an app extension, or `nil` when the key is absent.
    public static var typeIdentifier: String? {
        infoDictionary(Keys.typeIdentifier.rawValue)
    }
    
    /// The Info.plist keys `MainBundle` reads, paired with their literal key strings.
    ///
    /// Each case’s `rawValue` is the Info.plist key itself, so a case can be handed
    /// straight to ``MainBundle/infoDictionary(_:)`` without repeating the string.
    ///
    /// ## Use Cases
    /// - Reading a known Info.plist value without restating its key.
    /// - Listing the available keys in a diagnostics or about screen.
    ///
    /// ## Example
    /// ```swift
    /// let version = MainBundle.infoDictionary(MainBundle.Keys.appVersion.rawValue)
    /// ```
    @frozen public enum Keys: String, Staticable, Nameable, Describable {
        
        /// The build number, incremented for each build submitted to App Store Connect.
        case build = "CFBundleVersion"
        
        /// The user-facing name displayed beneath the app icon.
        case appName = "CFBundleDisplayName"
        
        /// The short name of the bundle.
        case name = "CFBundleName"
        
        /// The release version string shown to users.
        case appVersion = "CFBundleShortVersionString"
        
        /// The URL schemes the bundle declares that it can open.
        case urlTypes = "CFBundleURLTypes"
        
        /// The four-character code identifying the bundle type.
        case typeIdentifier = "CFBundlePackageType"
        
        public var details: String {
            switch self {
            case .build:          "The build number, incremented for each submitted build."
            case .appName:        "The user-facing name displayed beneath the app icon."
            case .name:           "The short name of the bundle."
            case .appVersion:     "The release version string shown to users."
            case .urlTypes:       "The URL schemes the bundle declares that it can open."
            case .typeIdentifier: "The four-character code identifying the bundle type."
            }
        }
        
        public var name: String {
            switch self {
            case .build:          "Build"
            case .appName:        "App Name"
            case .name:           "Bundle Name"
            case .appVersion:     "App Version"
            case .urlTypes:       "URL Types"
            case .typeIdentifier: "Type Identifier"
            }
        }
    }
}

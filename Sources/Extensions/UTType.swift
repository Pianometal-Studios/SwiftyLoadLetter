//
//  UTType.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/11/26.
//  MIT License
//

import UniformTypeIdentifiers

public extension UTType {
    
    /// A uniform type identifier derived from the app's bundle identifier.
    ///
    /// This computed property creates a `UTType` using the main bundle's identifier
    /// as an exported type identifier. If the bundle identifier cannot be determined
    /// (e.g., in debug environments or when running tests), it falls back to
    /// `"com.debug.unknown-bundle"` and logs a warning in debug builds.
    ///
    /// ## Usage
    /// - Registering custom document types or file types associated with your app.
    /// - Creating type identifiers for data that should be uniquely associated with your app's bundle.
    /// - Defining exported types in scenarios where you need programmatic access to the UTType.
    ///
    /// ## Example
    /// ```swift
    /// let utType = UTType.fromBundle
    /// ```
    ///
    /// - Returns: A `UTType` initialized with the app's bundle identifier as an exported type,
    ///   or `"com.debug.unknown-bundle"` if the bundle identifier is unavailable.
    ///
    /// - Note: This uses `UTType.init(exportedAs:)`, which declares the type as exported
    ///   from your app.
    ///
    /// - Important: Ensure your app's Info.plist includes the appropriate `UTExportedTypeDeclarations`
    ///   if you're using this for actual file type registration.
    static var fromBundle: Self {
        let identifier: String
        if let bundleID = MainBundle.identifier {
            identifier = bundleID
        } else {
            identifier = "com.debug.unknown-bundle"
            logger(.swift, message: "Using UTType fallback: \(identifier)")
        }
        return .init(exportedAs: identifier)
    }
}

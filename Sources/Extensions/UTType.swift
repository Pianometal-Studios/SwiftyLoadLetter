//
//  UTType.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/11/26.
//  MIT License
//

import UniformTypeIdentifiers

public extension UTType {
    
    /// A convenience Uniform Type Identifier (UTI) derived from the app’s bundle identifier.
    ///
    /// This property constructs a unique, app-scoped `UTType` using the bundle identifier
    /// from `MainBundle.identifier`. It is intended for cases where you need a stable,
    /// app-defined type—for example, when registering custom pasteboard types, drag-and-drop
    /// payloads, or document types that are specific to your application.
    ///
    /// - Uses `UTType(exportedAs:)` to create a type that your app "exports" (owns).
    /// - The resulting identifier follows the reverse-DNS format of your bundle identifier,
    ///   ensuring global uniqueness as long as your bundle identifier is unique.
    ///
    /// ## Use Cases:
    /// - Defining a custom UTType for drag-and-drop:
    ///   - e.g., `NSItemProvider(object: data as NSData, typeIdentifier: UTType.generate.identifier)`
    /// - Registering a custom document type in conjunction with Info.plist declarations.
    /// - Tagging custom data on the pasteboard or in interprocess communication.
    ///
    /// - Important: This relies on `MainBundle.identifier` being non-`nil`. If the bundle identifier
    ///   is not available or is misconfigured, this will cause a runtime crash due to the
    ///   forced unwrap.
    static var fromBundle: Self {
        UTType(exportedAs: MainBundle.identifier!)
    }
}

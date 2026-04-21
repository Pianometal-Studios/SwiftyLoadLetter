//
//  Print.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/8/26.
//  MIT License
//

import Foundation

/// Prints the given items to the standard output only in DEBUG builds, prefixed with
/// a `[🖨️ SwiftyLoadLetter]` tag so output is identifiable and filterable in Xcode's console.
///
/// This helper mirrors Swift's `print` function but compiles to a no-op in
/// non-DEBUG configurations, allowing you to sprinkle debug logging throughout
/// your code without incurring runtime cost or leaking logs in release builds.
///
/// ## Example
/// ```swift
/// printOnDebug("⚠️ Something went wrong")
/// // [🖨️ SwiftyLoadLetter] ⚠️ Something went wrong
/// ```
///
/// - Parameters:
///   - items: Zero or more items to print. Each item is converted to a string
///     using `String(describing:)` and separated by `separator`.
///   - separator: A string to insert between each item. The default is a single space (`" "`).
///   - terminator: The string to print after all items have been printed. The
///     default is a newline (`"\n"`).
///
/// - Note: In non-DEBUG builds, this function does nothing and produces no output.
public func printOnDebug(
    _ items: Any...,
    separator: String = " ",
    terminator: String = "\n"
) {
#if DEBUG
    let output = items
        .map { String(describing: $0) }
        .joined(separator: separator)
    print("[🖨️ SwiftyLoadLetter] \(output)", terminator: terminator)
#endif
}

/// Prints a human-readable description of an error to standard output only in DEBUG builds,
/// prefixed with a `[🖨️ SwiftyLoadLetter]` tag.
///
/// ## Example
/// ```swift
/// printOnDebug(someError)
/// // [🖨️ SwiftyLoadLetter] 📜 The operation couldn't be completed.
/// ```
///
/// - Parameter error: Accepts any value conforming to the `Error` protocol.
///
/// - Note: In non-DEBUG builds, this function does nothing and produces no output.
public func printOnDebug(_ error: any Error) {
#if DEBUG
    printOnDebug("📜 \(error.localizedDescription)")
#endif
}

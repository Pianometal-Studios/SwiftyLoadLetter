//
//  Logger.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 3/29/26.
//  MIT License
//
// =================================================
//         _
//        | |    ___   __ _  __ _  ___ _ __
//        | |   / _ \ / _` |/ _` |/ _ \ '__|
//        | |__| (_) | (_| | (_| |  __/ |
//        |_____\___/ \__, |\__, |\___|_|
//                    |___/ |___/
//
//   Centralized convenience LogCategory functions
//
// =================================================

import Foundation
import os

/// Logs a message using the app’s centralized logging system.
///
/// This convenience function routes messages to a strongly-typed `LogCategory` category,
/// defaulting to `.general`. It supports all `OSLogType` levels and automatically formats
/// output for Console.app with consistent subsystem and category labeling.
///
/// ## Example
///   ```swift
///   logger(.network, message: "Request started", type: .debug)
///   logger(.auth, message: "User signed in", type: .notice)
///   logger(message: "Background task completed") // uses .general and .debug
///   ```
///
/// - Parameters:
///   - category: The `LogCategory` category to log under.
///   - message: The textual message to record. Consider avoiding sensitive information; use
///              redaction or privacy controls at the call site if needed.
///   - type: The `OSLogType` severity for the message. Defaults to `.debug`.
///
/// - Important:
///   - `.debug` and `.info` are not persisted to disk and are best for development-time diagnostics.
///   - `.notice` and higher are persisted and suitable for production telemetry of significant events.
///
/// - SeeAlso: ``LogCategory``, ``LogCategory/log(_:type:)``
public func logger(
    _ category: LogCategory,
    message: String,
    type: OSLogType = .debug) {
        category.log(message, type: type)
#if DEBUG
        printOnDebug(category.emojiLabel, type.emojiLabel, "ℹ️ \(message)")
#endif
    }

/// Logs an error using the app’s centralized logging system and prints the localized description
/// to the console in debug builds.
///
/// This convenience function routes error messages to a strongly-typed `LogCategory` category,
/// defaulting to `.general`. It extracts the localized description from the error and logs it
/// at the specified `OSLogType` level, automatically formatting output for Console.app with
/// consistent subsystem and category labeling.
///
/// ## Example
/// ```swift
/// logger(.network, error: someError, type: .error)
/// logger(error: someError) // uses .general and .debug
/// ```
/// - Parameters:
///   - category: The `LogCategory` category to log under.
///   - error: The `Error` instance to log. The localized description will be extracted and logged.
///     Consider redacting sensitive information at the call site if needed.
///   - type: The `OSLogType` severity for the error message. Defaults to `.debug`.
///
/// - Important:
///   - `.debug` and `.info` are not persisted to disk and are best for development-time diagnostics.
///   - `.notice` and higher are persisted and suitable for production telemetry of significant events.
///
/// - SeeAlso: ``LogCategory``, ``logger(_:message:type:)``
public func logger(
    _ category: LogCategory,
    error: any Error,
    type: OSLogType = .debug) {
        logger(
            category,
            message: error.localizedDescription,
            type: type)
    }

//
//  Iso8601.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 10/28/26.
//  Apache License 2.0
//

public import Foundation

/// A namespace for displaying ISO 8601 timestamps, such as the ones a web API returns.
@frozen public enum Iso8601: Sendable {
    
    /// Parses an ISO 8601 timestamp and formats it in the current locale and time zone.
    ///
    /// The timestamp must include a date, a time, and a time zone, such as
    /// `2026-10-28T14:30:00Z` or `2026-10-28T14:30:00-07:00`.
    ///
    /// ## Example
    /// ```swift
    /// // In the United States, on Pacific Time:
    /// Iso8601.string("2026-10-28T14:30:00Z")                    // "October 28, 2026"
    /// Iso8601.string("2026-10-28T14:30:00Z", time: .shortened) // "October 28, 2026 at 7:30 AM"
    /// Iso8601.string("not a date")                              // nil
    /// ```
    ///
    /// - Parameters:
    ///   - iso8601: The ISO 8601 timestamp to parse.
    ///   - date: The style of the date part. Defaults to `.long`.
    ///   - time: The style of the time part. Defaults to `.omitted`.
    ///
    /// - Returns: The formatted date, or `nil`, with a log, when the timestamp doesn't parse.
    public static func string(
        _ iso8601: String,
        date: Date.FormatStyle.DateStyle = .long,
        time: Date.FormatStyle.TimeStyle = .omitted
    ) -> String? {
        guard let converted = try? Date(iso8601, strategy: .iso8601) else {
            logger(.swift, message: "Unable to parse ISO 8601 timestamp: \(iso8601)")
            return nil
        }
        return converted.formatted(date: date, time: time)
    }
}

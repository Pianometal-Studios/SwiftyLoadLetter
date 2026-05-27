//
//  TimeZone.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/15/26.
//  Apache License 2.0
//

import Foundation

public extension Locale {
    
    /// The formatted name of the current time zone.
    ///
    /// This property returns a human-readable version of the time zone identifier with underscores
    /// replaced by spaces and slashes replaced by " - ".
    ///
    /// ## Example
    ///
    /// - `America/New_York` becomes `"America - New York"`
    /// - `Europe/London` becomes `"Europe - London"`
    ///
    /// - Returns: A formatted string representing the current time zone name.
    var timeZoneName: String {
        self.calendar
            .timeZone
            .identifier
            .replacingOccurrences(of: "_", with: " ")
            .replacingOccurrences(of: "/", with: " - ")
    }
    
    /// The abbreviated form of the current time zone.
    ///
    /// This property returns the short abbreviation for the current time zone, such as "PST", "EST", or "GMT".
    ///
    /// ## Example
    ///
    /// ```swift
    /// if let abbreviation = Locale.current.timeZoneAbbreviation {
    ///     print("Current time zone: \(abbreviation)")
    /// }
    /// ```
    ///
    /// - Returns: The time zone abbreviation, or `nil` if the abbreviation cannot be determined.
    ///
    /// - Note: If the time zone abbreviation cannot be retrieved, an error is logged to the system logger.
    var timeZoneAbbreviation: String? {
        guard let abbreviation = calendar.timeZone.abbreviation() else {
            logger(.system, message: "Failed to get time zone abbreviation")
            return nil
        }
        return abbreviation
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI
#Preview {
    NavigationStack {
        List {
            LabeledContent("Name", value: Locale.current.timeZoneName)
            LabeledContent("Abbreviation", value: Locale.current.timeZoneAbbreviation ?? "-")
        }
        .navigationTitle("Time Zone")
    }
}
#endif

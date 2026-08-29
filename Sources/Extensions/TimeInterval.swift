//
//  TimeInterval.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 8/29/26.
//  Apache License 2.0
//

import Foundation

public extension TimeInterval {

    /// The interval formatted as minutes and seconds, useful for displaying multimedia duration lengths.
    ///
    /// ## Example
    ///
    /// ```swift
    /// TimeInterval(272).minuteSecond // "4:32"
    /// ```
    var minuteSecond: String {
        Duration.seconds(self).formatted(.time(pattern: .minuteSecond))
    }
}

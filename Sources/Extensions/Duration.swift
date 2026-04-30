//
//  Duration.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 4/28/26.
//  MIT License
//

import Foundation

public extension Duration {

    /// Converts the duration to a fractional `Double` value representing seconds.
    ///
    /// This property preserves sub-second precision by combining the seconds
    /// and attoseconds components into a single floating-point value. Useful
    /// for numerical calculations, plotting on time axes, or interfacing with
    /// APIs that expect time values as `Double`.
    ///
    /// The computation is marked `@inlinable` for performance in tight loops
    /// and chart rendering scenarios.
    ///
    /// ## Example
    /// ```swift
    /// let duration = Duration.milliseconds(1_250)
    /// duration.seconds              // 1.25
    /// 
    /// Duration.seconds(2).seconds   // 2.0
    /// Duration.nanoseconds(500).seconds // 5e-7
    /// 
    /// // Useful for charts and calculations
    /// let average = durations.map(\.seconds).reduce(0, +) / Double(durations.count)
    /// ```
    ///
    /// - Returns: The duration as a fractional number of seconds.
    ///
    /// - Complexity: O(1)
    @inlinable var seconds: Double {
        let (secs, attos) = components
        return Double(secs) + (Double(attos) * 1e-18)
    }
}

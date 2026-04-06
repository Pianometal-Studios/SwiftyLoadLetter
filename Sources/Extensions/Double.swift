//
//  Double.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/8/26.
//  MIT License
//

import Foundation

public extension Double {
    
    /// Returns the double value formatted as a localized percentage string.
    ///
    /// This method uses the system's current locale to apply appropriate percent
    /// symbols, decimal separators, and grouping. The value is interpreted as a
    /// fractional amount, where `1.0` corresponds to `100%`, `0.25` to `25%`, and so on.
    ///
    /// ## Example
    /// ```swift
    /// let value = 0.123
    /// Text(value.asPercent())  // 12%
    /// Text(value.asPercent(2)) // 12.30%
    /// ```
    ///
    /// - Parameter fractionLength: The exact number of fractional digits to display.
    ///   Defaults to `0`.
    ///
    /// - Returns: A `String` representing the value formatted as a percentage according
    ///   to the current locale with the specified fractional precision.
    ///
    
    func asPercent(_ fractionLength: Int = 0) -> String {
        formatted(.percent.precision(.fractionLength(fractionLength)))
    }
    
    /// Returns the double value formatted as a localized currency string.
    ///
    /// This method formats the receiver using the system's current locale and currency,
    /// falling back to the provided currency identifier when the current locale does not
    /// specify one. The output respects the user's regional settings (such as decimal
    /// separators, grouping, and currency symbol placement).
    ///
    /// Formatting is performed using `Double.formatted(_:)` with a `.currency`
    /// style. The number of fraction digits and symbol presentation are determined by
    /// the current locale and currency.
    ///
    /// ## Example
    /// ```swift
    /// let value = 1234.56
    /// Text(value.currency())      // $1,234.56 (in en_US locale)
    /// Text(value.currency("EUR")) // €1,234.56 (if no currency in locale)
    ///```
    ///
    /// - Parameter identifier: A fallback ISO 4217 currency code (e.g., "USD", "EUR") used
    ///   when `Locale.current.currency` is unavailable. Defaults to "USD".
    ///
    /// - Returns: A `String` representing the value formatted as currency, according to
    ///   the current locale and resolved currency code.
    ///
    
    func currency(_ identifier: String = "USD") -> String {
        guard let code = Locale.current.currency?.identifier else {
            printOnDebug("Cannot resolve currency code from current locale. Using fallback: \(identifier)")
            return self.formatted(.currency(code: identifier))
        }
        return self.formatted(.currency(code: code))
    }
    
    /// Indicates whether the double represents a finite, non-NaN number.
    ///
    /// Checks that the value is not NaN, not infinite, and not a signaling NaN.
    ///
    /// Use this to validate inputs before numerical operations that require well-defined,
    /// finite values.
    ///
    /// - Returns: `true` if the value is a valid finite number; otherwise, `false`.
    ///
    
    var isValid: Bool {
        !self.isNaN &&
        !self.isInfinite &&
        !self.isSignalingNaN
    }
    
    /// Interprets the value as a whole-number percentage and converts it to its fractional form.
    ///
    /// This property divides the receiver by 100. For example, `25.percentage` yields `0.25`,
    /// which is useful when a percentage expressed as a whole number must be used in
    /// calculations that expect a fractional rate.
    ///
    /// ## Example
    /// ```swift
    /// let value = 25.0
    /// Text(value.percentage)             // 0.25
    /// Text(value.percentage.asPercent()) // 25%
    /// ```
    ///
    /// - Returns: The receiver divided by 100, converting a whole-number percentage
    ///   into a fractional value.
    ///
    /// - Note: This does not format the value as a percent string. For localized percent
    ///   formatting, use `asPercent(_:)`
    ///
    /// - SeeAlso: `asPercent(_:)`
    ///
    
    var percentage: Self {
        self / 100
    }
    
    /// Converts a fractional value (0.0–1.0) to a `PressureLevel` using predefined thresholds.
    var pressureLevel: PressureLevel {
        switch self {
        case ...0.59:            .normal
        case 0.59.nextUp...0.79: .warning
        case 0.79.nextUp...:     .critical
        default:                 .unknown
        }
    }
}

//
//  NumberFormatter.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 6/3/26.
//  Apache License 2.0
//

import Foundation

public extension NumberFormatter {
    
    /// A style format in which numbers are spelled out in the language defined by the number formatter locale.
    ///
    /// For example, in the `en_US` locale, the number 1234.5678 is represented as one thousand two hundred thirty-four
    /// point five six seven eight; in the `fr_FR` locale, the number 1234.5678 is represented as mille deux cent trente-quatre
    /// virgule cinq six sept huit.
    ///
    /// This style is supported for most user locales. If this style doesn’t support the number formatter locale, the `en_US`
    /// locale is used as a fallback.
    static let spellOut: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter
    }()
}

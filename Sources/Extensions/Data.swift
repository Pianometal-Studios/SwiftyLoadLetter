//
//  Data.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 4/11/26.
//  MIT License
//

import Foundation

public extension Data {
    
    /// Convert raw data bytes to a hex string for display.
    ///
    /// Each byte is represented as a two-digit hexadecimal number, separated by spaces.
    ///
    /// A Data object containing the bytes [0x01, 0xA4, 0xFF] would be converted to the string "01 A4 FF".
    ///
    /// - Note: This is useful for debugging and displaying BLE characteristic values in a
    ///   human-readable format.
    var hexString: String {
        map { String(format: "%02X", $0) }.joined(separator: " ")
    }
}

//
//  FourCharCode.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 10/28/26.
//  Apache License 2.0
//

public import Foundation

public extension FourCharCode {
    
    /// The four-character string a `FourCharCode` encodes, such as a codec or pixel format.
    ///
    /// Each byte, most significant first, becomes one character, and the string ends at the
    /// first zero byte.
    ///
    /// ## Example
    /// ```swift
    /// let code: FourCharCode = 0x34323076
    /// Text(code.fourCharCode) // "420v"
    /// ```
    ///
    /// - Note: `FourCharCode` is a type alias for `UInt32`, so this property is available on
    ///   every `UInt32`.
    var fourCharCode: String {
        let bytes: [UInt8] = [
            UInt8((self >> 24) & 0xff),
            UInt8((self >> 16) & 0xff),
            UInt8((self >> 8) & 0xff),
            UInt8(self & 0xff)
        ]
        return String(decoding: bytes.prefix { $0 != 0 }, as: UTF8.self)
    }
}

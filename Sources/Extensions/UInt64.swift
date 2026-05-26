//
//  UInt64.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 4/6/26.
//  Apache License 2.0
//

public extension UInt64 {
    
    /// Converts a `UInt64` byte count to an `Int64` suitable for `ByteCountFormatter`.
    ///
    /// - Returns: An `Int64` with the same bit pattern as the original `UInt64`.
    var toByteCount: Int64 {
        .init(bitPattern: self)
    }
}

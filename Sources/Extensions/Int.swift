//
//  Int.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 4/11/26.
//  MIT License
//

import Foundation

public extension Int {
    
    /// - Returns: `SignalQuality` estimate derived from an RSSI value, using standard Bluetooth thresholds.
    var bluetoothSignalQuality: SignalQuality {
        switch self {
        case Int(-60)...:   .excellent
        case -70 ..< -60:   .good
        case -80 ..< -70:   .fair
        default:            .poor
        }
    }
}

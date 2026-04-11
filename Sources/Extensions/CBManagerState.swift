//
//  CBManagerState.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 4/11/26.
//  MIT License
//

import Foundation
import CoreBluetooth

public extension CBManagerState {
    
    var details: String {
        switch self {
        case .unknown:
            "The state of the Bluetooth manager is unknown."
        case .resetting:
            "The Bluetooth manager is resetting; a state update is pending."
        case .unsupported:
            "The platform doesn't support Bluetooth Low Energy."
        case .unauthorized:
            "The app is not authorized to use Bluetooth Low Energy."
        case .poweredOff:
            "Bluetooth is currently powered off."
        case .poweredOn:
            "Bluetooth is currently powered on and available to use."
        @unknown default:
            "The state of the Bluetooth manager is undefined."
        }
    }
    
    var icon: String {
        switch self {
        case .unknown:      "questionmark.circle"
        case .resetting:    "arrow.triangle.2.circlepath.circle"
        case .unsupported:  "xmark.octagon"
        case .unauthorized: "lock.shield"
        case .poweredOff:   "poweroff"
        case .poweredOn:    "power"
        @unknown default:   "questionmark.square"
        }
    }
    
    var name: String {
        switch self {
        case .unknown:       "Unknown"
        case .resetting:     "Resetting"
        case .unsupported:   "Unsupported"
        case .unauthorized:  "Unauthorized"
        case .poweredOff:    "Powered Off"
        case .poweredOn:     "Powered On"
        @unknown default:    "Undefined"
        }
    }
    
    /// An array of all valid `CBManagerState` cases, sorted by the rawValue order defined in CoreBluetooth.
    ///
    /// - Returns: [.unknown, .resetting, .unsupported, .unauthorized, .poweredOff, .poweredOn]
    static let allCases: [CBManagerState] = [
        .unknown,
        .resetting,
        .unsupported,
        .unauthorized,
        .poweredOff,
        .poweredOn
    ]
}

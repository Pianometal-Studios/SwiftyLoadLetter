//
//  MemoryPressureEvent.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 4/6/26.
//  Apache License 2.0
//

import Foundation
public import Dispatch

public extension DispatchSource.MemoryPressureEvent {
    
    /// Converts a `DispatchSource.MemoryPressureEvent` to a `PressureLevel`.
    ///
    /// - Returns: The corresponding `PressureLevel` for the event.
    var pressureLevel: PressureLevel {
        switch self {
        case .normal:   .normal
        case .warning:  .warning
        case .critical: .critical
        default:        .unknown
        }
    }
}

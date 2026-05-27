//
//  MemoryPressureEvent.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 4/6/26.
//  Apache License 2.0
//

import Foundation
import Dispatch

public extension DispatchSource.MemoryPressureEvent {
    
    /// Converts a `DispatchSource.MemoryPressureEvent` to a `MemoryPressureLevel`.
    ///
    /// - Returns: The corresponding `MemoryPressureLevel` for the event.
    var pressureLevel: PressureLevel {
        switch self {
        case .normal:   .normal
        case .warning:  .warning
        case .critical: .critical
        default:        .unknown
        }
    }
}

//
//  URLError.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 6/30/26.
//  Apache License 2.0
//

public import Foundation

public extension URLError {
    
    /// Determines whether this error indicates the device has no usable network path, as
    /// opposed to a transient API hiccup worth retrying.
    var indicatesNoConnectivity: Bool {
        switch code {
        case .notConnectedToInternet, .networkConnectionLost, .cannotConnectToHost, .cannotFindHost, .timedOut:
            true
        default:
            false
        }
    }
}

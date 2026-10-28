//
//  NWError.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 10/28/26.
//  Apache License 2.0
//

public import Network

public extension NWError {
    
    /// Determines whether this error means the app has been denied Local Network access.
    ///
    /// An `NWBrowser` or `NWListener` reports this error when Local Network access is off for
    /// the app.
    ///
    /// - Returns: `true` for a `.dns` error carrying `kDNSServiceErr_PolicyDenied` (`-65570`);
    ///   otherwise `false`.
    ///
    /// - SeeAlso: `NWPath.isLocalNetworkDenied`, for the same answer from a path.
    var isLocalNetworkPolicyDenial: Bool {
        if case .dns(let code) = self {
            code == Self.policyDeniedCode
        } else {
            false
        }
    }
}

private extension NWError {
    
    /// `kDNSServiceErr_PolicyDenied`, spelled as its value so the `dnssd` module isn't needed.
    static let policyDeniedCode: Int32 = -65_570
}

import Testing
import Foundation
import Network
@testable import SwiftyLoadLetter

/// Tests for the `NWError.isLocalNetworkPolicyDenial` classifier.
@Suite("NWError") struct NWErrorTests {

    @Test("The DNS policy-denied error is a Local Network denial")
    func policyDenied() {
        #expect(NWError.dns(-65_570).isLocalNetworkPolicyDenial)
    }

    @Test("Other DNS errors are not a Local Network denial", arguments: [Int32(-65_537), -65_554, 0])
    func otherDNSErrors(code: Int32) {
        #expect(!NWError.dns(code).isLocalNetworkPolicyDenial)
    }

    @Test("POSIX errors are not a Local Network denial")
    func posixError() {
        #expect(!NWError.posix(.ECONNREFUSED).isLocalNetworkPolicyDenial)
    }
}

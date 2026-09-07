import Testing
import Network
import SwiftUI
@testable import SwiftyLoadLetter

/// Tests for `NWPath.UnsatisfiedReason.color`, which tracks `hasReason` so that
/// actionable causes read as an alert and the absence of a reason does not.
@Suite("NWPath.UnsatisfiedReason") struct UnsatisfiedReasonTests {

    @Test("color tracks hasReason for every listed case")
    func colorTracksHasReason() {
        for reason in NWPath.UnsatisfiedReason.allCases {
            #expect(reason.color == (reason.hasReason ? Color.red : Color.gray))
        }
    }

    @Test("Actionable reasons are red")
    func actionableReasonsAreRed() {
        let actionable: [NWPath.UnsatisfiedReason] = [
            .cellularDenied,
            .localNetworkDenied,
            .vpnInactive,
            .wifiDenied
        ]
        for reason in actionable {
            #expect(reason.hasReason)
            #expect(reason.color == .red)
        }
    }

    @Test(".notAvailable carries no reason and reads as gray")
    func notAvailableIsGray() {
        #expect(!NWPath.UnsatisfiedReason.notAvailable.hasReason)
        #expect(NWPath.UnsatisfiedReason.notAvailable.color == .gray)
    }
}

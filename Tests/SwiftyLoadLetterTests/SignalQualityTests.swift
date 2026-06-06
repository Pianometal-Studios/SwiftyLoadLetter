import Testing
@testable import SwiftyLoadLetter

/// Tests for the `SignalQuality` enum and its strength ordering.
@Suite("SignalQuality") struct SignalQualityTests {

    @Test("Raw value round-trips", arguments: SignalQuality.allCases)
    func rawValueRoundTrips(quality: SignalQuality) {
        #expect(SignalQuality(rawValue: quality.rawValue) == quality)
    }

    @Test("Sorts ascending by strength")
    func sorting() {
        #expect(SignalQuality.allCases.sorted() == [.poor, .fair, .good, .excellent])
    }

    @Test("Comparable orders by strength")
    func comparable() {
        #expect(SignalQuality.poor < SignalQuality.excellent)
        #expect(SignalQuality.fair < SignalQuality.good)
    }

    @Test("Valid range spans one through the case count")
    func range() {
        #expect(SignalQuality.range == 1...4)
    }
}

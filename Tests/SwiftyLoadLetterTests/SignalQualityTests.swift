import Testing
@testable import SwiftyLoadLetter

/// Tests for the `SignalQuality` enum and its strength ordering.
@Suite("SignalQuality") struct SignalQualityTests {

    @Test("Has four levels")
    func caseCount() {
        #expect(SignalQuality.allCases.count == 4)
    }

    @Test("Every level has a non-empty name and icon", arguments: SignalQuality.allCases)
    func metadataPresent(quality: SignalQuality) {
        #expect(!quality.name.isEmpty)
        #expect(!quality.icon.isEmpty)
    }

    @Test("Raw value round-trips", arguments: SignalQuality.allCases)
    func rawValueRoundTrips(quality: SignalQuality) {
        #expect(SignalQuality(rawValue: quality.rawValue) == quality)
    }

    @Test("Strength descends from excellent to poor", arguments: [
        (SignalQuality.excellent, 4),
        (.good, 3),
        (.fair, 2),
        (.poor, 1)
    ])
    func strength(quality: SignalQuality, expected: Int) {
        #expect(quality.strength == expected)
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

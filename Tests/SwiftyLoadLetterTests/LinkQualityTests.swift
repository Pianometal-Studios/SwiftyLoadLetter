import Testing
import Network
@testable import SwiftyLoadLetter

/// Tests for `NWPath.LinkQuality.percentage`, the 0–100 gauge value that drives
/// progress-style presentations of link strength.
@Suite("NWPath.LinkQuality") struct LinkQualityTests {

    @Test("percentage descends from best to worst quality")
    func percentageOrdering() {
        let values = NWPath.LinkQuality.allCases.map(\.percentage)
        #expect(values == [100, 67, 33, 0])
        #expect(values == values.sorted(by: >))
    }

    @Test("percentage stays within the 0...100 scale")
    func percentageBounds() {
        for quality in NWPath.LinkQuality.allCases {
            #expect((0...100).contains(quality.percentage))
        }
    }

    @Test("percentage matches the gauge each icon depicts")
    func percentageMatchesIcon() {
        #expect(NWPath.LinkQuality.good.percentage == 100)
        #expect(NWPath.LinkQuality.moderate.percentage == 67)
        #expect(NWPath.LinkQuality.minimal.percentage == 33)
        #expect(NWPath.LinkQuality.unknown.percentage == 0)
    }
}

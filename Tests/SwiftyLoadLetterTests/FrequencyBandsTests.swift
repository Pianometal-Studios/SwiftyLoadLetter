import Testing
@testable import SwiftyLoadLetter

/// Tests for the `FrequencyBands` enum and its Wi-Fi band characteristics.
@Suite("FrequencyBands") struct FrequencyBandsTests {

    @Test("Has three bands")
    func caseCount() {
        #expect(FrequencyBands.allCases.count == 3)
    }

    @Test("Every band has a non-empty name, icon, and details", arguments: FrequencyBands.allCases)
    func metadataPresent(band: FrequencyBands) {
        #expect(!band.name.isEmpty)
        #expect(!band.icon.isEmpty)
        #expect(!band.details.isEmpty)
    }

    @Test("Frequency matches the band", arguments: [
        (FrequencyBands.twoFour, 2.4),
        (.fiveZero, 5.0),
        (.sixZero, 6.0)
    ])
    func frequency(band: FrequencyBands, expected: Double) {
        #expect(band.frequency == expected)
    }

    @Test("Names are suffixed with GHz", arguments: FrequencyBands.allCases)
    func nameSuffix(band: FrequencyBands) {
        #expect(band.name.hasSuffix("GHz"))
    }

    @Test("5.0 and 6.0 GHz are high speed; 2.4 GHz is not")
    func highSpeed() {
        #expect(FrequencyBands.fiveZero.isHighSpeed)
        #expect(FrequencyBands.sixZero.isHighSpeed)
        #expect(!FrequencyBands.twoFour.isHighSpeed)
    }

    @Test("Only 6.0 GHz is low latency")
    func lowLatency() {
        #expect(FrequencyBands.sixZero.isLowLatency)
        #expect(!FrequencyBands.fiveZero.isLowLatency)
        #expect(!FrequencyBands.twoFour.isLowLatency)
    }

    @Test("Range quality degrades as frequency rises", arguments: [
        (FrequencyBands.twoFour, "Good"),
        (.fiveZero, "Moderate"),
        (.sixZero, "Minimal")
    ])
    func rangeQuality(band: FrequencyBands, expected: String) {
        #expect(band.rangeQuality.name == expected)
    }
}

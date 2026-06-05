import Testing
import Network
@testable import SwiftyLoadLetter

/// Tests for the `NWInterface.RadioType.Cellular.NewRadio5GVariant` metadata extensions.
@Suite("NWInterface.RadioType.Cellular.NewRadio5GVariant") struct CellularNewRadio5GVariantTests {

    typealias Variant = NWInterface.RadioType.Cellular.NewRadio5GVariant

    @Test("Has two variants")
    func caseCount() {
        #expect(Variant.allCases.count == 2)
    }

    @Test("Every variant has non-empty metadata")
    func metadataPresent() {
        for variant in Variant.allCases {
            #expect(!variant.name.isEmpty)
            #expect(!variant.icon.isEmpty)
            #expect(!variant.details.isEmpty)
        }
    }

    @Test("Display names are Sub-6 GHz and mmWave")
    func names() {
        #expect(Variant.sub6GHz.name == "Sub-6 GHz")
        #expect(Variant.mmWave.name == "mmWave")
    }

    @Test("mmWave is high speed and low latency; sub-6 GHz is neither")
    func performanceFlags() {
        #expect(Variant.mmWave.isHighSpeed)
        #expect(Variant.mmWave.isLowLatency)
        #expect(!Variant.sub6GHz.isHighSpeed)
        #expect(!Variant.sub6GHz.isLowLatency)
    }

    @Test("sub-6 GHz penetrates better than mmWave")
    func penetration() {
        #expect(Variant.sub6GHz.penetrationLevel == .good)
        #expect(Variant.mmWave.penetrationLevel == .poor)
    }

    @Test("Range quality: sub-6 GHz is good, mmWave is minimal")
    func rangeQuality() {
        #expect(Variant.sub6GHz.rangeQuality.name == "Good")
        #expect(Variant.mmWave.rangeQuality.name == "Minimal")
    }
}

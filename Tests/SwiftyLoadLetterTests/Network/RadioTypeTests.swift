import Testing
import Network
@testable import SwiftyLoadLetter

/// Tests for the top-level `NWInterface.RadioType` extensions, which delegate
/// to their wrapped `Cellular` and `WiFi` values.
@Suite("NWInterface.RadioType") struct RadioTypeTests {

    @Test("allCases combines all cellular and Wi-Fi cases")
    func caseCount() {
        let expected = NWInterface.RadioType.Cellular.allCases.count
            + NWInterface.RadioType.WiFi.allCases.count
        #expect(NWInterface.RadioType.allCases.count == expected)
    }

    @Test("Every case has a non-empty name and icon")
    func metadataPresent() {
        for type in NWInterface.RadioType.allCases {
            #expect(!type.name.isEmpty)
            #expect(!type.icon.isEmpty)
        }
    }

    @Test("Cellular cases classify as cellular, not Wi-Fi")
    func cellularClassification() {
        let lte = NWInterface.RadioType.cell(.lte)
        #expect(lte.isCellular)
        #expect(!lte.isWifi)
        #expect(!lte.is5G)
    }

    @Test("Wi-Fi cases classify as Wi-Fi, not cellular")
    func wifiClassification() {
        let ax = NWInterface.RadioType.wifi(.ax)
        #expect(ax.isWifi)
        #expect(!ax.isCellular)
        #expect(!ax.is5G)
    }

    @Test("5G cellular cases report is5G")
    func fiveGClassification() {
        let standalone = NWInterface.RadioType.cell(.standalone5G(.mmWave))
        #expect(standalone.is5G)
        #expect(standalone.isCellular)
    }

    @Test("name and icon delegate to the wrapped radio type")
    func delegation() {
        #expect(NWInterface.RadioType.cell(.lte).name == "LTE")
        #expect(NWInterface.RadioType.wifi(.ax).name == "802.11ax")
    }
}

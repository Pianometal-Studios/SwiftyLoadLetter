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
}

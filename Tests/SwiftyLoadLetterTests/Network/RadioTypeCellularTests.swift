import Testing
import Network
@testable import SwiftyLoadLetter

/// Tests for the `NWInterface.RadioType.Cellular` metadata extensions.
@Suite("NWInterface.RadioType.Cellular") struct RadioTypeCellularTests {

    @Test("Has nine representative cases")
    func caseCount() {
        #expect(NWInterface.RadioType.Cellular.allCases.count == 9)
    }

    @Test("Every case has a non-empty name, icon, and details")
    func metadataPresent() {
        for type in NWInterface.RadioType.Cellular.allCases {
            #expect(!type.name.isEmpty)
            #expect(!type.icon.isEmpty)
            #expect(!type.details.isEmpty)
        }
    }

    @Test("Acronyms map to expected display names")
    func names() {
        #expect(NWInterface.RadioType.Cellular.lte.name == "LTE")
        #expect(NWInterface.RadioType.Cellular.gsm.name == "GSM")
        #expect(NWInterface.RadioType.Cellular.evdo.name == "EV-DO")
    }

    @Test("Only 5G variants report is5G")
    func is5G() {
        #expect(NWInterface.RadioType.Cellular.gsm.is5G == false)
        #expect(NWInterface.RadioType.Cellular.lte.is5G == false)
        #expect(NWInterface.RadioType.Cellular.standalone5G(.sub6GHz).is5G)
        #expect(NWInterface.RadioType.Cellular.dualConnectivity5G(.mmWave).is5G)
    }

    @Test("5G uses the cellularbars icon; legacy uses the antenna icon")
    func icon() {
        #expect(NWInterface.RadioType.Cellular.lte.icon == "antenna.radiowaves.left.and.right")
        #expect(NWInterface.RadioType.Cellular.standalone5G(.mmWave).icon == "cellularbars")
    }
}

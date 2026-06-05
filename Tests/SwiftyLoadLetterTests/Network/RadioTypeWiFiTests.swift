import Testing
import Network
@testable import SwiftyLoadLetter

/// Tests for the `NWInterface.RadioType.WiFi` metadata extensions.
@Suite("NWInterface.RadioType.WiFi") struct RadioTypeWiFiTests {

    @Test("Has six standards")
    func caseCount() {
        #expect(NWInterface.RadioType.WiFi.allCases.count == 6)
    }

    @Test("Every standard has a non-empty name and the wifi icon")
    func metadataPresent() {
        for type in NWInterface.RadioType.WiFi.allCases {
            #expect(!type.name.isEmpty)
            #expect(type.icon == "wifi")
        }
    }

    @Test("Names follow the 802.11 convention")
    func names() {
        #expect(NWInterface.RadioType.WiFi.a.name == "802.11a")
        #expect(NWInterface.RadioType.WiFi.ax.name == "802.11ax")
    }

    @Test("Generation maps to the Wi-Fi number")
    func generation() {
        #expect(NWInterface.RadioType.WiFi.b.generation == 1)
        #expect(NWInterface.RadioType.WiFi.ac.generation == 5)
        #expect(NWInterface.RadioType.WiFi.ax.generation == 6)
    }

    @Test("Max speed grows with generation")
    func maxSpeed() {
        #expect(NWInterface.RadioType.WiFi.b.maxSpeed == 11)
        #expect(NWInterface.RadioType.WiFi.ax.maxSpeed == 9_600)
    }

    @Test("Frequency bands match the standard")
    func frequencyBands() {
        #expect(NWInterface.RadioType.WiFi.b.frequencyBands == [.twoFour])
        #expect(NWInterface.RadioType.WiFi.ax.frequencyBands.count == 3)
    }
}

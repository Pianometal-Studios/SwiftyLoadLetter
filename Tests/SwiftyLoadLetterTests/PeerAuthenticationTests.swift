import Testing
import Network
import SwiftUI
@testable import SwiftyLoadLetter

/// Tests for the `DTLS.PeerAuthentication` metadata, which turns a handshake preference
/// into something a settings row can render.
@Suite("DTLS.PeerAuthentication") struct PeerAuthenticationTests {

    @Test("allCases runs from the strictest preference to the most permissive")
    func allCasesIsOrderedByStrictness() {
        #expect(DTLS.PeerAuthentication.allCases == [.required, .optional, .none])
    }

    @Test("Every case has a name, an icon and details")
    func everyCaseIsDescribed() {
        for preference in DTLS.PeerAuthentication.allCases {
            #expect(!preference.name.isEmpty)
            #expect(!preference.icon.isEmpty)
            #expect(!preference.details.isEmpty)
            #expect(preference.name != "Undefined")
        }
    }

    @Test("Colors grade from red at none to green at required")
    func colorsGradeByStrictness() {
        #expect(DTLS.PeerAuthentication.none.color == .red)
        #expect(DTLS.PeerAuthentication.optional.color == .orange)
        #expect(DTLS.PeerAuthentication.required.color == .green)
    }

    @Test("Names read as the SDK spells them")
    func namesMatchTheSDK() {
        #expect(DTLS.PeerAuthentication.none.name == "None")
        #expect(DTLS.PeerAuthentication.optional.name == "Optional")
        #expect(DTLS.PeerAuthentication.required.name == "Required")
    }

    @Test("The companion objects carry the same metadata")
    func companionObjectsMatch() {
        for preference in DTLS.PeerAuthentication.allCases {
            #expect(preference.iconableObject.name == preference.name)
            #expect(preference.iconableObject.icon == preference.icon)
            #expect(preference.describableObject.details == preference.details)
        }
    }
}

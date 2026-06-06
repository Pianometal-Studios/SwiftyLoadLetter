import Testing
import SwiftUI
@testable import SwiftyLoadLetter

/// Tests for the `CommonAction` enum and its icon, name, and role mappings.
@Suite("CommonAction") struct CommonActionTests {

    @Test("Raw value round-trips", arguments: CommonAction.allCases)
    func rawValueRoundTrips(action: CommonAction) {
        #expect(CommonAction(rawValue: action.rawValue) == action)
    }

    @Test("Encodes and decodes round-trip", arguments: CommonAction.allCases)
    func codableRoundTrip(action: CommonAction) throws {
        let data = try JSONEncoder().encode(action)
        let decoded = try JSONDecoder().decode(CommonAction.self, from: data)
        #expect(decoded == action)
    }
}

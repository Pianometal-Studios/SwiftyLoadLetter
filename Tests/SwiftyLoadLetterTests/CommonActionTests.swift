import Testing
import SwiftUI
@testable import SwiftyLoadLetter

/// Tests for the `CommonAction` enum and its icon, name, and role mappings.
@Suite("CommonAction") struct CommonActionTests {

    @Test("Has fifteen cases")
    func caseCount() {
        #expect(CommonAction.allCases.count == 15)
    }

    @Test("Every case has a non-empty name and icon", arguments: CommonAction.allCases)
    func metadataPresent(action: CommonAction) {
        #expect(!action.name.isEmpty)
        #expect(!action.icon.isEmpty)
    }

    @Test("Raw value round-trips", arguments: CommonAction.allCases)
    func rawValueRoundTrips(action: CommonAction) {
        #expect(CommonAction(rawValue: action.rawValue) == action)
    }

    @Test("Names match expected values", arguments: [
        (CommonAction.add, "Add"),
        (.delete, "Delete"),
        (.settings, "Settings"),
        (.stop, "Stop")
    ])
    func names(action: CommonAction, expected: String) {
        #expect(action.name == expected)
    }

    @Test("Destructive actions carry the destructive role", arguments: [
        CommonAction.delete, .reset, .stop
    ])
    func destructiveRole(action: CommonAction) {
        #expect(action.role == .destructive)
    }

    @Test("Confirming actions carry the confirm role", arguments: [
        CommonAction.confirm, .save
    ])
    func confirmRole(action: CommonAction) {
        #expect(action.role == .confirm)
    }

    @Test("Cancel and close carry their matching roles")
    func cancelAndCloseRoles() {
        #expect(CommonAction.cancel.role == .cancel)
        #expect(CommonAction.close.role == .close)
    }

    @Test("Non-role actions have no button role", arguments: [
        CommonAction.add, .debug, .edit, .filter, .help, .info, .settings, .sort
    ])
    func noRole(action: CommonAction) {
        #expect(action.role == nil)
    }

    @Test("Encodes and decodes round-trip", arguments: CommonAction.allCases)
    func codableRoundTrip(action: CommonAction) throws {
        let data = try JSONEncoder().encode(action)
        let decoded = try JSONDecoder().decode(CommonAction.self, from: data)
        #expect(decoded == action)
    }
}

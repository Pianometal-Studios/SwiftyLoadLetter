import Testing
import SwiftUI
@testable import SwiftyLoadLetter

/// Tests for the `CommonAction` enum and its raw-value and `Codable` round-trips.
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

    @Test("Input labels start with the name and hold no duplicates", arguments: CommonAction.allCases)
    func inputLabelsStartWithName(action: CommonAction) {
        let labels = action.accessibilityInputLabels
        #expect(labels.first == action.name)
        #expect(Set(labels).count == labels.count)
    }

    @Test("Input labels include synonyms", arguments: [
        (CommonAction.delete, "Trash"),
        (CommonAction.close, "Dismiss"),
        (CommonAction.settings, "Preferences"),
        (CommonAction.signOut, "Log Out")
    ])
    func inputLabelsIncludeSynonyms(action: CommonAction, synonym: String) {
        #expect(action.accessibilityInputLabels.contains(synonym))
    }

    @Test("No spoken synonym is another action's name")
    func synonymsDoNotShadowNames() {
        let names = Set(CommonAction.allCases.map(\.name))
        for action in CommonAction.allCases {
            for synonym in action.accessibilityInputLabels.dropFirst() {
                #expect(!names.contains(synonym), "\(action) says \(synonym)")
            }
        }
    }

    @Test("Every action has a unique name")
    func uniqueNames() {
        #expect(Set(CommonAction.allCases.map(\.name)).count == CommonAction.allCases.count)
    }

    @Test("Destructive actions are red", arguments: [CommonAction.delete, .remove, .reset, .stop, .signOut])
    func destructiveActionsAreRed(action: CommonAction) {
        #expect(action.color == .red)
    }

    @Test("Toolbar placement matches the semantic placement")
    func toolbarPlacement() {
        func describe(_ placement: ToolbarItemPlacement) -> String {
            String(describing: placement)
        }
        #expect(describe(CommonAction.delete.toolbarItemPlacement) == describe(.destructiveAction))
        #expect(describe(CommonAction.cancel.toolbarItemPlacement) == describe(.cancellationAction))
        #expect(describe(CommonAction.back.toolbarItemPlacement) == describe(.cancellationAction))
        #expect(describe(CommonAction.save.toolbarItemPlacement) == describe(.confirmationAction))
        #expect(describe(CommonAction.done.toolbarItemPlacement) == describe(.confirmationAction))
        #expect(describe(CommonAction.notNow.toolbarItemPlacement) == describe(.cancellationAction))
        #expect(describe(CommonAction.add.toolbarItemPlacement) == describe(.automatic))
        #expect(describe(.destructiveAction) != describe(.confirmationAction))
    }
}

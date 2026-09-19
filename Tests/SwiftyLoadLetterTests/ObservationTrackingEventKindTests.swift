import Testing
import Observation
import SwiftUI
@testable import SwiftyLoadLetter

/// Tests for the `ObservationTracking.Event.Kind` metadata. The type is a struct of static
/// properties rather than an enum, so `allCases` is hand-written and has to be checked.
@Suite("ObservationTracking.Event.Kind") struct ObservationTrackingEventKindTests {

    @Test("allCases follows an object's lifetime")
    func allCasesFollowsTheLifetime() {
        #expect(ObservationTracking.Event.Kind.allCases == [.initial, .willSet, .didSet, .`deinit`])
    }

    @Test("Every kind has a name, an icon and details")
    func everyKindIsDescribed() {
        for kind in ObservationTracking.Event.Kind.allCases {
            #expect(!kind.name.isEmpty)
            #expect(!kind.icon.isEmpty)
            #expect(!kind.details.isEmpty)
            #expect(kind.name != "Undefined")
        }
    }

    @Test("Names read as the SDK spells them")
    func namesMatchTheSDK() {
        #expect(ObservationTracking.Event.Kind.initial.name == "Initial")
        #expect(ObservationTracking.Event.Kind.willSet.name == "Will Set")
        #expect(ObservationTracking.Event.Kind.didSet.name == "Did Set")
        #expect(ObservationTracking.Event.Kind.`deinit`.name == "Deinit")
    }

    @Test("A mutation reads as a change and deinit reads as a loss")
    func colorsSeparateMutationFromLoss() {
        #expect(ObservationTracking.Event.Kind.willSet.color == .orange)
        #expect(ObservationTracking.Event.Kind.didSet.color == .green)
        #expect(ObservationTracking.Event.Kind.`deinit`.color == .red)
    }

    @Test("Each kind has a distinct icon")
    func iconsAreDistinct() {
        let icons = ObservationTracking.Event.Kind.allCases.map(\.icon)
        #expect(Set(icons).count == icons.count)
    }

    @Test("The companion objects carry the same metadata")
    func companionObjectsMatch() {
        for kind in ObservationTracking.Event.Kind.allCases {
            #expect(kind.iconableObject.name == kind.name)
            #expect(kind.iconableObject.icon == kind.icon)
            #expect(kind.describableObject.details == kind.details)
        }
    }
}

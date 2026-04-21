import Testing
import Foundation
@testable import SwiftyLoadLetter

/// Tests for `PersonNameComponent` extensions that extract components from `PersonNameComponents`.
@Suite("PersonNameComponent") struct PersonNameComponentTests {

    private var components: PersonNameComponents {
        PersonNameComponents(
            namePrefix: "Dr.",
            givenName: "Ava",
            middleName: "Marie",
            familyName: "Nguyen",
            nameSuffix: "III",
            nickname: "Avie")
    }

    @Test("value(from:) extracts each component correctly")
    func valueExtracts() {
        #expect(PersonNameComponent.namePrefix.value(from: components) == "Dr.")
        #expect(PersonNameComponent.givenName.value(from: components) == "Ava")
        #expect(PersonNameComponent.middleName.value(from: components) == "Marie")
        #expect(PersonNameComponent.familyName.value(from: components) == "Nguyen")
        #expect(PersonNameComponent.nameSuffix.value(from: components) == "III")
        #expect(PersonNameComponent.nickname.value(from: components) == "Avie")
    }

    @Test("value(from:) returns nil for missing components")
    func valueMissingComponent() {
        let minimal = PersonNameComponents(givenName: "Kyle")
        #expect(PersonNameComponent.namePrefix.value(from: minimal) == nil)
        #expect(PersonNameComponent.middleName.value(from: minimal) == nil)
        #expect(PersonNameComponent.familyName.value(from: minimal) == nil)
        #expect(PersonNameComponent.nameSuffix.value(from: minimal) == nil)
        #expect(PersonNameComponent.nickname.value(from: minimal) == nil)
    }
}

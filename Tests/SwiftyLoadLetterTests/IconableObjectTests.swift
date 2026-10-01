import Testing
import Foundation
@testable import SwiftyLoadLetter

/// Tests for `IconableObject`'s identity, which comes from its name and icon.
@Suite("IconableObject") struct IconableObjectTests {

    @Test("objects built from the same name and icon are equal and share an id")
    func sameContentIsEqual() {
        let first = IconableObject("Home", icon: "house")
        let second = IconableObject("Home", icon: "house")
        #expect(first == second)
        #expect(first.id == second.id)
        #expect(first.hashValue == second.hashValue)
    }

    @Test("a different name or icon is a different object")
    func differentContentDiffers() {
        let home = IconableObject("Home", icon: "house")
        let filled = IconableObject("Home", icon: "house.fill")
        let renamed = IconableObject("House", icon: "house")
        #expect(home != filled)
        #expect(home != renamed)
        #expect(home.id != filled.id)
        #expect(home.id != renamed.id)
    }

    @Test("a set keeps one of each name and icon pair")
    func setCollapsesDuplicates() {
        let objects: Set<IconableObject> = [
            IconableObject("Home", icon: "house"),
            IconableObject("Home", icon: "house"),
            IconableObject("Search", icon: "magnifyingglass")
        ]
        #expect(objects.count == 2)
    }

    @Test("an adapter returns an equal object on every access")
    func adapterIsStable() {
        #expect(true.iconableObject == true.iconableObject)
        #expect(true.iconableObject != false.iconableObject)
    }

    @Test("decoding derives the id from the name and icon, whatever the payload says")
    func decodingDerivesID() throws {
        let payload = Data(#"{"id":"0B9D4E2A-5C1F-4E7B-9A3D-1F2E3D4C5B6A","name":"Home","icon":"house"}"#.utf8)
        let decoded = try JSONDecoder().decode(IconableObject.self, from: payload)
        #expect(decoded == IconableObject("Home", icon: "house"))
    }

    @Test("an encode and decode round trip keeps the object equal")
    func roundTrip() throws {
        let home = IconableObject("Home", icon: "house")
        let data = try JSONEncoder().encode(home)
        #expect(try JSONDecoder().decode(IconableObject.self, from: data) == home)
    }

    @Test("decoding fails when the icon is missing")
    func decodingRequiresIcon() {
        let payload = Data(#"{"name":"Home"}"#.utf8)
        #expect(throws: DecodingError.self) {
            try JSONDecoder().decode(IconableObject.self, from: payload)
        }
    }
}

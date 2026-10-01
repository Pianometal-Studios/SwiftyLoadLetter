import Testing
import Foundation
@testable import SwiftyLoadLetter

/// Tests for `DescribableObject`'s identity, which comes from its name and icon while equality
/// also compares its details.
@Suite("DescribableObject") struct DescribableObjectTests {

    @Test("objects built from the same name, icon and details are equal and share an id")
    func sameContentIsEqual() {
        let first = DescribableObject("Nominal", icon: "thermometer.low", details: "Running cool.")
        let second = DescribableObject("Nominal", icon: "thermometer.low", details: "Running cool.")
        #expect(first == second)
        #expect(first.id == second.id)
        #expect(first.hashValue == second.hashValue)
    }

    @Test("different details keep the id but are not equal")
    func detailsDoNotChangeID() {
        let cool = DescribableObject("Nominal", icon: "thermometer.low", details: "Running cool.")
        let warm = DescribableObject("Nominal", icon: "thermometer.low", details: "Running warm.")
        #expect(cool.id == warm.id)
        #expect(cool != warm)
    }

    @Test("changing the details keeps the id")
    func mutatingDetailsKeepsID() {
        var object = DescribableObject("Nominal", icon: "thermometer.low", details: "Running cool.")
        let id = object.id
        object.details = "Running warm."
        #expect(object.id == id)
        #expect(object == DescribableObject("Nominal", icon: "thermometer.low", details: "Running warm."))
    }

    @Test("a different name or icon is a different object")
    func differentContentDiffers() {
        let nominal = DescribableObject("Nominal", icon: "thermometer.low", details: "Running cool.")
        #expect(nominal.id != DescribableObject("Fair", icon: "thermometer.low", details: "Running cool.").id)
        #expect(nominal.id != DescribableObject("Nominal", icon: "thermometer.medium", details: "Running cool.").id)
    }

    @Test("an adapter returns an equal object on every access")
    func adapterIsStable() {
        let state = ProcessInfo.ThermalState.serious
        #expect(state.describableObject == state.describableObject)
        #expect(state.describableObject != ProcessInfo.ThermalState.nominal.describableObject)
    }

    @Test("decoding derives the id from the name and icon, whatever the payload says")
    func decodingDerivesID() throws {
        let payload = Data(#"{"id":"0B9D4E2A-5C1F-4E7B-9A3D-1F2E3D4C5B6A","name":"Nominal","icon":"thermometer.low","details":"Running cool."}"#.utf8)
        let decoded = try JSONDecoder().decode(DescribableObject.self, from: payload)
        #expect(decoded == DescribableObject("Nominal", icon: "thermometer.low", details: "Running cool."))
    }

    @Test("an encode and decode round trip keeps the object equal")
    func roundTrip() throws {
        let object = DescribableObject("Nominal", icon: "thermometer.low", details: "Running cool.")
        let data = try JSONEncoder().encode(object)
        #expect(try JSONDecoder().decode(DescribableObject.self, from: data) == object)
    }
}

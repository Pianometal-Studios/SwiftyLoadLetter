import Testing
import Foundation
@testable import SwiftyLoadLetter

/// Tests for the CompassPoint enum, which models the four cardinal directions and their properties.
@Suite("CompassPoint Tests") struct CompassPointTests {
    
    @Test("Opposite of opposite returns original direction", arguments: CompassPoint.allCases)
    func oppositeIsReversible(compassPoint: CompassPoint) {
        #expect(compassPoint.opposite.opposite == compassPoint)
    }
    
    @Test("Opposite directions match expected pairs", arguments: [
        (CompassPoint.north, CompassPoint.south),
        (CompassPoint.south, CompassPoint.north),
        (CompassPoint.east, CompassPoint.west),
        (CompassPoint.west, CompassPoint.east)
    ])
    func oppositeValues(compassPoint: CompassPoint, expectedOpposite: CompassPoint) {
        #expect(compassPoint.opposite == expectedOpposite)
    }
    
    @Test("No compass point is its own opposite", arguments: CompassPoint.allCases)
    func notSelfOpposite(compassPoint: CompassPoint) {
        #expect(compassPoint.opposite != compassPoint)
    }
    
    @Test("CompassPoint has exactly four cases")
    func caseCount() {
        #expect(CompassPoint.allCases.count == 4)
    }
    
    @Test("All cases are present")
    func allCasesPresent() {
        let cases = Set(CompassPoint.allCases)
        #expect(cases.contains(.north))
        #expect(cases.contains(.south))
        #expect(cases.contains(.east))
        #expect(cases.contains(.west))
    }
    
    @Test("Raw values match case names", arguments: [
        (CompassPoint.north, "north"),
        (CompassPoint.south, "south"),
        (CompassPoint.east, "east"),
        (CompassPoint.west, "west")
    ])
    func rawValues(compassPoint: CompassPoint, expectedRawValue: String) {
        #expect(compassPoint.rawValue == expectedRawValue)
    }
    
    @Test("CompassPoint can be initialized from raw value", arguments: [
        "north", "south", "east", "west"
    ])
    func initFromRawValue(rawValue: String) {
        let compassPoint = CompassPoint(rawValue: rawValue)
        #expect(compassPoint != nil)
    }
    
    @Test("Invalid raw value returns nil")
    func invalidRawValue() {
        let invalid = CompassPoint(rawValue: "northeast")
        #expect(invalid == nil)
    }
    
    @Test("Search finds matching compass points by name")
    func searchByName() {
        let results = CompassPoint.allCases.search("north")
        #expect(results.count == 1)
        #expect(results.first == .north)
    }
    
    @Test("Search is case-insensitive")
    func searchCaseInsensitive() {
        let lowercase = CompassPoint.allCases.search("south")
        let uppercase = CompassPoint.allCases.search("SOUTH")
        let mixed = CompassPoint.allCases.search("SoUtH")
        #expect(lowercase.count == 1)
        #expect(uppercase.count == 1)
        #expect(mixed.count == 1)
        #expect(lowercase == uppercase)
        #expect(uppercase == mixed)
    }
    
    @Test("Search returns all items for empty string")
    func searchEmptyString() {
        let results = CompassPoint.allCases.search("")
        #expect(results.count == CompassPoint.allCases.count)
    }
    
    @Test("Search supports partial matching")
    func searchPartialMatch() {
        let results = CompassPoint.allCases.search("st")
        #expect(results.count == 2)
        #expect(results.contains(.east))
        #expect(results.contains(.west))
    }
    
    @Test("Compass points can be used in sets")
    func usableInSets() {
        let set: Set<CompassPoint> = [.north, .south, .north, .east]
        #expect(set.count == 3) // north appears only once
        #expect(set.contains(.north))
        #expect(set.contains(.south))
        #expect(set.contains(.east))
    }
    
    @Test("Compass points can be dictionary keys")
    func usableAsDictionaryKeys() {
        let directions: [CompassPoint: String] = [
            .north: "↑",
            .south: "↓",
            .east: "→",
            .west: "←"
        ]
        #expect(directions[.north] == "↑")
        #expect(directions.count == 4)
    }
    
    @Test("CompassPoint encodes to JSON", arguments: CompassPoint.allCases)
    func encodesToJSON(compassPoint: CompassPoint) throws {
        let encoder = JSONEncoder()
        let data = try encoder.encode(compassPoint)
        #expect(data.count > 0)
    }
    
    @Test("CompassPoint decodes from JSON", arguments: CompassPoint.allCases)
    func decodesFromJSON(compassPoint: CompassPoint) throws {
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let data = try encoder.encode(compassPoint)
        let decoded = try decoder.decode(CompassPoint.self, from: data)
        #expect(decoded == compassPoint)
    }
    
    @Test("CompassPoint round-trip encoding preserves all properties")
    func roundTripEncoding() throws {
        let original = CompassPoint.north
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let data = try encoder.encode(original)
        let decoded = try decoder.decode(CompassPoint.self, from: data)
        #expect(decoded == original)
        #expect(decoded.name == original.name)
        #expect(decoded.abbreviation == original.abbreviation)
        #expect(decoded.icon == original.icon)
        #expect(decoded.opposite == original.opposite)
    }
}

import Testing
import SwiftUI
import UniformTypeIdentifiers

@testable import SwiftyLoadLetter

/// Tests for `Staticable` protocol conformance and default implementations.
@Suite("Staticable") struct StaticableTests {
    
    @Test("id property returns self")
    func testIdentifiableConformance() async throws {
        let test = TestEnum.first
        #expect(test.id == test)
        #expect(test.id == .first)
    }
    
    @Test("id stability across multiple accesses")
    func testIDStability() async throws {
        let test = TestEnum.second
        let firstID = test.id
        let secondID = test.id
        #expect(firstID == secondID)
    }
    
    @Test("Hashable conformance allows use in Set")
    func testHashableInSet() async throws {
        let set: Set<TestEnum> = [.first, .second, .first]
        #expect(set.count == 2)
        #expect(set.contains(.first))
        #expect(set.contains(.second))
    }
    
    @Test("Hashable conformance allows use as Dictionary key")
    func testHashableInDictionary() async throws {
        let dict: [TestEnum: String] = [
            .first: "one",
            .second: "two",
            .third: "three"
        ]
        #expect(dict[.first] == "one")
        #expect(dict[.second] == "two")
        #expect(dict[.third] == "three")
    }
    
    @Test("CaseIterable provides all cases")
    func testCaseIterable() async throws {
        let allCases = TestEnum.allCases
        #expect(allCases.count == 3)
        #expect(allCases.contains(.first))
        #expect(allCases.contains(.second))
        #expect(allCases.contains(.third))
    }
    
    @Test("CaseIterable order is stable")
    func testCaseIterableOrder() async throws {
        let cases = Array(TestEnum.allCases)
        #expect(cases[0] == .first)
        #expect(cases[1] == .second)
        #expect(cases[2] == .third)
    }
    
    @Test("Codable encodes to JSON correctly")
    func testCodableEncoding() async throws {
        let encoder = JSONEncoder()
        let value = TestEnum.first
        let data = try encoder.encode(value)
        let jsonString = String(data: data, encoding: .utf8)
        #expect(jsonString == "\"first\"")
    }
    
    @Test("Codable decodes from JSON correctly")
    func testCodableDecoding() async throws {
        let decoder = JSONDecoder()
        let json = "\"second\"".data(using: .utf8)!
        let decoded = try decoder.decode(TestEnum.self, from: json)
        #expect(decoded == .second)
    }
    
    @Test("Codable round-trip preserves value")
    func testCodableRoundTrip() async throws {
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        for testCase in TestEnum.allCases {
            let encoded = try encoder.encode(testCase)
            let decoded = try decoder.decode(TestEnum.self, from: encoded)
            #expect(decoded == testCase)
        }
    }
    
    @Test("Codable works with custom raw values")
    func testCodableWithCustomRawValues() async throws {
        let encoder = JSONEncoder()
        let value = CustomRawValueEnum.alpha
        let data = try encoder.encode(value)
        let jsonString = String(data: data, encoding: .utf8)
        #expect(jsonString == "\"custom_alpha\"")
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(CustomRawValueEnum.self, from: data)
        #expect(decoded == .alpha)
    }
    
    @Test("CodingKey stringValue matches rawValue")
    func testCodingKeyStringValue() async throws {
        #expect(TestEnum.first.stringValue == "first")
        #expect(TestEnum.second.stringValue == "second")
        #expect(TestEnum.third.stringValue == "third")
    }
    
    @Test("CodingKey intValue is nil")
    func testCodingKeyIntValue() async throws {
        #expect(TestEnum.first.intValue == nil)
        #expect(TestEnum.second.intValue == nil)
        #expect(TestEnum.third.intValue == nil)
    }
    
    @Test("CodingKey can be used in Codable container")
    func testCodingKeyInContainer() async throws {
        let original = TestStruct(first: "one", second: "two", third: "three")
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let encoded = try encoder.encode(original)
        let decoded = try decoder.decode(TestStruct.self, from: encoded)
        #expect(decoded.first == "one")
        #expect(decoded.second == "two")
        #expect(decoded.third == "three")
    }
    
    @Test("RawValue is String type")
    func testRawRepresentable() async throws {
        let value = TestEnum.first
        #expect(value.rawValue == "first")
        #expect(type(of: value.rawValue) == String.self)
    }
    
    @Test("Init from rawValue works correctly")
    func testInitFromRawValue() async throws {
        #expect(TestEnum(rawValue: "first") == .first)
        #expect(TestEnum(rawValue: "second") == .second)
        #expect(TestEnum(rawValue: "third") == .third)
        #expect(TestEnum(rawValue: "invalid") == nil)
    }
    
    @Test("Sendable conformance allows crossing actor boundaries")
    func testSendableConformance() async throws {
        let actor = TestActor()
        await actor.setValue(.second)
        let result = await actor.getValue()
        #expect(result == .second)
    }
    
    @Test("customizationID includes bundle identifier")
    func testCustomizationIDWithBundleID() async throws {
        let value = TestEnum.first
        let customID = value.customizationID
        if let bundleID = MainBundle.identifier {
            #expect(customID == "\(bundleID).first")
            #expect(customID.contains(bundleID))
            #expect(customID.hasSuffix(".first"))
        } else {
            #expect(customID == "first")
        }
    }
    
    @Test("customizationID is unique per case")
    func testCustomizationIDUniqueness() async throws {
        let id1 = TestEnum.first.customizationID
        let id2 = TestEnum.second.customizationID
        let id3 = TestEnum.third.customizationID
        #expect(id1 != id2)
        #expect(id2 != id3)
        #expect(id1 != id3)
    }
    
    @Test("customizationID works with custom raw values")
    func testCustomizationIDWithCustomRawValues() async throws {
        let value = CustomRawValueEnum.alpha
        let customID = value.customizationID
        if let bundleID = MainBundle.identifier {
            #expect(customID == "\(bundleID).custom_alpha")
        } else {
            #expect(customID == "custom_alpha")
        }
    }
    
    @Test("customizationID is stable across multiple calls")
    func testCustomizationIDStability() async throws {
        let value = TestEnum.second
        let id1 = value.customizationID
        let id2 = value.customizationID
        #expect(id1 == id2)
    }
    
    @Test("transferRepresentation can be accessed")
    func testTransferRepresentationExists() async throws {
        _ = TestEnum.transferRepresentation
    }
    
    @Test("Transferable conformance allows drag and drop operations")
    func testTransferableConformance() async throws {
        func acceptsTransferable<T: Transferable>(_ value: T.Type) -> Bool {
            return true
        }
        #expect(acceptsTransferable(TestEnum.self))
    }
    
    @Test("Equatable comparison works correctly")
    func testEquatableConformance() async throws {
        #expect(TestEnum.first == TestEnum.first)
        #expect(TestEnum.first != TestEnum.second)
        #expect(TestEnum.second == TestEnum.second)
        #expect(TestEnum.third != TestEnum.first)
    }
    
    @Test("Multiple protocol conformances work together")
    func testIntegration() async throws {
        var set: Set<TestEnum> = []
        for testCase in TestEnum.allCases {
            set.insert(testCase)
        }
        #expect(set.count == 3)
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        for testCase in set {
            let encoded = try encoder.encode(testCase)
            let decoded = try decoder.decode(TestEnum.self, from: encoded)
            #expect(decoded == testCase)
            #expect(decoded.id == testCase.id)
        }
    }
    
    @Test("Can use in async context with Sendable")
    func testAsyncIntegration() async throws {
        let values = TestEnum.allCases
        await withTaskGroup(of: String.self) { group in
            for value in values {
                group.addTask {
                    return value.customizationID
                }
            }
            var results: [String] = []
            for await result in group {
                results.append(result)
            }
            #expect(results.count == 3)
        }
    }
    
    @Test("Dictionary with Staticable keys encodes correctly")
    func testDictionaryWithStaticableKeys() async throws {
        struct Container: Codable {
            let values: [String: String]
        }
        let dict: [String: String] = [
            TestEnum.first.rawValue: "one",
            TestEnum.second.rawValue: "two",
            TestEnum.third.rawValue: "three"
        ]
        let container = Container(values: dict)
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let encoded = try encoder.encode(container)
        let decoded = try decoder.decode(Container.self, from: encoded)
        #expect(decoded.values[TestEnum.first.rawValue] == "one")
        #expect(decoded.values[TestEnum.second.rawValue] == "two")
        #expect(decoded.values[TestEnum.third.rawValue] == "three")
    }
}

// MARK: - Helpers

/// A simple actor for testing Sendable conformance of TestEnum.
private actor TestActor {
    
    var value: TestEnum = .first
    
    func setValue(_ newValue: TestEnum) {
        value = newValue
    }
    
    func getValue() -> TestEnum { value }
}

/// A minimal enum conforming to Staticable for testing purposes.
private enum TestEnum: String, Staticable {
    
    case first
    case second
    case third
}

/// An enum with custom raw values for testing serialization.
private enum CustomRawValueEnum: String, Staticable {
    
    case alpha = "custom_alpha"
    case beta = "custom_beta"
    case gamma = "custom_gamma"
}

/// A struct for testing Codable conformance with custom CodingKeys.
private struct TestStruct: Codable {
    
    var first: String
    var second: String
    var third: String
    
    
    init(first: String, second: String, third: String) {
        self.first = first
        self.second = second
        self.third = third
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: TestEnum.self)
        first = try container.decode(String.self, forKey: .first)
        second = try container.decode(String.self, forKey: .second)
        third = try container.decode(String.self, forKey: .third)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: TestEnum.self)
        try container.encode(first, forKey: .first)
        try container.encode(second, forKey: .second)
        try container.encode(third, forKey: .third)
    }
}

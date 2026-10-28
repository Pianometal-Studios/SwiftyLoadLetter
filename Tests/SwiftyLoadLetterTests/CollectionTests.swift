import Testing
import Foundation
@testable import SwiftyLoadLetter

/// Tests for the `Collection.nilIfEmpty` extension.
@Suite("Collection") struct CollectionTests {

    @Test("An empty collection becomes nil")
    func emptyIsNil() {
        #expect([Int]().nilIfEmpty == nil)
        #expect(Set<String>().nilIfEmpty == nil)
        #expect([String: Int]().nilIfEmpty == nil)
        #expect("".nilIfEmpty == nil)
    }

    @Test("A non-empty collection is returned unchanged")
    func nonEmptyIsSelf() {
        #expect([1, 2, 3].nilIfEmpty == [1, 2, 3])
        #expect(Set(["a"]).nilIfEmpty == Set(["a"]))
        #expect(["a": 1].nilIfEmpty == ["a": 1])
        #expect("a".nilIfEmpty == "a")
    }

    @Test("Works on slices and lazy filters")
    func worksOnSubsequences() {
        let numbers = [1, 2, 3, 4]
        #expect(numbers[2...].nilIfEmpty == [3, 4])
        #expect(numbers.filter { $0 > 10 }.nilIfEmpty == nil)
    }
}

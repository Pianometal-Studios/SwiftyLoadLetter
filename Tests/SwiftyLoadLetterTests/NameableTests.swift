import Testing
@testable import SwiftyLoadLetter

/// Tests for `Nameable` protocol and its `search` extension method.
@Suite("Nameable.search") struct NameableTests {

    private struct Item: Nameable {
        let name: String
    }

    private let items = [
        Item(name: "Apple"),
        Item(name: "Banana"),
        Item(name: "Apricot")
    ]

    @Test("empty query returns all elements")
    func emptyQueryReturnsAll() {
        #expect(items.search("").count == 3)
    }

    @Test("matching is case-insensitive")
    func caseInsensitive() {
        #expect(items.search("apple").count == 1)
        #expect(items.search("APPLE").count == 1)
        #expect(items.search("Apple").count == 1)
    }

    @Test("partial match returns correct results")
    func partialMatch() {
        #expect(items.search("ap").count == 2)
    }

    @Test("no match returns empty array")
    func noMatch() {
        #expect(items.search("xyz").isEmpty)
    }
}

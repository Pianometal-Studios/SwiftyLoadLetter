import Testing
@testable import SwiftyLoadLetter

// MARK: - Edge

/// Tests for SwiftyLoadLetter Edge opposite extension.
///
/// - Authors: [@pianometal](https://github.com/pianometal)
@Test func testEdgeOpposite() async throws {
    #expect(Edge.top.opposite == .bottom)
    #expect(Edge.bottom.opposite == .top)
    #expect(Edge.leading.opposite == .trailing)
    #expect(Edge.trailing.opposite == .leading)
}

/// Tests for SwiftyLoadLetter Edge horizontal orientation conversions.
///
/// - Authors: [@pianometal](https://github.com/pianometal)
@Test func testEdgeToEdgeHorizontal() async throws {
    #expect(Edge.leading.toEdge(.horizontal) == .leading)
    #expect(Edge.trailing.toEdge(.horizontal) == .trailing)
    #expect(Edge.top.toEdge(.horizontal) == nil)
    #expect(Edge.bottom.toEdge(.horizontal) == nil)
}

/// Tests for SwiftyLoadLetter Edge vertical orientation conversions.
///
/// - Authors: [@pianometal](https://github.com/pianometal)
@Test func testEdgeToEdgeVertical() async throws {
    #expect(Edge.top.toEdge(.vertical) == .top)
    #expect(Edge.bottom.toEdge(.vertical) == .bottom)
    #expect(Edge.leading.toEdge(.vertical) == nil)
    #expect(Edge.trailing.toEdge(.vertical) == nil)
}

// MARK: - URL

/// Tests for SwiftyLoadLetter URL create extension.
///
/// - Authors: [@pianometal](https://github.com/pianometal)
@Test func testURLCreateValid() async throws {
    #expect(URL.create("https://www.apple.com")?.host == "www.apple.com")
    #expect(URL.create("http://apple.com")?.host == "apple.com")
}

/// Tests for SwiftyLoadLetter URL create extension with invalid strings.
///
/// - Authors: [@pianometal](https://github.com/pianometal)
@Test func testURLCreateInvalidString() async throws {
    #expect(URL.create("not a url") == nil)
    #expect(URL.create("") == nil)
    #expect(URL.create("ht!tp://bad_url") == nil)
}

/// Tests for SwiftyLoadLetter URL create extension with no host.
///
/// - Authors: [@pianometal](https://github.com/pianometal)
@Test func testURLCreateNoHost() async throws {
    #expect(URL.create("file:///Users/test/file.txt") == nil)
    #expect(URL.create("customscheme://") == nil)
    #expect(URL.create("mailto:user@example.com") == nil)
}

/// Tests for SwiftyLoadLetter URL create extension with edge cases.
///
/// - Authors: [@pianometal](https://github.com/pianometal)
@Test func testURLCreateHostEdgeCases() async throws {
    #expect(URL.create("https://") == nil)
    #expect(URL.create("https://?query=param") == nil)
    #expect(URL.create("https://#fragment") == nil)
}

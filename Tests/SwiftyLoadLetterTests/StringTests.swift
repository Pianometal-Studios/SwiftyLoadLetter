import Testing
import Foundation
@testable import SwiftyLoadLetter

/// Tests for the `String.trimmed` and `String.isBlank` extensions.
@Suite("String") struct StringTests {

    @Test("trimmed removes leading and trailing whitespace and newlines", arguments: [
        ("  Hello  ", "Hello"),
        ("\n\tHello\n", "Hello"),
        ("Hello", "Hello"),
        ("   ", ""),
        ("", "")
    ])
    func trimmed(input: String, expected: String) {
        #expect(input.trimmed == expected)
    }

    @Test("trimmed keeps whitespace inside the string")
    func trimmedKeepsInnerWhitespace() {
        #expect("  Hello, \n world!  ".trimmed == "Hello, \n world!")
    }

    @Test("isBlank is true for empty and whitespace-only strings", arguments: ["", " ", "\n", "\t \n "])
    func isBlank(input: String) {
        #expect(input.isBlank)
    }

    @Test("isBlank is false when any visible character remains", arguments: ["a", " a ", "\n.\n"])
    func isNotBlank(input: String) {
        #expect(!input.isBlank)
    }
}

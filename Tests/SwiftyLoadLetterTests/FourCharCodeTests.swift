import Testing
import Foundation
@testable import SwiftyLoadLetter

/// Tests for the `FourCharCode.fourCharCode` extension.
@Suite("FourCharCode") struct FourCharCodeTests {

    @Test("Decodes the four bytes, most significant first", arguments: [
        (FourCharCode(0x3432_3076), "420v"),
        (0x6176_6331, "avc1"),
        (0x6876_6331, "hvc1"),
        (0x2020_2020, "    ")
    ])
    func decodes(code: FourCharCode, expected: String) {
        #expect(code.fourCharCode == expected)
    }

    @Test("Stops at the first zero byte")
    func stopsAtZero() {
        #expect(FourCharCode(0x6162_0063).fourCharCode == "ab")
        #expect(FourCharCode(0).fourCharCode == "")
    }
}

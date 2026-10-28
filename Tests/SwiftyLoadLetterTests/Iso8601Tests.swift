import Testing
import Foundation
@testable import SwiftyLoadLetter

/// Tests for the `Iso8601` display helper.
@Suite("Iso8601") struct Iso8601Tests {

    @Test("A valid timestamp formats like Foundation's own date styles")
    func validTimestamp() throws {
        let timestamp = "2026-10-28T14:30:00Z"
        let date = try Date(timestamp, strategy: .iso8601)
        #expect(Iso8601.string(timestamp) == date.formatted(date: .long, time: .omitted))
        #expect(Iso8601.string(timestamp, date: .numeric, time: .shortened) == date.formatted(date: .numeric, time: .shortened))
    }

    @Test("A timestamp with an offset parses", arguments: ["2026-10-28T14:30:00-07:00", "2026-10-28T14:30:00+05:30"])
    func offsetTimestamp(timestamp: String) {
        #expect(Iso8601.string(timestamp) != nil)
    }

    @Test("An invalid timestamp returns nil", arguments: ["", "not a date", "10/28/2026"])
    func invalidTimestamp(timestamp: String) {
        #expect(Iso8601.string(timestamp) == nil)
    }
}

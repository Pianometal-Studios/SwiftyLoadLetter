import Testing
import Foundation
@testable import SwiftyLoadLetter

/// Tests for the time zone properties of `Locale`, including the formatting and existence of time zone names and abbreviations.
@Suite("Time Zone Tests") struct TimeZoneTests {
    
    @Test("Time zone name exists")
    func timeZoneNameExists() async throws {
        let timeZoneName = Locale.current.timeZoneName
        #expect(!timeZoneName.isEmpty, "Time zone name should not be empty")
    }
    
    @Test("Time zone name formatting removes underscores")
    func timeZoneNameFormattingUnderscores() async throws {
        let timeZoneName = Locale.current.timeZoneName
        #expect(!timeZoneName.contains("_"), "Time zone name should not contain underscores")
    }
    
    @Test("Time zone name formatting replaces slashes with dash")
    func timeZoneNameFormattingSlashes() async throws {
        let timeZoneName = Locale.current.timeZoneName
        let originalIdentifier = Locale.current.calendar.timeZone.identifier
        if originalIdentifier.contains("/") {
            #expect(timeZoneName.contains(" - "), "Time zone name should replace slashes with ' - '")
        }
    }
    
    @Test("Time zone abbreviation exists")
    func timeZoneAbbreviationExists() async throws {
        let abbreviation = Locale.current.timeZoneAbbreviation
        #expect(abbreviation != nil, "Time zone abbreviation should exist")
    }
    
    @Test("Time zone abbreviation is not empty")
    func timeZoneAbbreviationIsNotEmpty() async throws {
        let abbreviation = try #require(Locale.current.timeZoneAbbreviation)
        #expect(!abbreviation.isEmpty, "Time zone abbreviation should not be empty")
    }
    
    @Test("Time zone abbreviation is typically short")
    func timeZoneAbbreviationLength() async throws {
        let abbreviation = try #require(Locale.current.timeZoneAbbreviation)
        #expect(abbreviation.count <= 10, "Time zone abbreviation should be reasonably short")
    }
}

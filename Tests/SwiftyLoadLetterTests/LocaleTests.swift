import Testing
import Foundation
@testable import SwiftyLoadLetter

/// Comprehensive tests for the `Locale` extension properties, including locale name, time zone information, and currency details.
@Suite("Locale Tests") struct LocaleTests {
    
    @Test("Locale name is not nil for current locale")
    func localeNameExists() async throws {
        let name = Locale.current.name
        #expect(name != nil, "Current locale should have a name")
    }
    
    @Test("Locale name is not empty")
    func localeNameIsNotEmpty() async throws {
        let name = try #require(Locale.current.name)
        #expect(!name.isEmpty, "Locale name should not be empty")
    }
    
    @Test("Locale name for specific locales", arguments: [
        ("en_US", "English (United States)"),
        ("es_ES", "español (España)"),
        ("fr_FR", "français (France)"),
        ("de_DE", "Deutsch (Deutschland)"),
        ("ja_JP", "日本語 (日本)")
    ])
    func localeNameForSpecificLocale(identifier: String, expectedName: String) async throws {
        let locale = Locale(identifier: identifier)
        let name = locale.name
        #expect(name != nil, "Locale '\(identifier)' should have a name")
        if let name = name {
            #expect(!name.isEmpty, "Locale name should not be empty")
        }
    }
    
    @Test("Properties work with different locale configurations")
    func propertiesWorkWithDifferentLocales() async throws {
        let testLocales = ["en_US", "de_DE", "ja_JP", "ar_SA", "zh_CN"]
        for localeId in testLocales {
            let locale = Locale(identifier: localeId)
            #expect(locale.name != nil, "Name should exist for locale '\(localeId)'")
            #expect(locale.currencyIdentifier != nil, "Currency ID should exist for locale '\(localeId)'")
            #expect(locale.currencySign != nil, "Currency symbol should exist for locale '\(localeId)'")
        }
    }
    
    @Test("Time zone properties are consistent")
    func timeZonePropertiesConsistent() async throws {
        let name = Locale.current.timeZoneName
        let abbreviation = Locale.current.timeZoneAbbreviation
        #expect(!name.isEmpty, "Time zone name should not be empty")
        #expect(abbreviation != nil, "Time zone abbreviation should not be nil")
    }
    
    @Test("Currency properties are consistent")
    func currencyPropertiesConsistent() async throws {
        let identifier = Locale.current.currencyIdentifier
        let symbol = Locale.current.currencySign
        if identifier != nil {
            #expect(symbol != nil, "If currency identifier exists, symbol should too")
        }
        if symbol != nil {
            #expect(identifier != nil, "If currency symbol exists, identifier should too")
        }
    }
}

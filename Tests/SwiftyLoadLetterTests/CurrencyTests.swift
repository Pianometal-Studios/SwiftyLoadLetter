import Testing
import Foundation
@testable import SwiftyLoadLetter

/// Tests for the `Locale` extension properties related to currency information, including currency identifier and symbol.
@Suite("Currency Tests") struct CurrencyTests {
    
    @Test("Currency identifier exists for current locale")
    func currencyIdentifierExists() async throws {
        let identifier = Locale.current.currencyIdentifier
        #expect(identifier != nil, "Current locale should have a currency identifier")
    }
    
    @Test("Currency identifier is not empty")
    func currencyIdentifierIsNotEmpty() async throws {
        let identifier = try #require(Locale.current.currencyIdentifier)
        #expect(!identifier.isEmpty, "Currency identifier should not be empty")
    }
    
    @Test("Currency identifier is ISO 4217 format (3 characters)")
    func currencyIdentifierFormat() async throws {
        let identifier = try #require(Locale.current.currencyIdentifier)
        #expect(identifier.count == 3, "Currency identifier should be 3 characters (ISO 4217)")
        #expect(identifier.uppercased() == identifier, "Currency identifier should be uppercase")
    }
    
    @Test("Currency identifier for specific locales", arguments: [
        "en_US", "en_GB", "fr_FR", "de_DE", "ja_JP", "zh_CN", "es_MX"
    ])
    func currencyIdentifierForSpecificLocale(localeIdentifier: String) async throws {
        let locale = Locale(identifier: localeIdentifier)
        let currencyId = locale.currencyIdentifier
        
        #expect(currencyId != nil, "Locale '\(localeIdentifier)' should have a currency identifier")
        if let currencyId = currencyId {
            #expect(currencyId.count == 3, "Currency identifier should be 3 characters")
        }
    }
    
    @Test("Known currency identifiers", arguments: [
        ("en_US", "USD"),
        ("en_GB", "GBP"),
        ("fr_FR", "EUR"),
        ("ja_JP", "JPY")
    ])
    func knownCurrencyIdentifiers(localeIdentifier: String, expectedCurrency: String) async throws {
        let locale = Locale(identifier: localeIdentifier)
        let currencyId = try #require(locale.currencyIdentifier)
        #expect(currencyId == expectedCurrency, "Locale '\(localeIdentifier)' should use '\(expectedCurrency)'")
    }
    
    @Test("Currency symbol exists")
    func currencySymbolExists() async throws {
        let symbol = Locale.current.currencySign
        #expect(symbol != nil, "Current locale should have a currency symbol")
    }
    
    @Test("Currency symbol is not empty")
    func currencySymbolIsNotEmpty() async throws {
        let symbol = try #require(Locale.current.currencySign)
        #expect(!symbol.isEmpty, "Currency symbol should not be empty")
    }
    
    @Test("Known currency symbols", arguments: [
        ("en_US", "$"),
        ("en_GB", "£"),
        ("ja_JP", "¥"),
        ("fr_FR", "€"),
        ("de_DE", "€")
    ])
    func knownCurrencySymbols(localeIdentifier: String, expectedSymbol: String) async throws {
        let locale = Locale(identifier: localeIdentifier)
        let symbol = try #require(locale.currencySign)
        #expect(symbol == expectedSymbol, "Locale '\(localeIdentifier)' should use symbol '\(expectedSymbol)'")
    }
}

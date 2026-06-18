import Testing
import Foundation
import os

@testable import SwiftyLoadLetter

/// Comprehensive tests for the `LogCategory` enum
@Suite("LogCategory") struct LogCategoryTests {
    
    @Test("LogCategory conforms to RawRepresentable with String raw values")
    func rawRepresentableConformance() {
        #expect(LogCategory.network.rawValue == "network")
        #expect(LogCategory.auth.rawValue == "auth")
        #expect(LogCategory.general.rawValue == "general")
    }
    
    @Test("All LogCategory cases can be constructed from raw values")
    func constructionFromRawValue() {
        #expect(LogCategory(rawValue: "network") == .network)
        #expect(LogCategory(rawValue: "auth") == .auth)
        #expect(LogCategory(rawValue: "firebase") == .firebase)
        #expect(LogCategory(rawValue: "bluetooth") == .bluetooth)
        #expect(LogCategory(rawValue: "location") == .location)
        #expect(LogCategory(rawValue: "general") == .general)
        #expect(LogCategory(rawValue: "revenueCat") == .revenueCat)
        #expect(LogCategory(rawValue: "swift") == .swift)
        #expect(LogCategory(rawValue: "swiftData") == .swiftData)
        #expect(LogCategory(rawValue: "system") == .system)
        #expect(LogCategory(rawValue: "asc") == .asc)
    }
    
    @Test("Invalid raw values return nil")
    func invalidRawValue() {
        #expect(LogCategory(rawValue: "invalid") == nil)
        #expect(LogCategory(rawValue: "") == nil)
        #expect(LogCategory(rawValue: "NETWORK") == nil)
    }
    
    @Test("Each category has a unique emoji")
    func uniqueEmojis() {
        let allEmojis = LogCategory.allCases.map(\.emoji)
        let uniqueEmojis = Set(allEmojis)
        #expect(allEmojis.count == uniqueEmojis.count, 
                "All categories should have unique emojis")
    }
    
    @Test("All emojis are non-empty strings")
    func emojisAreNonEmpty() {
        for category in LogCategory.allCases {
            #expect(!category.emoji.isEmpty, 
                    "\(category.rawValue) should have a non-empty emoji")
        }
    }
    
    @Test("Emoji labels combine emoji and name correctly")
    func emojiLabelFormat() {
        let category = LogCategory.network
        let expectedLabel = "\(category.emoji) \(category.name)"
        #expect(category.emojiLabel == expectedLabel)
        #expect(category.emojiLabel == "🌐 Network")
    }
    
    @Test("Each category has a non-empty name")
    func namesAreNonEmpty() {
        for category in LogCategory.allCases {
            #expect(!category.name.isEmpty,
                    "\(category.rawValue) should have a non-empty name")
        }
    }
    
    @Test("Specific category names match expected values")
    func specificNames() {
        #expect(LogCategory.asc.name == "App Store Connect")
        #expect(LogCategory.network.name == "Network")
        #expect(LogCategory.firebase.name == "Firebase")
        #expect(LogCategory.auth.name == "Auth")
        #expect(LogCategory.revenueCat.name == "RevenueCat")
        #expect(LogCategory.swift.name == "Swift")
        #expect(LogCategory.swiftData.name == "SwiftData")
        #expect(LogCategory.system.name == "System")
        #expect(LogCategory.bluetooth.name == "Bluetooth")
        #expect(LogCategory.location.name == "Location")
        #expect(LogCategory.general.name == "General")
    }
    
    // MARK: - Describable Protocol Tests
    
    @Test("Each category has a non-empty description")
    func descriptionsAreNonEmpty() {
        for category in LogCategory.allCases {
            #expect(!category.details.isEmpty,
                    "\(category.rawValue) should have a non-empty description")
        }
    }
    
    @Test("Specific category descriptions contain relevant keywords")
    func descriptionKeywords() {
        #expect(LogCategory.network.details.localizedCaseInsensitiveContains("network"))
        #expect(LogCategory.auth.details.localizedCaseInsensitiveContains("auth"))
        #expect(LogCategory.firebase.details.localizedCaseInsensitiveContains("firebase"))
        #expect(LogCategory.bluetooth.details.localizedCaseInsensitiveContains("bluetooth"))
        #expect(LogCategory.location.details.localizedCaseInsensitiveContains("location"))
    }
    
    @Test("allCases contains all expected categories")
    func allCasesComplete() {
        let allCases = Set(LogCategory.allCases)
        #expect(allCases.contains(.asc))
        #expect(allCases.contains(.network))
        #expect(allCases.contains(.firebase))
        #expect(allCases.contains(.auth))
        #expect(allCases.contains(.revenueCat))
        #expect(allCases.contains(.swift))
        #expect(allCases.contains(.swiftData))
        #expect(allCases.contains(.system))
        #expect(allCases.contains(.bluetooth))
        #expect(allCases.contains(.location))
        #expect(allCases.contains(.general))
    }
    
    // MARK: - Logging Functionality Tests
    
    @Test("Log method accepts all OSLogType levels")
    func logMethodAcceptsAllLevels() {
        let category = LogCategory.general
        category.log("Debug message", type: .debug)
        category.log("Info message", type: .info)
        category.log("Notice message", type: .default)
        category.log("Error message", type: .error)
        category.log("Fault message", type: .fault)
    }
    
    @Test("Log method defaults to .default type")
    func logMethodDefaultType() {
        let category = LogCategory.general
        category.log("Default type message")
    }
    
    @Test("Log method handles empty strings")
    func logMethodHandlesEmptyStrings() {
        let category = LogCategory.general
        category.log("", type: .debug)
        category.log("", type: .error)
    }
    
    @Test("Log method handles special characters")
    func logMethodHandlesSpecialCharacters() {
        let category = LogCategory.network
        category.log("Message with emoji: 🎉", type: .debug)
        category.log("Message with newline:\nSecond line", type: .debug)
        category.log("Message with quotes: \"test\"", type: .debug)
        category.log("Message with backslash: \\", type: .debug)
    }
    
    @Test("Different categories can log simultaneously")
    func multipleCategoriesCanLog() {
        // Should not interfere with each other
        LogCategory.network.log("Network message", type: .debug)
        LogCategory.auth.log("Auth message", type: .debug)
        LogCategory.firebase.log("Firebase message", type: .debug)
    }
    
    @Test("Each category has a unique ID")
    func uniqueIDs() {
        let allIDs = LogCategory.allCases.map(\.id)
        let uniqueIDs = Set(allIDs)
        #expect(allIDs.count == uniqueIDs.count,
                "All categories should have unique IDs")
    }
    
    @Test("Category IDs are stable")
    func stableIDs() {
        let category = LogCategory.network
        let firstID = category.id
        let secondID = category.id
        #expect(firstID == secondID)
    }
    
    @Test("Categories can be sorted")
    func categoriesAreSortable() {
        let sorted = LogCategory.allCases.sorted()
        #expect(sorted.count == LogCategory.allCases.count)
    }
    
    @Test("Categories work with collections")
    func workWithCollections() {
        let categories: [LogCategory] = [.network, .auth, .firebase]
        #expect(categories.count == 3)
        #expect(categories.contains(.network))
        #expect(!categories.contains(.general))
        let set = Set(categories)
        #expect(set.count == 3)
    }
    
    @Test("Categories can be used as dictionary keys")
    func usableAsDictionaryKeys() {
        var logCounts: [LogCategory: Int] = [:]
        logCounts[.network] = 5
        logCounts[.auth] = 3
        #expect(logCounts[.network] == 5)
        #expect(logCounts[.auth] == 3)
        #expect(logCounts[.firebase] == nil)
    }
}

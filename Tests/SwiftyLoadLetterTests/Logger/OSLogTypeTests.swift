import Testing
import os
import SwiftUI

@testable import SwiftyLoadLetter

/// Comprehensive tests for the `OSLogType` extension properties
@Suite("OSLogType") struct OSLogTypeTests {
    
    @Test("Debug is not persisted in production") 
    func debugNotPersisted() {
        #expect(OSLogType.debug.isPersistedInProduction == false)
    }
    
    @Test("Info is not persisted in production") 
    func infoNotPersisted() {
        #expect(OSLogType.info.isPersistedInProduction == false)
    }
    
    @Test("Default (Notice) is persisted in production") 
    func defaultPersisted() {
        #expect(OSLogType.default.isPersistedInProduction == true)
    }
    
    @Test("Error is persisted in production") 
    func errorPersisted() {
        #expect(OSLogType.error.isPersistedInProduction == true)
    }
    
    @Test("Fault is persisted in production") 
    func faultPersisted() {
        #expect(OSLogType.fault.isPersistedInProduction == true)
    }
    
    @Test("All log types have non-empty names")
    func namesAreNonEmpty() {
        for type in OSLogType.allCases {
            #expect(!type.name.isEmpty)
        }
    }
    
    @Test("Specific log type names match expected values")
    func specificNames() {
        #expect(OSLogType.debug.name == "Debug")
        #expect(OSLogType.info.name == "Info")
        #expect(OSLogType.default.name == "Notice")
        #expect(OSLogType.error.name == "Error")
        #expect(OSLogType.fault.name == "Fault")
    }
    
    @Test("All log types have unique emojis")
    func uniqueEmojis() {
        let allEmojis = OSLogType.allCases.map(\.emoji)
        let uniqueEmojis = Set(allEmojis)
        #expect(allEmojis.count == uniqueEmojis.count)
    }
    
    @Test("All emojis are non-empty strings")
    func emojisAreNonEmpty() {
        for type in OSLogType.allCases {
            #expect(!type.emoji.isEmpty)
        }
    }
    
    @Test("Emoji labels combine emoji and name correctly")
    func emojiLabelFormat() {
        let type = OSLogType.debug
        let expectedLabel = "\(type.emoji) \(type.name)"
        #expect(type.emojiLabel == expectedLabel)
        #expect(type.emojiLabel == "🐛 Debug")
    }
    
    @Test("All emoji labels are formatted correctly")
    func allEmojiLabelsFormatted() {
        #expect(OSLogType.debug.emojiLabel == "🐛 Debug")
        #expect(OSLogType.info.emojiLabel == "💬 Info")
        #expect(OSLogType.default.emojiLabel == "📋 Notice")
        #expect(OSLogType.error.emojiLabel == "⚠️ Error")
        #expect(OSLogType.fault.emojiLabel == "🚨 Fault")
    }
    
    @Test("All log types have non-empty details")
    func detailsAreNonEmpty() {
        for type in OSLogType.allCases {
            #expect(!type.details.isEmpty)
        }
    }
    
    @Test("Debug details mention not persisted")
    func debugDetailsContent() {
        #expect(OSLogType.debug.details.localizedCaseInsensitiveContains("not persisted"))
    }
    
    @Test("Fault details mention critical or severe")
    func faultDetailsContent() {
        let details = OSLogType.fault.details.lowercased()
        let hasCritical = details.contains("critical")
        let hasSevere = details.contains("severe")
        #expect(hasCritical || hasSevere)
    }
    
    @Test("Severity levels increase in expected order")
    func severityOrder() {
        #expect(OSLogType.debug.severity < OSLogType.info.severity)
        #expect(OSLogType.info.severity < OSLogType.default.severity)
        #expect(OSLogType.default.severity < OSLogType.error.severity)
        #expect(OSLogType.error.severity < OSLogType.fault.severity)
    }
    
    @Test("Specific severity values match expected integers")
    func specificSeverities() {
        #expect(OSLogType.debug.severity == 0)
        #expect(OSLogType.info.severity == 1)
        #expect(OSLogType.default.severity == 2)
        #expect(OSLogType.error.severity == 3)
        #expect(OSLogType.fault.severity == 4)
    }
    
    @Test("Severity values are contiguous")
    func severitiesAreContiguous() {
        let severities = OSLogType.allCases.map(\.severity).sorted()
        for (index, severity) in severities.enumerated() {
            #expect(severity == index)
        }
    }
    
    @Test("Severity can be used for sorting")
    func severitySorting() {
        let unsorted: [OSLogType] = [.fault, .debug, .error, .info, .default]
        let sorted = unsorted.sorted { $0.severity < $1.severity }
        
        #expect(sorted[0] == .debug)
        #expect(sorted[1] == .info)
        #expect(sorted[2] == .default)
        #expect(sorted[3] == .error)
        #expect(sorted[4] == .fault)
    }
    
    @Test("All log types have assigned colors")
    func colorsAreAssigned() {
        for type in OSLogType.allCases {
            let _ = type.color
        }
    }
    
    @Test("Specific log type colors match expected values")
    func specificColors() {
        #expect(OSLogType.debug.color == .green)
        #expect(OSLogType.info.color == .blue)
        #expect(OSLogType.default.color == .orange)
        #expect(OSLogType.error.color == .red)
        #expect(OSLogType.fault.color == .indigo)
    }
    
    @Test("Error and fault have distinct warning colors")
    func warningColors() {
        #expect(OSLogType.error.color == .red)
        #expect(OSLogType.fault.color == .indigo)
        #expect(OSLogType.error.color != OSLogType.fault.color)
    }
    
    @Test("AllCases contains exactly 5 standard log types")
    func allCasesCount() {
        #expect(OSLogType.allCases.count == 5)
    }
    
    @Test("AllCases contains all expected types")
    func allCasesComplete() {
        let allCases = OSLogType.allCases
        #expect(allCases.contains(.debug))
        #expect(allCases.contains(.info))
        #expect(allCases.contains(.default))
        #expect(allCases.contains(.error))
        #expect(allCases.contains(.fault))
    }
    
    @Test("AllCases are in severity order")
    func allCasesInOrder() {
        let severities = OSLogType.allCases.map(\.severity)
        let sortedSeverities = severities.sorted()
        #expect(severities == sortedSeverities)
    }
    
    @Test("Higher severity correlates with persistence")
    func severityCorrelatesWithPersistence() {
        #expect(!OSLogType.debug.isPersistedInProduction)
        #expect(!OSLogType.info.isPersistedInProduction)
        #expect(OSLogType.debug.severity < OSLogType.default.severity)
        #expect(OSLogType.info.severity < OSLogType.default.severity)
        #expect(OSLogType.default.isPersistedInProduction)
        #expect(OSLogType.error.isPersistedInProduction)
        #expect(OSLogType.fault.isPersistedInProduction)
    }
    
    @Test("Persistence boundary is between info and default")
    func persistenceBoundary() {
        #expect(!OSLogType.info.isPersistedInProduction)
        #expect(OSLogType.default.isPersistedInProduction)
        #expect(OSLogType.info.severity + 1 == OSLogType.default.severity)
    }
    
    @Test("OSLogType works with collections")
    func workWithCollections() {
        let types: [OSLogType] = [.debug, .error, .fault]
        #expect(types.count == 3)
        #expect(types.contains(.debug))
        #expect(!types.contains(.info))
    }
    
    @Test("OSLogType can be used in switch statements")
    func switchStatements() {
        let type = OSLogType.error
        let result = switch type {
        case .debug:   "debug"
        case .info:    "info"
        case .default: "default"
        case .error:   "error"
        case .fault:   "fault"
        default:       "unknown"
        }
        #expect(result == "error")
    }
}

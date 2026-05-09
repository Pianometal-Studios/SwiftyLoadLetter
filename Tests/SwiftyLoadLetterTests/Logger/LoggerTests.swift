import Testing
import Foundation
import os

@testable import SwiftyLoadLetter

/// Tests for the global logger convenience functions
@Suite("Logger Functions") struct LoggerTests {
    
    @Test("Logger function with message doesn't crash")
    func loggerWithMessage() {
        logger(.general, message: "Test message")
        logger(.network, message: "Network test message")
        logger(.auth, message: "Auth test message")
    }
    
    @Test("Logger function accepts all OSLogType levels")
    func loggerWithAllTypes() {
        logger(.general, message: "Debug message", type: .debug)
        logger(.general, message: "Info message", type: .info)
        logger(.general, message: "Notice message", type: .default)
        logger(.general, message: "Error message", type: .error)
        logger(.general, message: "Fault message", type: .fault)
    }
    
    @Test("Logger function defaults to debug type")
    func loggerDefaultType() {
        logger(.general, message: "Default type test")
    }
    
    @Test("Logger works with all categories")
    func loggerWithAllCategories() {
        for category in LogCategory.allCases {
            logger(category, message: "Test message for \(category.name)")
        }
    }
    
    @Test("Logger function with error doesn't crash")
    func loggerWithError() {
        let error = TestError.testCase
        logger(.general, error: error)
        logger(.network, error: error)
    }
    
    @Test("Logger error function accepts all OSLogType levels")
    func loggerErrorWithAllTypes() {
        let error = TestError.testCase
        
        logger(.general, error: error, type: .debug)
        logger(.general, error: error, type: .info)
        logger(.general, error: error, type: .default)
        logger(.general, error: error)
        logger(.general, error: error, type: .fault)
    }
    
    @Test("Logger error function defaults to debug type")
    func loggerErrorDefaultType() {
        let error = TestError.testCase
        logger(.general, error: error)
    }
    
    @Test("Logger error function uses localized description")
    func loggerErrorUsesLocalizedDescription() {
        let error = TestError.withDescription
        logger(.general, error: error, type: .debug)
    }
    
    @Test("Logger handles NSError objects")
    func loggerWithNSError() {
        let nsError = NSError(
            domain: "com.test.error",
            code: 404,
            userInfo: [NSLocalizedDescriptionKey: "Not found"])
        logger(.network, error: nsError)
    }
    
    @Test("Logger handles empty messages")
    func loggerWithEmptyMessage() {
        logger(.general, message: "")
        logger(.general, message: "", type: .error)
    }
    
    @Test("Logger handles very long messages")
    func loggerWithLongMessage() {
        let longMessage = String(
            repeating: "This is a very long message. ",
            count: 100)
        logger(.general, message: longMessage, type: .debug)
    }
    
    @Test("Logger handles special characters")
    func loggerWithSpecialCharacters() {
        logger(.general, message: "Message with emoji: 🎉 🚀 ✨")
        logger(.general, message: "Message with newline:\nSecond line")
        logger(.general, message: "Message with quotes: \"test\"")
        logger(.general, message: "Message with backslash: \\")
        logger(.general, message: "Message with percent: 100%")
        logger(.general, message: "Message with currency: $10.50")
    }
    
    @Test("Logger handles Unicode characters")
    func loggerWithUnicode() {
        logger(.general, message: "Unicode: 你好世界 مرحبا بالعالم")
        logger(.general, message: "Mathematical symbols: ∑∫∂∞")
        logger(.general, message: "Arrows: ← → ↑ ↓")
    }
    
    @Test("Logger handles string interpolation")
    func loggerWithInterpolation() {
        let value = 42
        let name = "Test"
        logger(.general, message: "Value: \(value), Name: \(name)")
    }
    
    @Test("Logger handles concurrent calls")
    func loggerConcurrent() async {
        await withTaskGroup(of: Void.self) { group in
            for i in 0..<10 {
                group.addTask {
                    logger(.general, message: "Concurrent message \(i)")
                }
            }
        }
    }
    
    @Test("Logger handles concurrent calls with different categories")
    func loggerConcurrentCategories() async {
        await withTaskGroup(of: Void.self) { group in
            for category in LogCategory.allCases {
                group.addTask {
                    logger(category, message: "Concurrent \(category.name)")
                }
            }
        }
    }
    
    @Test("Logger handles concurrent error logging")
    func loggerConcurrentErrors() async {
        let error = TestError.testCase
        
        await withTaskGroup(of: Void.self) { group in
            for _ in 0..<10 {
                group.addTask {
                    logger(.general, error: error)
                }
            }
        }
    }
    
    @Test("Logger handles all category-type combinations")
    func loggerAllCombinations() {
        for category in LogCategory.allCases {
            for type in OSLogType.allCases {
                logger(category, message: "Test \(category.name) \(type.name)", type: type)
            }
        }
    }
    
    @Test("Logger error handles all category-type combinations")
    func loggerErrorAllCombinations() {
        let error = TestError.testCase
        for category in LogCategory.allCases {
            for type in OSLogType.allCases {
                logger(category, error: error, type: type)
            }
        }
    }
    
    @Test("Logger handles different error types")
    func loggerWithVariousErrors() {
        logger(.general, error: TestError.testCase, type: .error)
        logger(.general, error: TestError.withDescription, type: .error)
        let nsError = NSError(domain: "test", code: 1)
        logger(.network, error: nsError)
        let urlError = URLError(.badURL)
        logger(.network, error: urlError)
    }
    
    @Test("Logger handles rapid sequential calls")
    func loggerRapidFire() {
        for i in 0..<100 {
            logger(.general, message: "Rapid message \(i)", type: .debug)
        }
    }
    
    @Test("Logger handles rapid error logging")
    func loggerRapidFireErrors() {
        let error = TestError.testCase
        for _ in 0..<100 {
            logger(.general, error: error, type: .debug)
        }
    }
    
    @Test("Logger preserves message formatting")
    func loggerPreservesFormatting() {
        logger(.general, message: "  Leading spaces")
        logger(.general, message: "Trailing spaces  ")
        logger(.general, message: "Multiple   spaces")
        logger(.general, message: "\tTab character")
    }
}

// MARK: - Test Helpers

/// Test error types for logger testing
private enum TestError: LocalizedError {
    
    case testCase
    case withDescription
    
    var errorDescription: String? {
        switch self {
        case .testCase:
            return "This is a test error"
        case .withDescription:
            return "Test error with custom description"
        }
    }
}

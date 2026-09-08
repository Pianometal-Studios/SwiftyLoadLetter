import Testing
import Foundation
import os

@testable import SwiftyLoadLetter

/// Tests for `MainBundle`'s accessors, every one of which logs a diagnostic when the value it
/// reads is absent. That makes them the layer a logger subsystem must never be read through,
/// so these tests exercise each miss path — all of them are reached in this bundle, which has
/// neither a bundle identifier nor the Info.plist keys the accessors look for.
@Suite("MainBundle") struct MainBundleTests {
    
    @Test("identifier mirrors the main bundle, present or absent")
    func identifierMirrorsMainBundle() {
        #expect(MainBundle.identifier == Bundle.main.bundleIdentifier)
    }
    
    @Test("An absent Info.plist key reads as nil")
    func absentInfoPlistKeyIsNil() {
        #expect(MainBundle.infoDictionary("SwiftyLoadLetterNotARealKey") == nil)
    }
    
    @Test("Each named accessor reads its own Info.plist key")
    func namedAccessorsReadTheirKeys() {
        #expect(MainBundle.appName == MainBundle.infoDictionary(MainBundle.Keys.appName.rawValue))
        #expect(MainBundle.appVersion == MainBundle.infoDictionary(MainBundle.Keys.appVersion.rawValue))
        #expect(MainBundle.build == MainBundle.infoDictionary(MainBundle.Keys.build.rawValue))
        #expect(MainBundle.name == MainBundle.infoDictionary(MainBundle.Keys.name.rawValue))
        #expect(MainBundle.typeIdentifier == MainBundle.infoDictionary(MainBundle.Keys.typeIdentifier.rawValue))
    }
    
    @Test("isAppExtension is true only for an XPC! package type")
    func isAppExtensionTracksPackageType() {
        #expect(MainBundle.isAppExtension == (MainBundle.typeIdentifier == "XPC!"))
    }
    
    /// Guards the cycle that made every log call overflow the stack in any host without a
    /// bundle identifier, this test bundle included: `LogCategory` read its logger's subsystem
    /// through ``MainBundle/identifier``, whose miss path logs, which built a logger again.
    ///
    /// A returning call is the assertion. A reintroduced cycle recurses instead of failing,
    /// taking the whole test process down with `SIGBUS` and reporting no results at all — so
    /// the count below stands in for "every combination came back".
    @Test("Logging terminates for every category and level")
    func loggingTerminatesForEveryCategoryAndLevel() {
        #expect(MainBundle.identifier == Bundle.main.bundleIdentifier)
        var completed = 0
        for category in LogCategory.allCases {
            for type in OSLogType.allCases {
                logger(category, message: "Recursion guard for \(category.name)", type: type)
                completed += 1
            }
        }
        #expect(completed == LogCategory.allCases.count * OSLogType.allCases.count)
    }
}

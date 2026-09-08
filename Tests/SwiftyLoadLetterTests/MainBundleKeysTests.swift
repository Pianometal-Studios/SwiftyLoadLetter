import Testing
import Foundation
@testable import SwiftyLoadLetter

/// Tests for `MainBundle.Keys`, whose `rawValue` is the literal Info.plist key each
/// case reads, so the accessors on `MainBundle` never restate a key string.
@Suite("MainBundle.Keys") struct MainBundleKeysTests {

    @Test("Each key maps to its Info.plist key string")
    func infoPlistKeyMapping() {
        #expect(MainBundle.Keys.build.rawValue == "CFBundleVersion")
        #expect(MainBundle.Keys.appName.rawValue == "CFBundleDisplayName")
        #expect(MainBundle.Keys.name.rawValue == "CFBundleName")
        #expect(MainBundle.Keys.appVersion.rawValue == "CFBundleShortVersionString")
        #expect(MainBundle.Keys.urlTypes.rawValue == "CFBundleURLTypes")
        #expect(MainBundle.Keys.typeIdentifier.rawValue == "CFBundlePackageType")
    }

    @Test("allCases covers every key exactly once")
    func allCasesIsComplete() {
        let rawValues = MainBundle.Keys.allCases.map(\.rawValue)
        #expect(rawValues.count == 6)
        #expect(Set(rawValues).count == rawValues.count)
    }

    @Test("Every key carries a distinct name and non-empty details")
    func nameAndDetails() {
        let names = MainBundle.Keys.allCases.map(\.name)
        #expect(Set(names).count == names.count)
        for key in MainBundle.Keys.allCases {
            #expect(!key.name.isEmpty)
            #expect(!key.details.isEmpty)
        }
    }

    @Test("A key's rawValue doubles as its CodingKey stringValue")
    func codingKeyMirrorsRawValue() {
        for key in MainBundle.Keys.allCases {
            #expect(key.stringValue == key.rawValue)
            #expect(key.intValue == nil)
        }
    }
}

import Testing
import os

/// Tests for the `isPersistedInProduction` property of `OSLogType`
@Suite("OSLogType") struct OSLogTypeTests {

    @Test("Debug is not persisted in production") func debugNotPersisted() {
        #expect(OSLogType.debug.isPersistedInProduction == false)
    }

    @Test("Info is not persisted in production") func infoNotPersisted() {
        #expect(OSLogType.info.isPersistedInProduction == false)
    }

    @Test("Default (Notice) is persisted in production") func defaultPersisted() {
        #expect(OSLogType.default.isPersistedInProduction == true)
    }

    @Test("Error is persisted in production") func errorPersisted() {
        #expect(OSLogType.error.isPersistedInProduction == true)
    }

    @Test("Fault is persisted in production") func faultPersisted() {
        #expect(OSLogType.fault.isPersistedInProduction == true)
    }
}

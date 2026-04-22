import Testing
@testable import SwiftyLoadLetter

/// Tests for `Staticable` protocol conformance and default implementations.
@Suite("Staticable") struct StaticableTests {
    
    private enum DemoKey: String, Staticable {
        case alpha, beta
    }
    
    @Test("customizationID contains rawValue")
    func customizationIDContainsRawValue() {
        #expect(DemoKey.alpha.customizationID.contains("alpha"))
        #expect(DemoKey.beta.customizationID.contains("beta"))
    }
    
    @Test("id returns self")
    func idReturnsSelf() {
        #expect(DemoKey.alpha.id == .alpha)
        #expect(DemoKey.beta.id == .beta)
    }
    
    @Test("rawValue matches case name")
    func rawValueMatchesCaseName() {
        #expect(DemoKey.alpha.rawValue == "alpha")
        #expect(DemoKey.beta.rawValue == "beta")
    }
}

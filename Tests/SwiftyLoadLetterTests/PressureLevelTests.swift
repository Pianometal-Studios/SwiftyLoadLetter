import Testing
import Foundation
@testable import SwiftyLoadLetter

/// Tests for `PressureLevel` enum and its properties.
@Suite("PressureLevel") struct PressureLevelTests {
    
    @Test("init(fraction:) below 0.60 → .normal")
    func normalThreshold() {
        #expect(0.00.pressureLevel == .normal)
        #expect(0.30.pressureLevel == .normal)
        #expect(0.59.pressureLevel == .normal)
    }
    
    @Test("init(fraction:) 0.60 ..< 0.80 → .warning")
    func warningThreshold() {
        #expect(0.60.pressureLevel == .warning)
        #expect(0.70.pressureLevel == .warning)
        #expect(0.79.pressureLevel == .warning)
    }
    
    @Test("init(fraction:) ≥ 0.80 → .critical")
    func criticalThreshold() {
        #expect(0.80.pressureLevel == .critical)
        #expect(0.95.pressureLevel == .critical)
        #expect(1.00.pressureLevel == .critical)
    }
}

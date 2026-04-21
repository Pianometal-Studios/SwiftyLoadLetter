import Testing
@testable import SwiftyLoadLetter

/// Tests for `Double` extensions in SwiftyLoadLetter.
@Suite("Double") struct DoubleTests {

    @Test(
        "isValid returns false for NaN and infinite values",
        arguments: [Double.nan, .infinity, -.infinity, .signalingNaN]
    )
    func isValidFalseForInvalidValues(value: Double) {
        #expect(value.isValid == false)
    }

    @Test(
        "isValid returns true for finite values",
        arguments: [0.0, -1.0, 1.0, Double.greatestFiniteMagnitude]
    )
    func isValidTrueForFiniteValues(value: Double) {
        #expect(value.isValid == true)
    }

    @Test("percentage divides by 100")
    func percentage() {
        #expect(25.0.percentage == 0.25)
        #expect(100.0.percentage == 1.0)
        #expect(0.0.percentage == 0.0)
    }

    @Test("pressureLevel returns .unknown for NaN")
    func pressureLevelNaN() {
        #expect(Double.nan.pressureLevel == .unknown)
    }

    @Test("pressureLevel returns .unknown for infinite values")
    func pressureLevelInfinite() {
        #expect(Double.infinity.pressureLevel == .unknown)
        #expect((-Double.infinity).pressureLevel == .unknown)
    }
}

import Testing
import Foundation
@testable import SwiftyLoadLetter

/// Tests for the `ProcessInfo.ThermalState` pressure mapping.
@Suite("ThermalState") struct ThermalStateTests {

    @Test("Each state folds onto the expected pressure level", arguments: [
        (ProcessInfo.ThermalState.nominal, PressureLevel.normal),
        (.fair, .warning),
        (.serious, .critical),
        (.critical, .critical)
    ])
    func pressureLevel(state: ProcessInfo.ThermalState, expected: PressureLevel) {
        #expect(state.pressureLevel == expected)
    }

    @Test("Only serious and critical are elevated", arguments: ProcessInfo.ThermalState.allCases)
    func isElevated(state: ProcessInfo.ThermalState) {
        #expect(state.isElevated == (state == .serious || state == .critical))
    }

    @Test("Pressure never decreases as the state worsens")
    func pressureIsMonotonic() {
        let levels = ProcessInfo.ThermalState.allCases.map(\.pressureLevel)
        #expect(levels == levels.sorted())
    }
}

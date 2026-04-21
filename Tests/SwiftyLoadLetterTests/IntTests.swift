import Testing
@testable import SwiftyLoadLetter

/// Tests for SwiftyLoadLetter `Int` extensions.
@Suite("Int.bluetoothSignalQuality") struct IntTests {

    @Test(
        "RSSI thresholds map to correct SignalQuality",
        arguments: [
            (-50, SignalQuality.excellent),
            (-60, SignalQuality.excellent),
            (-61, SignalQuality.good),
            (-70, SignalQuality.good),
            (-71, SignalQuality.fair),
            (-80, SignalQuality.fair),
            (-81, SignalQuality.poor),
            (-100, SignalQuality.poor)
        ]
    )
    func bluetoothSignalQuality(rssi: Int, expected: SignalQuality) {
        #expect(rssi.bluetoothSignalQuality == expected)
    }
}

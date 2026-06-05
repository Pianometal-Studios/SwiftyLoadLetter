import Testing
import Foundation
@testable import SwiftyLoadLetter

/// Tests for the `ConnectionState` enum and its name and icon mappings.
@Suite("ConnectionState") struct ConnectionStateTests {

    @Test("Has four cases")
    func caseCount() {
        #expect(ConnectionState.allCases.count == 4)
    }

    @Test("Every case has a non-empty name and icon", arguments: ConnectionState.allCases)
    func metadataPresent(state: ConnectionState) {
        #expect(!state.name.isEmpty)
        #expect(!state.icon.isEmpty)
    }

    @Test("Raw value round-trips", arguments: ConnectionState.allCases)
    func rawValueRoundTrips(state: ConnectionState) {
        #expect(ConnectionState(rawValue: state.rawValue) == state)
    }

    @Test("Names match expected values", arguments: [
        (ConnectionState.connected, "Connected"),
        (.connecting, "Connecting"),
        (.disconnecting, "Disconnecting"),
        (.disconnected, "Disconnected")
    ])
    func names(state: ConnectionState, expected: String) {
        #expect(state.name == expected)
    }

    @Test("Encodes and decodes round-trip", arguments: ConnectionState.allCases)
    func codableRoundTrip(state: ConnectionState) throws {
        let data = try JSONEncoder().encode(state)
        let decoded = try JSONDecoder().decode(ConnectionState.self, from: data)
        #expect(decoded == state)
    }
}

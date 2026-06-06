import Testing
import Foundation
@testable import SwiftyLoadLetter

/// Tests for the `ConnectionState` enum and its name and icon mappings.
@Suite("ConnectionState") struct ConnectionStateTests {

    @Test("Raw value round-trips", arguments: ConnectionState.allCases)
    func rawValueRoundTrips(state: ConnectionState) {
        #expect(ConnectionState(rawValue: state.rawValue) == state)
    }

    @Test("Encodes and decodes round-trip", arguments: ConnectionState.allCases)
    func codableRoundTrip(state: ConnectionState) throws {
        let data = try JSONEncoder().encode(state)
        let decoded = try JSONDecoder().decode(ConnectionState.self, from: data)
        #expect(decoded == state)
    }
}

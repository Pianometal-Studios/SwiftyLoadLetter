import Testing
@testable import SwiftyLoadLetter

/// Tests for the `AppleOS` enum covering its metadata and current-platform detection.
@Suite("AppleOS") struct AppleOSTests {

    @Test("Raw value round-trips", arguments: AppleOS.allCases)
    func rawValueRoundTrips(os: AppleOS) {
        #expect(AppleOS(rawValue: os.rawValue) == os)
    }

    @Test("Touch-input platforms are iOS, iPadOS, and visionOS", arguments: [
        AppleOS.iOS, .iPadOS, .visionOS
    ])
    func supportsTouch(os: AppleOS) {
        #expect(os.supportsTouchInput)
    }

    @Test("Non-touch platforms are macOS, tvOS, and watchOS", arguments: [
        AppleOS.macOS, .tvOS, .watchOS
    ])
    func doesNotSupportTouch(os: AppleOS) {
        #expect(!os.supportsTouchInput)
    }

    @MainActor @Test("Exactly one case is current on the running platform")
    func exactlyOneCurrent() {
        let current = AppleOS.allCases.filter { $0.isCurrent }
        #expect(current.count == 1)
    }

    @MainActor @Test("current resolves to a case that reports isCurrent")
    func currentIsCurrent() {
        #expect(AppleOS.current.isCurrent)
    }
}

import Testing
@testable import SwiftyLoadLetter

/// Tests for the `AppleOS` enum covering its metadata and current-platform detection.
@Suite("AppleOS") struct AppleOSTests {

    @Test("Has six cases")
    func caseCount() {
        #expect(AppleOS.allCases.count == 6)
    }

    @Test("Every case has a non-empty name, device, and icon", arguments: AppleOS.allCases)
    func metadataPresent(os: AppleOS) {
        #expect(!os.name.isEmpty)
        #expect(!os.device.isEmpty)
        #expect(!os.icon.isEmpty)
    }

    @Test("Raw value round-trips", arguments: AppleOS.allCases)
    func rawValueRoundTrips(os: AppleOS) {
        #expect(AppleOS(rawValue: os.rawValue) == os)
    }

    @Test("Device names match expected values", arguments: [
        (AppleOS.iOS, "iPhone"),
        (.iPadOS, "iPad"),
        (.macOS, "Mac"),
        (.tvOS, "Apple TV"),
        (.watchOS, "Apple Watch"),
        (.visionOS, "Vision Pro")
    ])
    func deviceNames(os: AppleOS, expected: String) {
        #expect(os.device == expected)
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

    @MainActor
    @Test("Exactly one case is current on the running platform")
    func exactlyOneCurrent() {
        let current = AppleOS.allCases.filter { $0.isCurrent }
        #expect(current.count == 1)
    }

    @MainActor
    @Test("current resolves to a case that reports isCurrent")
    func currentIsCurrent() {
        #expect(AppleOS.current.isCurrent)
    }
}

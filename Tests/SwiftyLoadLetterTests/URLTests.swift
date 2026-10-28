import Testing
import SwiftUI
@testable import SwiftyLoadLetter

/// Tests for SwiftyLoadLetter `URL.create` extension.
@Suite("URLTests") struct URLTests {
    
    @Test func testURLCreateValid() async throws {
        #expect(URL.create("https://www.apple.com")?.host == "www.apple.com")
        #expect(URL.create("http://apple.com")?.host == "apple.com")
    }
    
    @Test func testURLCreateInvalidString() async throws {
        #expect(URL.create("not a url") == nil)
        #expect(URL.create("") == nil)
        #expect(URL.create("ht!tp://bad_url") == nil)
    }
    
    @Test func testURLCreateNoHost() async throws {
        #expect(URL.create("file:///Users/test/file.txt") == nil)
        #expect(URL.create("customscheme://") == nil)
        #expect(URL.create("mailto:user@example.com") == nil)
    }
    
    @Test func testURLCreateHostEdgeCases() async throws {
        #expect(URL.create("https://") == nil)
        #expect(URL.create("https://?query=param") == nil)
        #expect(URL.create("https://#fragment") == nil)
    }

    @Test("Settings URLs exist where the platform has them")
    func settingsURLs() {
#if os(iOS) || os(tvOS) || os(visionOS)
        #expect(URL.appSettings != nil)
        #expect(URL.notificationSettings != nil)
#elseif os(macOS)
        #expect(URL.appSettings == nil)
        #expect(URL.notificationSettings?.scheme == "x-apple.systempreferences")
#else
        #expect(URL.appSettings == nil)
        #expect(URL.notificationSettings == nil)
#endif
    }
}

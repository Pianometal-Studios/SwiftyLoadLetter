import Testing
import SwiftUI
@testable import SwiftyLoadLetter

/// Tests for the `ColorScheme` contrast colors.
@Suite("ColorScheme") struct ColorSchemeTests {

    @Test("Dark Mode draws white on black")
    func darkContrast() {
        #expect(ColorScheme.dark.primary == .white)
        #expect(ColorScheme.dark.inverse == .black)
    }

    @Test("Light Mode draws black on white")
    func lightContrast() {
        #expect(ColorScheme.light.primary == .black)
        #expect(ColorScheme.light.inverse == .white)
    }

    @Test("An unknown scheme falls back to the light colors")
    func unknownContrast() {
        let scheme: ColorScheme? = nil
        #expect(scheme.primary == .black)
        #expect(scheme.inverse == .white)
    }

    @Test("Primary and inverse always differ", arguments: [ColorScheme.light, .dark])
    func primaryDiffersFromInverse(scheme: ColorScheme) {
        #expect(scheme.primary != scheme.inverse)
    }
}

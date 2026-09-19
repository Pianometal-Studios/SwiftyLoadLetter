import Testing
import SwiftUI
@testable import SwiftyLoadLetter

/// Tests for the `GestureInputKinds` metadata, and in particular for the decomposition
/// that lets a combined option set render as one label per kind.
@Suite("GestureInputKinds") struct GestureInputKindsTests {

    @Test("allCases lists the four individual kinds and excludes .all")
    func allCasesExcludesAll() {
        #expect(GestureInputKinds.allCases.count == 4)
        #expect(!GestureInputKinds.allCases.contains(.all))
        #expect(GestureInputKinds.allCases == [.directTouch, .pencil, .indirectTouch, .pointer])
    }

    @Test("Every individual kind has a name, an icon and details")
    func everyKindIsDescribed() {
        for kind in GestureInputKinds.allCases {
            #expect(!kind.name.isEmpty)
            #expect(!kind.icon.isEmpty)
            #expect(!kind.details.isEmpty)
        }
    }

    @Test("An individual kind decomposes to just itself")
    func singleKindDecomposesToItself() {
        for kind in GestureInputKinds.allCases {
            #expect(kind.kinds == [kind])
        }
    }

    @Test("A combined value decomposes into its members, in allCases order")
    func combinedValueDecomposes() {
        let kinds: GestureInputKinds = [.pointer, .pencil]
        #expect(kinds.kinds == [.pencil, .pointer])
    }

    @Test(".all decomposes into every individual kind")
    func allDecomposesIntoEveryKind() {
        #expect(GestureInputKinds.all.kinds == GestureInputKinds.allCases)
    }

    @Test("A combined value composes its members' names")
    func combinedValueComposesItsName() {
        let kinds: GestureInputKinds = [.pencil, .pointer]
        #expect(kinds.name.contains("Pencil"))
        #expect(kinds.name.contains("Pointer"))
    }

    @Test("An empty value reads as none rather than falling back to a kind")
    func emptyValueReadsAsNone() {
        let empty = GestureInputKinds()
        #expect(empty.kinds.isEmpty)
        #expect(empty.name == "None")
        #expect(empty.icon == "nosign")
        #expect(empty.color == .gray)
    }

    @Test(".all is named for the union, not for its members")
    func allIsNamedForTheUnion() {
        #expect(GestureInputKinds.all.name == "All")
        #expect(GestureInputKinds.all.color == .purple)
    }
}

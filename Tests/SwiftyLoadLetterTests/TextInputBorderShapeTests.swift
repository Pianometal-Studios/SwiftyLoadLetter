import Testing
import SwiftUI
@testable import SwiftyLoadLetter

/// Tests for the `TextInputBorderShape` metadata. The type is a struct of static
/// properties rather than an enum, so `allCases` is hand-written and has to be checked.
@Suite("TextInputBorderShape") struct TextInputBorderShapeTests {

    @Test("allCases lists the three shapes the SDK vends, system choice first")
    func allCasesListsEveryShape() {
        #expect(TextInputBorderShape.allCases == [.automatic, .capsule, .roundedRectangle])
    }

    @Test("Every shape has a name, an icon and details")
    func everyShapeIsDescribed() {
        for shape in TextInputBorderShape.allCases {
            #expect(!shape.name.isEmpty)
            #expect(!shape.icon.isEmpty)
            #expect(!shape.details.isEmpty)
            #expect(shape.name != "Undefined")
        }
    }

    @Test("Names read as the SDK spells them")
    func namesMatchTheSDK() {
        #expect(TextInputBorderShape.automatic.name == "Automatic")
        #expect(TextInputBorderShape.capsule.name == "Capsule")
        #expect(TextInputBorderShape.roundedRectangle.name == "Rounded Rectangle")
    }

    @Test("Each shape has a distinct icon")
    func iconsAreDistinct() {
        let icons = TextInputBorderShape.allCases.map(\.icon)
        #expect(Set(icons).count == icons.count)
    }

    @Test("The companion objects carry the same metadata")
    func companionObjectsMatch() {
        for shape in TextInputBorderShape.allCases {
            #expect(shape.iconableObject.name == shape.name)
            #expect(shape.iconableObject.icon == shape.icon)
            #expect(shape.describableObject.details == shape.details)
        }
    }
}

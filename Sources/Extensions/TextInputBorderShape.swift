//
//  TextInputBorderShape.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 9/19/26.
//  Apache License 2.0
//

public import SwiftUI

public extension TextInputBorderShape {
    
    var color: Color {
        switch self {
        case .automatic:        .gray
        case .capsule:          .blue
        case .roundedRectangle: .indigo
        default:                .gray
        }
    }
    
    var describableObject: DescribableObject {
        .init(name, icon: icon, details: details)
    }
    
    var details: String {
        switch self {
        case .automatic:
            "The border the platform picks for the field's context."
        case .capsule:
            "Fully rounded ends, for a pill-shaped field."
        case .roundedRectangle:
            "Rounded corners on a rectangular field."
        default:
            "Unknown text input border shape."
        }
    }
    
    var icon: String {
        switch self {
        case .automatic:        "rectangle.dashed"
        case .capsule:          "capsule"
        case .roundedRectangle: "rectangle"
        default:                "exclamationmark.triangle"
        }
    }
    
    var iconableObject: IconableObject {
        .init(name, icon: icon)
    }
    
    var name: String {
        switch self {
        case .automatic:        "Automatic"
        case .capsule:          "Capsule"
        case .roundedRectangle: "Rounded Rectangle"
        default:                "Undefined"
        }
    }
    
    /// An array of the `TextInputBorderShape` values the SDK vends, with the system's own
    /// choice first.
    ///
    /// The type is a struct of static properties rather than an enum, so it has no synthesized
    /// `CaseIterable` conformance to draw on.
    ///
    /// - Returns: [.automatic, .capsule, .roundedRectangle]
    static let allCases: [Self] = [
        .automatic,
        .capsule,
        .roundedRectangle
    ]
}

// MARK: - Preview

#if DEBUG
#Preview {
    @Previewable @State var text = ""
    NavigationStack {
        List(TextInputBorderShape.allCases, id: \.name) { shape in
            LabeledContent {
                TextField(shape.name, text: $text)
                    .textFieldStyle(.bordered)
                    .textInputBorderShape(shape)
            } label: {
                Label {
                    Text(shape.name)
                    Text(shape.details)
                } icon: {
                    Image(systemName: shape.icon)
                        .foregroundStyle(shape.color)
                }
            }
        }
        .navigationTitle("Text Input Borders")
    }
}
#endif

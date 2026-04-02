//
//  FontDesign.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import SwiftUI

public extension Font.Design {
    
    var name: String {
        switch self {
        case .default:    "Default"
        case .serif:      "Serif"
        case .rounded:    "Rounded"
        case .monospaced: "Monospaced"
        @unknown default: "Unknown"
        }
    }
    
    /// An array of all available `Font.Design` cases, sorted by typical usage and preference order.
    ///
    /// - Returns: [.default, .serif, .rounded, .monospaced]
    static let allCases: [Font.Design] = [
        .default,
        .serif,
        .rounded,
        .monospaced
    ]
}

// MARK: - Preview

#if DEBUG
#Preview {
    @Previewable @State var design = Font.Design.default
    VStack {
        VStack {
            Text(design.name)
                .font(.largeTitle)
            Text("The quick brown fox jumps over the lazy dog.")
                .font(.caption)
        }
        .contentTransition(.numericText())
        .fontDesign(design)
        .padding()
        ForEach(Font.Design.allCases, id: \.self) { style in
            Button {
                withAnimation(.smooth) {
                    design = style
                }
            } label: {
                Text(style.name)
                    .font(.title2)
                    .fontDesign(style)
                    .foregroundStyle(design == style ? .primary : .secondary)
                    .padding()
            }
            .glassButton(or: .borderedProminent)
        }
    }
    .tint(.primary)
}
#endif

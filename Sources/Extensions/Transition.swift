//
//  Transition.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import SwiftUI

public extension View {
    
    /// Applies an asymmetric transition that both moves and fades the view during insertion and removal.
    ///
    /// The transition uses a push move combined with an opacity fade:
    /// - On insertion, the view is pushed in from the specified edge while fading in.
    /// - On removal, the view is pushed out toward the opposite edge while fading out.
    ///
    /// ## Example
    /// ```swift
    /// SomeView()
    ///     .fadeInOut(from: .bottom)
    /// ```
    ///
    /// - Parameter edge: The edge from which the view should enter on insertion. The removal
    ///   will automatically use the opposite edge.
    ///
    /// - Returns: A view modified with the described transition.
    func fadeInOut(from edge: Edge) -> some View {
        transition(
            .asymmetric(
                insertion: .push(from: edge)
                    .combined(with: .opacity),
                removal: .push(from: edge.opposite)
                    .combined(with: .opacity)
            )
        )
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    @Previewable @State var showDetail = false
    NavigationStack {
        VStack {
            Button("Toggle Detail") {
                withAnimation {
                    showDetail.toggle()
                }
            }
            if showDetail {
                Text("This is the detail view.")
                    .padding()
                    .fadeInOut(from: .bottom)
            }
        }
        .navigationTitle("Fade In/Out")
    }
}
#endif

//
//  Redacted.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import SwiftUI

public extension View {
    
    /// Conditionally applies the `.placeholder` redaction effect. based on a Boolean flag.
    ///
    /// This is a convenience overload of SwiftUI’s `redacted(reason:)` modifier that
    /// toggles the placeholder redaction state on or off.
    ///
    /// - Parameter isRedacted: A Boolean value indicating whether the view should be
    ///   displayed in a placeholder (redacted) state. Pass `true` to apply redaction,
    ///   or `false` to remove it. The default value is `true`, allowing you to simply
    ///   call `.redacted()` to apply the placeholder effect.
    ///
    /// - Returns:
    ///   - When `isRedacted` is `true`, the view is displayed using `.placeholder`
    ///     redaction styling (commonly used to represent loading skeletons).
    ///   - When `false`, the redaction is removed and the view renders normally.
    func redacted(_ isRedacted: Bool = true) -> some View {
        redacted(reason: isRedacted ? .placeholder : [])
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    @Previewable @State var isRedacted = true
    VStack {
        Text("This is an example of redacted content.")
            .redacted(isRedacted)
        Button {
            withAnimation {
                isRedacted.toggle()
            }
        } label: {
            Text(isRedacted ? "Show" : "Redact")
                .font(.title2)
        }
        .glassButton()
        .padding()
    }
}
#endif

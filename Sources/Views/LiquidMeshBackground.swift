//
//  LiquidMeshBackground.swift
//  SwiftyLoadLetter
//
//  Created by Anders Tabell on 2/21/26.
//  Apache License 2.0
//

import SwiftUI

/// Renders a soft, animated “liquid mesh” background using two
/// blurred circles that drift over time. The effect creates gentle, organic movement suitable
/// for hero screens, onboarding, or as a subtle backdrop behind content.
///
/// The animation is driven by a binding to `isAnimating`. When the view appears, it
/// automatically triggers a repeating, ease-in-out animation that alternates the circles’
/// offsets, producing a smooth, reversible motion on both axes. The two circles use the
/// provided `color1` and `color2` with reduced opacity and heavy blur to achieve a
/// diffused, layered glow.
///
/// ## Example
/// ```swift
/// @State private var isAnimating = false
///
/// var body: some View {
///
///     ContentView()
///         .onAppear { isAnimating = true }
///         .background {
///             LiquidMeshBackground(
///                 color1: .blue,
///                 color2: .purple,
///                 isAnimating: $isAnimating)
///         }
/// }
/// ```
///
/// - Parameters:
///   - color1: The base color for the first circle, which is larger and more blurred.
///   - color2: The base color for the second circle, which is smaller and less blurred.
///   - isAnimating: A binding that triggers the animation when set to `true`
///
/// - Authors: [@anderstabell](https://github.com/anderstabell)
public struct LiquidMeshBackground: View {
    
    public let color1: Color
    public let color2: Color
    
    @Binding public var isAnimating: Bool
    
    public var body: some View {
        
        ZStack {
            
            Circle()
                .fill(color1.opacity(0.3))
                .frame(width: 400)
                .blur(radius: 80)
                .offset(
                    x: xOffset(positiveNumberFirst: true),
                    y: yOffset(isPositive: false))
            
            Circle()
                .fill(color2.opacity(0.2))
                .frame(width: 300)
                .blur(radius: 60)
                .offset(
                    x: xOffset(positiveNumberFirst: false),
                    y: yOffset(isPositive: true))
        }
        .ignoresSafeArea()
        .onAppear { startAnimation() }
    }
    
    /// Triggers the background animation by setting `startAnimation` to `true`
    /// inside a repeating, ease-in-out animation block.
    ///
    /// - Call this from `.onAppear` to automatically start the effect when the view enters
    /// the hierarchy.
    /// - The animation continues indefinitely until the view disappears or is
    /// deallocated.
    private func startAnimation() {
        withAnimation(.easeInOut(duration: 7).repeatForever(autoreverses: true)) {
            isAnimating = true
        }
    }
    
    /// Computes a vertical offset for the animated background circles, switching between
    /// vertical and horizontal values based on the current animation state and desired direction.
    ///
    /// - Parameter isPositive: A Boolean that determines the sign of the offset values.
    ///   - When `true` (default), both the vertical (`y1`) and horizontal (`x1`) components are positive.
    ///   - When `false`, both components are negated, producing movement in the opposite direction.
    /// - Returns: A `CGFloat` representing the offset to apply on the y-axis. When `startAnimation`
    ///   is `true`, the function returns the (possibly signed) vertical magnitude `y1`; when
    ///   `startAnimation` is `false`, it returns the (possibly signed) horizontal magnitude `x1`.
    /// - Note: This method relies on the view’s `startAnimation` binding to toggle between
    ///   vertical and horizontal offset values, creating a smooth, reversible animation path.
    private func yOffset(isPositive: Bool = true) -> CGFloat {
        isAnimating ?
        isPositive ? bigNumber : -bigNumber :
        isPositive ? smallNumber : -smallNumber
    }
    
    /// Computes a horizontal offset for the animated background circles, switching the sign
    /// order based on the `positiveNumberFirst` flag and the current animation state.
    ///
    /// - Parameter positiveNumberFirst: A Boolean that controls the sign precedence of the
    ///   horizontal offset.
    ///   - When `true`, the function prefers a positive offset when `isAnimating` is `true`,
    ///     and a negative offset when `isAnimating` is `false`.
    ///   - When `false`, the sign order is reversed: a negative offset when `isAnimating`
    ///     is `true`, and a positive offset when `isAnimating` is `false`.
    /// - Returns: A `CGFloat` representing the horizontal offset to apply on the x-axis,
    ///   either `smallNumber` or `-smallNumber`, chosen according to the parameters above.
    private func xOffset(positiveNumberFirst: Bool = true) -> CGFloat {
        return positiveNumberFirst ? positiveFirst() : negativeFirst()
        
        func positiveFirst() -> CGFloat {
            isAnimating ? smallNumber : -smallNumber
        }
        
        func negativeFirst() -> CGFloat {
            isAnimating ? -smallNumber : smallNumber
        }
    }
    
    /// Fixed offset values for the animation, defined as constants for clarity and maintainability.
    private let smallNumber: CGFloat = 100
    
    /// A larger offset value used for more dramatic movement in the animation, defined as a constant.
    private let bigNumber: CGFloat = 200
    
    public init(
        color1: Color,
        color2: Color,
        isAnimating: Binding<Bool>
    ) {
        self.color1 = color1
        self.color2 = color2
        _isAnimating = isAnimating
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    @Previewable @State var isAnimating = false
    LiquidMeshBackground(
        color1: .red,
        color2: .orange,
        isAnimating: $isAnimating)
}
#endif

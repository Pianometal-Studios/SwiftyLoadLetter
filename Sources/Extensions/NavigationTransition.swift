//
//  NavigationTransition.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 9/19/26.
//  Apache License 2.0
//

public import SwiftUI

public extension NavigationTransition {
    
    /// Wraps this transition in a type-erasing `AnyNavigationTransition`.
    ///
    /// `NavigationTransition` has an associated-type-free but still opaque conformance surface,
    /// so two different transitions cannot be produced by the same expression — a `switch` or a
    /// ternary that chooses between `.zoom` and `.automatic` does not type-check, and neither
    /// does storing a transition in a property whose type must be written down. Erasing both
    /// sides to `AnyNavigationTransition` resolves it.
    ///
    /// ## Example
    /// ```swift
    /// var transition: AnyNavigationTransition {
    ///     reduceMotion
    ///     ? NavigationTransition.automatic.eraseToAnyNavigationTransition()
    ///     : NavigationTransition.zoom(sourceID: id, in: namespace).eraseToAnyNavigationTransition()
    /// }
    ///
    /// DetailView()
    ///     .navigationTransition(transition)
    /// ```
    ///
    /// - Returns: An `AnyNavigationTransition` wrapping the receiver.
    func eraseToAnyNavigationTransition() -> AnyNavigationTransition {
        .init(self)
    }
}

public extension View {
    
    /// Applies a cross-fade navigation transition where the platform provides one.
    ///
    /// A cross fade suits a push whose destination shares no geometry with its source, where the
    /// default slide implies a spatial relationship that isn't there. It is unavailable on macOS,
    /// so call sites need no platform check of their own.
    ///
    /// ## Example
    /// ```swift
    /// NavigationStack {
    ///     List(articles) { article in
    ///         NavigationLink(article.name, value: article)
    ///     }
    ///     .navigationDestination(for: Article.self) { article in
    ///         ArticleView(article)
    ///             .crossFadeNavigation()
    ///     }
    /// }
    /// ```
    ///
    /// - Returns:
    ///   - A view that cross-fades as it is pushed and popped, on every platform but macOS.
    ///   - On macOS, the original view is returned unmodified.
    ///
    /// - Important: Apply this to the *destination*, not to the stack. A navigation transition
    ///   describes how the view it is attached to arrives and leaves.
    @ViewBuilder func crossFadeNavigation() -> some View {
#if !os(macOS)
        navigationTransition(.crossFade)
#else
        self
#endif
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(CompassPoint.allCases) { point in
            NavigationLink(value: point) {
                Label(point.name, systemImage: point.icon)
            }
        }
        .navigationTitle("Cross Fade")
        .navigationDestination(for: CompassPoint.self) { point in
            Label(point.name, systemImage: point.icon)
                .font(.largeTitle)
                .navigationTitle(point.name)
                .crossFadeNavigation()
        }
    }
}
#endif

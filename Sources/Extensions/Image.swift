//
//  Image.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 2/24/26.
//  MIT License
//

import SwiftUI

public extension Image {
    
    /// Scales the image by making it resizable and applying the specified content mode.
    ///
    /// This convenience method wraps common image-scaling behavior by
    /// - Marking the image as resizable, allowing it to expand or contract within its layout.
    /// - Applying an aspect ratio with the provided `ContentMode` to control how the image fits its
    ///  available space.
    ///
    /// Use this when you want a concise way to display an image that scales appropriately within
    /// its container while preserving (or filling) its aspect ratio.
    ///
    /// ## Example
    /// ```swift
    /// Image(.myImageResource)
    ///    .scaled(to: .fill)
    /// ```
    ///
    /// - Parameter contentMode: The strategy used to fit the image within its available space.
    /// The default value is `.fit`.
    ///
    /// - Returns: A view that renders the image as resizable and scaled according to the specified
    /// content mode.
    @MainActor func scaled(to contentMode: ContentMode = .fit) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: contentMode)
    }
}

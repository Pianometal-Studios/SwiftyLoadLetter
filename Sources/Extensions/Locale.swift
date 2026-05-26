//
//  Locale.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/11/26.
//  Apache License 2.0
//

import Foundation

public extension Locale {
    
    /// The localized name of the current locale.
    ///
    /// This property returns the human-readable name of the current locale in the user's preferred language.
    /// For example, if the current locale is `en_US`, this might return "English (United States)".
    ///
    /// - Returns: The localized locale name, or `nil` if the locale name cannot be determined.
    ///
    /// - Note: If the locale name cannot be retrieved, an error is logged to the system logger.
    var name: String? {
        guard let identifier = self.localizedString(forIdentifier: self.identifier) else {
            logger(
                .system,
                message: "Failed to get locale name",
                type: .error)
            return nil
        }
        return identifier
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI
#Preview {
    NavigationStack {
        List {
            LabeledContent("Name", value: Locale.current.name ?? "-")
        }
        .navigationTitle("Locale")
    }
}
#endif

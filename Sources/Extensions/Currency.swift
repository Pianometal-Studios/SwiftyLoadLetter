//
//  Currency.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 5/11/26.
//  MIT License
//

import Foundation

public extension Locale {
    
    /// The ISO 4217 currency code for the current locale.
    ///
    /// This property returns the three-letter currency code associated with the current locale,
    /// such as "USD" for US Dollars, "EUR" for Euros, or "JPY" for Japanese Yen.
    ///
    /// ## Example
    ///
    /// ```swift
    /// if let currency = Locale.current.currencyIdentifier {
    ///     print("Currency code: \(currency)")
    /// }
    /// ```
    /// - Returns: The currency identifier, or `nil` if the locale doesn't have an associated currency.
    ///
    /// - Note: If the currency identifier cannot be retrieved, an error is logged to the system logger.
    var currencyIdentifier: String? {
        guard let identifier = currency?.identifier else {
            logger(
                .system,
                message: "Failed to get currency identifier",
                type: .error)
            return nil
        }
        return identifier
    }
    
    /// The currency symbol for the current locale.
    ///
    /// This property returns the localized currency symbol, such as "$", "€", "£", or "¥".
    /// The symbol returned is appropriate for the current locale's currency settings.
    ///
    /// ## Example
    ///
    /// ```swift
    /// if let symbol = Locale.current.currencySign {
    ///     print("Currency symbol: \(symbol)")
    /// }
    /// ```
    ///
    /// - Returns: The currency symbol, or `nil` if the locale doesn't have an associated currency symbol.
    ///
    /// - Note: If the currency symbol cannot be retrieved, an error is logged to the system logger.
    var currencySign: String? {
        guard let currencySymbol else {
            logger(
                .system,
                message: "Failed to get currency symbol",
                type: .error)
            return nil
        }
        return currencySymbol
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI
#Preview {
    NavigationStack {
        List {
            LabeledContent("Identifier", value: Locale.current.currencyIdentifier ?? "-")
            LabeledContent("Symbol", value: Locale.current.currencySign ?? "-")
        }
        .navigationTitle("Currency")
    }
}
#endif

//
//  PersonNameComponent.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 3/7/26.
//  MIT License
//

import Foundation

/// A strongly-typed enumeration of the individual components that can make up a person’s name.
///
/// `PersonNameComponent` mirrors the semantic fields available in Foundation’s
/// `PersonNameComponents` (such as given name, family name, prefix, suffix, and nickname),
/// and is intended to be used as a convenient, type-safe key when working with name data,
/// UI labels, placeholders, and value extraction.
///
/// ## Usage
/// - Mapping a component to a localized display name via `name`
/// - Providing form field placeholders via `placeholder`
/// - Extracting a specific value from `PersonNameComponents` with `value(from:)`
/// - Formatting full names with locale-aware rules using the static `formatter(_:locale:)`
///   and `name(_:style:)` helpers
///
/// - SeeAlso: `PersonNameComponents`, `PersonNameComponentsFormatter`
///
/// - Complexity: O(1) for all properties and methods, as they involve simple enum cases and direct property access.
public enum PersonNameComponent: String, Staticable, Searchable {
    
    case namePrefix
    case givenName
    case middleName
    case familyName
    case nameSuffix
    case nickname
    
    public var name: String {
        switch self {
        case .namePrefix: "Prefix"
        case .givenName:  "First"
        case .middleName: "Middle"
        case .familyName: "Last"
        case .nameSuffix: "Suffix"
        case .nickname:   "Nickname"
        }
    }
    
    /// - Returns: A placeholder string for the component, suitable for use in form fields.
    public var placeholder: String {
        switch self {
        case .namePrefix: "Ex: Mr., Dr., Ms."
        case .givenName:  "Ex: Robert, Susan"
        case .middleName: "Ex: Michael, Elizabeth"
        case .familyName: "Ex: Doe, Smith"
        case .nameSuffix: "Ex: Jr., PhD"
        case .nickname:   "Ex: Bob, Sue"
        }
    }
    
    /// Retrieves the string value for this specific name component from a given `PersonNameComponents` instance.
    ///
    /// Use this helper to extract a single semantic field (such as given name, family name,
    /// prefix, suffix, or nickname) without manually switching over each property yourself.
    /// The method returns `nil` if the requested component is not present in the provided
    /// `PersonNameComponents`.
    ///
    /// - Parameter components: The `PersonNameComponents` source from which to extract the value.
    ///
    /// - Returns: The string value corresponding to the receiver’s component (e.g., `.givenName`, `.familyName`), or `nil` if unavailable.
    public func value(from components: PersonNameComponents) -> String? {
        switch self {
        case .namePrefix: components.namePrefix
        case .givenName:  components.givenName
        case .middleName: components.middleName
        case .familyName: components.familyName
        case .nameSuffix: components.nameSuffix
        case .nickname:   components.nickname
        }
    }
    
    /// Creates and configures a PersonNameComponentsFormatter for locale‑aware name rendering.
    ///
    /// This convenience method returns a new formatter instance with its `style`
    /// property set to the provided value. Use this to generate user‑facing strings
    /// from PersonNameComponents with appropriate ordering, punctuation, and
    /// abbreviations for the current locale.
    ///
    /// - Parameter style: The formatting style to apply. Defaults to `.default`.
    ///
    /// - Returns: A `PersonNameComponentsFormatter` configured with the specified style.
    public static func formatter(_ style: PersonNameComponentsFormatter.Style = .default
    ) -> PersonNameComponentsFormatter {
        let formatter = PersonNameComponentsFormatter()
        formatter.style = style
        return formatter
    }
    
    /// Produces a localized display string for the given name components.
    ///
    /// This overload formats an existing `PersonNameComponents` value using a
    /// `PersonNameComponentsFormatter`, applying locale‑aware ordering, punctuation,
    /// and abbreviations as appropriate for the specified style.
    ///
    /// - Parameters:
    ///   - components: The `PersonNameComponents` to format into a human‑readable string.
    ///   - style: The presentation style to use when formatting. Defaults to `.default`.
    ///
    /// - Returns: A localized, human‑readable string representing the provided name components.
    public static func string(
        _ components: PersonNameComponents,
        style: PersonNameComponentsFormatter.Style = .default
    ) -> String {
        formatter(style).string(from: components)
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI
#Preview {
    var components: PersonNameComponents {
        let phoneticRepresentation = PersonNameComponents(
            namePrefix: "Doctor",
            givenName: "Ah-vah",
            middleName: "Mah-ree",
            familyName: "Nwin",
            nameSuffix: "the Third",
            nickname: "A-vee")
        return .init(
            namePrefix: "Dr.",
            givenName: "Ava",
            middleName: "Marie",
            familyName: "Nguyen",
            nameSuffix: "III",
            nickname: "Avie",
            phoneticRepresentation: phoneticRepresentation)
    }
    NavigationStack {
        List {
            Section("Display") {
                ForEach(PersonNameComponentsFormatter.Style.allCases, id: \.self) {
                    LabeledContent($0.name, value: PersonNameComponent.string(components, style: $0))
                }
            }
            if let phoneticRepresentation = components.phoneticRepresentation {
                Section("Pronunciation") {
                    ForEach(PersonNameComponentsFormatter.Style.allCases, id: \.self) {
                        LabeledContent($0.name, value: PersonNameComponent.string(phoneticRepresentation, style: $0))
                    }
                }
            }
        }
        .navigationTitle("Name Formatting")
    }
}
#endif

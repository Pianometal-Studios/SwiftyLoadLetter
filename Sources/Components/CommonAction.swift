//
//  CommonAction.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  MIT License
//

import SwiftUI

/// A set of common, reusable actions that standardize action representations across app development.
///
/// Each action provides a localized name and a corresponding SF Symbol icon name.
///
/// - Authors: [@pianometal](https://github.com/pianometal)
///
/// - Complexity: O(1) for all properties and methods, as they are computed from a fixed set of cases.
public enum CommonAction: String, Staticable, Searchable, Iconable {
    
    case add
    case cancel
    case close
    case confirm
    case debug
    case delete
    case edit
    case filter
    case help
    case info
    case save
    case settings
    case sort
    
    /// - Returns: `ButtonRole` associated with the action, if applicable.
    public var buttonRole: ButtonRole? {
        switch self {
        case .cancel:         .cancel
        case .close:          .close
        case .confirm, .save: .confirm
        case .delete:         .destructive
        default:              nil
        }
    }
    
    /// - Returns: An SF Symbols glyph identifier representing the action.
    public var icon: String {
        switch self {
        case .add:            "plus"
        case .cancel, .close: "xmark"
        case .confirm, .save: "checkmark"
        case .debug:          "ladybug"
        case .delete:         "trash"
        case .edit:           "pencil"
        case .filter:         "line.3.horizontal.decrease"
        case .help:           "questionmark"
        case .info:           "info"
        case .settings:       "gear"
        case .sort:           "arrow.up.arrow.down"
        }
    }
    
    /// - Returns: A localized, human-readable name for the action.
    public var name: String {
        rawValue.localizedCapitalized
    }
    
    /// - Returns: `TabPlacement` associated with the action.
    public var tabPlacement: TabPlacement {
        switch self {
        case .settings: .pinned
        default:        .automatic
        }
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    List {
        ForEach(CommonAction.allCases) {
            Label($0.name, systemImage: $0.icon)
        }
    }
}
#endif

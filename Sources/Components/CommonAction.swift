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
    
    public var name: String {
        switch self {
        case .add:      "Add"
        case .cancel:   "Cancel"
        case .close:    "Close"
        case .confirm:  "Confirm"
        case .debug:    "Debug"
        case .delete:   "Delete"
        case .edit:     "Edit"
        case .filter:   "Filter"
        case .help:     "Help"
        case .info:     "Info"
        case .save:     "Save"
        case .settings: "Settings"
        case .sort:     "Sort"
        }
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

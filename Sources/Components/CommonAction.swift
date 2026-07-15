//
//  CommonAction.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  Apache License 2.0
//

import SwiftUI

/// A set of common, reusable actions that standardize action representations across app development.
///
/// Each action provides a localized name and a corresponding SF Symbol icon name.
public enum CommonAction:
    String,
    Staticable,
    Searchable,
    Listable,
    Iconable {
    
    case add
    case back
    case cancel
    case close
    case confirm
    case debug
    case delete
    case edit
    case filter
    case help
    case info
    case next
    case refresh
    case restore
    case reset
    case save
    case settings
    case signOut
    case sort
    case stop
    
    public var icon: String {
        switch self {
        case .add:            "plus"
        case .back:           "arrow.backward"
        case .cancel, .close: "xmark"
        case .confirm, .save: "checkmark"
        case .debug:          "ladybug"
        case .delete:         "trash"
        case .edit:           "pencil"
        case .filter:         "line.3.horizontal.decrease"
        case .help:           "questionmark"
        case .info:           "info"
        case .next:           "arrow.forward"
        case .refresh:        "arrow.clockwise"
        case .reset:          "arrow.counterclockwise"
        case .restore:        "arrow.clockwise.circle"
        case .settings:       "gear"
        case .signOut:        "rectangle.portrait.and.arrow.right"
        case .sort:           "arrow.up.arrow.down"
        case .stop:           "stop"
        }
    }
    
    public var name: String {
        switch self {
        case .add:      "Add"
        case .back:     "Back"
        case .cancel:   "Cancel"
        case .close:    "Close"
        case .confirm:  "Confirm"
        case .debug:    "Debug"
        case .delete:   "Delete"
        case .edit:     "Edit"
        case .filter:   "Filter"
        case .help:     "Help"
        case .info:     "Info"
        case .next:     "Next"
        case .refresh:  "Refresh"
        case .reset:    "Reset"
        case .restore:  "Restore Purchases"
        case .save:     "Save"
        case .settings: "Settings"
        case .signOut:  "Sign Out"
        case .sort:     "Sort"
        case .stop:     "Stop"
        }
    }
    
    /// - Returns: `ButtonRole` associated with the action, if applicable.
    public var role: ButtonRole? {
        switch self {
        case .cancel, .back:                   .cancel
        case .close:                           .close
        case .confirm, .save, .restore, .next: .confirm
        case .delete, .reset, .stop, .signOut: .destructive
        default:                               nil
        }
    }
    
    /// - Returns: `TabPlacement` associated with the action.
    public var tabPlacement: TabPlacement {
        switch self {
        case .settings: .pinned
        default:        .automatic
        }
    }
    
    public static let navigationTitle = "Common Actions"
}

// MARK: - Preview

#if DEBUG
#Preview {
    NavigationStack {
        List(CommonAction.allCases) { action in
            Button(
                action.name,
                systemImage: action.icon,
                role: action.role)
            { logger(.swift, message: action.name) }
        }
        .navigationTitle(CommonAction.navigationTitle)
    }
}
#endif

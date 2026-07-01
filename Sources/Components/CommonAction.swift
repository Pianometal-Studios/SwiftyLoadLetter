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
    Iconable {
    
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
    case refresh
    case reset
    case save
    case settings
    case sort
    case stop
    
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
        case .refresh:        "arrow.clockwise"
        case .reset:          "arrow.counterclockwise"
        case .settings:       "gear"
        case .sort:           "arrow.up.arrow.down"
        case .stop:           "stop"
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
        case .refresh:  "Refresh"
        case .reset:    "Reset"
        case .save:     "Save"
        case .settings: "Settings"
        case .sort:     "Sort"
        case .stop:     "Stop"
        }
    }
    
    /// - Returns: `ButtonRole` associated with the action, if applicable.
    public var role: ButtonRole? {
        switch self {
        case .cancel:                .cancel
        case .close:                 .close
        case .confirm, .save:        .confirm
        case .delete, .reset, .stop: .destructive
        default:                     nil
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
    NavigationStack {
        ScrollView {
            LazyVGrid(columns: GridItem.generate(2)) {
                ForEach(CommonAction.allCases) { action in
                    Button(role: action.role) {
                        logger(.swift, message: action.name)
                    } label: {
                        Label(
                            action.name,
                            systemImage: action.icon)
                        .padding()
                    }
                }
            }
        }
        .navigationTitle("Common Actions")
    }
}
#endif

//
//  CommonAction.swift
//  SwiftyLoadLetter
//
//  Created by Kyle Lovely on 1/7/26.
//  Apache License 2.0
//

public import SwiftUI

/// A set of common, reusable actions that standardize action representations across app development.
///
/// Each action provides a name, an SF Symbol, a color, Voice Control synonyms, and its button
/// role, tab placement, and toolbar placement.
public enum CommonAction:
    String,
    Staticable,
    Searchable,
    Listable,
    Iconable,
    Colorable {
    
    case add
    case back
    case cancel
    case clear
    case close
    case confirm
    case copy
    case debug
    case delete
    case done
    case down
    case edit
    case filter
    case help
    case info
    case next
    case notNow
    case ok
    case openSettings
    case pause
    case play
    case previous
    case refresh
    case remove
    case restore
    case reset
    case resume
    case save
    case settings
    case share
    case signOut
    case sort
    case stop
    case tryAgain
    case up
    
    /// The action's `name` followed by its spoken synonyms, such as "Trash" for `.delete`, for
    /// `accessibilityInputLabels(_:)`.
    public var accessibilityInputLabels: [String] {
        let synonyms: [String] = switch self {
        case .add:          ["New"]
        case .cancel:       ["Go Back"]
        case .close:        ["Dismiss"]
        case .delete:       ["Trash"]
        case .filter:       ["Filters"]
        case .help:         ["Support"]
        case .info:         ["Information", "More Info"]
        case .notNow:       ["Later"]
        case .openSettings: ["Go to Settings"]
        case .restore:      ["Restore"]
        case .resume:       ["Continue"]
        case .settings:     ["Preferences"]
        case .signOut:      ["Log Out"]
        case .sort:         ["Sorting"]
        case .back, .clear, .confirm, .copy, .debug, .done, .down, .edit, .next, .ok, .pause, .play,
             .previous, .refresh, .remove, .reset, .save, .share, .stop, .tryAgain, .up: []
        }
        return [name] + synonyms
    }
    
    public var color: Color {
        switch self {
        case .add, .copy, .next, .ok, .refresh, .restore, .share, .tryAgain:         .blue
        case .cancel, .delete, .remove, .reset, .signOut, .stop:                      .red
        case .close, .confirm, .done, .play, .resume, .save:                          .green
        case .debug, .help, .info:                                                    .orange
        case .edit, .pause:                                                           .yellow
        case .filter, .sort:                                                          .brown
        case .back, .clear, .down, .notNow, .openSettings, .previous, .settings, .up: .gray
        }
    }
    
    public var icon: String {
        switch self {
        case .add:                         "plus"
        case .back:                        "arrow.backward"
        case .cancel, .close, .notNow:     "xmark"
        case .clear:                       "xmark.circle"
        case .confirm, .done, .ok, .save:  "checkmark"
        case .copy:                        "doc.on.doc"
        case .debug:                       "ladybug"
        case .delete:                      "trash"
        case .down:                        "chevron.down"
        case .edit:                        "pencil"
        case .filter:                      "line.3.horizontal.decrease"
        case .help:                        "questionmark"
        case .info:                        "info"
        case .next:                        "chevron.forward"
        case .openSettings, .settings:     "gear"
        case .pause:                       "pause.fill"
        case .play, .resume:               "play.fill"
        case .previous:                    "chevron.backward"
        case .refresh, .tryAgain:          "arrow.clockwise"
        case .remove:                      "minus.circle"
        case .reset:                       "arrow.counterclockwise"
        case .restore:                     "arrow.clockwise.circle"
        case .share:                       "square.and.arrow.up"
        case .signOut:                     "rectangle.portrait.and.arrow.right"
        case .sort:                        "arrow.up.arrow.down"
        case .stop:                        "stop.fill"
        case .up:                          "chevron.up"
        }
    }
    
    public var name: String {
        switch self {
        case .add:          "Add"
        case .back:         "Back"
        case .cancel:       "Cancel"
        case .clear:        "Clear"
        case .close:        "Close"
        case .confirm:      "Confirm"
        case .copy:         "Copy"
        case .debug:        "Debug"
        case .delete:       "Delete"
        case .done:         "Done"
        case .down:         "Down"
        case .edit:         "Edit"
        case .filter:       "Filter"
        case .help:         "Help"
        case .info:         "Info"
        case .next:         "Next"
        case .notNow:       "Not Now"
        case .ok:           "OK"
        case .openSettings: "Open Settings"
        case .pause:        "Pause"
        case .play:         "Play"
        case .previous:     "Previous"
        case .refresh:      "Refresh"
        case .remove:       "Remove"
        case .reset:        "Reset"
        case .restore:      "Restore Purchases"
        case .resume:       "Resume"
        case .save:         "Save"
        case .settings:     "Settings"
        case .share:        "Share"
        case .signOut:      "Sign Out"
        case .sort:         "Sort"
        case .stop:         "Stop"
        case .tryAgain:     "Try Again"
        case .up:           "Up"
        }
    }
    
    /// `ButtonRole` associated with the action, if applicable.
    public var role: ButtonRole? {
        switch self {
        case .back, .cancel, .notNow, .previous:            .cancel
        case .close:                                        .close
        case .confirm, .done, .next, .ok, .restore, .save:  .confirm
        case .delete, .remove, .reset, .signOut, .stop:     .destructive
        default:                                            nil
        }
    }
    
    /// `TabPlacement` associated with the action.
    public var tabPlacement: TabPlacement {
        switch self {
        case .settings: .pinned
        default:        .automatic
        }
    }
    
    /// `ToolbarItemPlacement` associated with the action, or `.automatic` when it has no
    /// semantic placement.
    public var toolbarItemPlacement: ToolbarItemPlacement {
        switch self {
        case .delete, .remove, .reset, .stop:              .destructiveAction
        case .back, .cancel, .notNow, .previous:           .cancellationAction
        case .confirm, .done, .next, .ok, .restore, .save: .confirmationAction
        default:                                           .automatic
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
            .tint(action.color)
            .accessibilityInputLabels(action.accessibilityInputLabels)
        }
        .navigationTitle(CommonAction.navigationTitle)
    }
}
#endif

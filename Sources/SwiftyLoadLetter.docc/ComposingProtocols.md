# Composing Protocols

Stack small, single-purpose protocols to describe exactly what a type can express.

## Overview

SwiftyLoadLetter's protocols are intentionally narrow. Each one adds a single
capability — a name, an icon, a color, an image — and they're designed to be mixed
freely. A type conforms to as many as it needs, and gains the corresponding default
behaviour without restating boilerplate.

## The building blocks

| Protocol | Requirement | What it adds |
|---|---|---|
| ``Nameable`` | `name: String` | A `Comparable` default and a case-insensitive `search()` on any `Collection`. |
| ``Describable`` | `details: String` | A longer user-facing description to complement the short `name`. |
| ``Colorable`` | `color: Color` | An associated SwiftUI `Color` for theming and tinting. |
| ``Iconable`` | `icon: String` | An SF Symbol name, ready for `Image(systemName:)`. |
| ``Imageable`` | `@MainActor image: ImageResource` | An asset-catalog image for types backed by named assets; the requirement is main-actor isolated. |
| ``Searchable`` | composition | ``Nameable`` + `Identifiable` + `Hashable` + `Comparable` for searchable lists. |
| ``Staticable`` | composition | For `String`-backed enums shareable across concurrency domains: bundles `Identifiable`, `Codable`, `CaseIterable`, `Hashable`, `CodingKey`, `Sendable`, and `Transferable`, and provides default `id`, `customizationID`, and `transferRepresentation`. |
| ``Listable`` | `static navigationTitle` | A navigation title for list-based presentation, plus a default `collection` name (sanitized and lowercased) derived from it. |
| ``NestedObject`` | composition | `Codable` + `Sendable` + `Identifiable` + `Hashable` for nested, non-top-level persistent value objects. |

## How composition pays off

Because the protocols layer, conforming to a combination unlocks behaviour that
none of them provides alone. ``Iconable`` gives you `icon`; ``Colorable`` gives you
`color`; conform to **both** (alongside ``Nameable``) and a value is immediately
ready to drop into a styled `Label`:

```swift
enum LogArea: String, Nameable, Iconable, Colorable {
    case network, auth

    var name: String {
        switch self {
        case .network: "Network"
        case .auth:    "Authentication"
        }
    }

    var icon: String {
        switch self {
        case .network: "network"
        case .auth:    "lock"
        }
    }

    var color: Color {
        switch self {
        case .network: .blue
        case .auth:    .red
        }
    }
}

Label(LogArea.network.name, systemImage: LogArea.network.icon)
    .foregroundStyle(LogArea.network.color)
```

Similarly, ``Searchable`` is itself a composition — conforming to it means a type is
ready to back an autocomplete field or a filterable list, and `search()` works
across any collection of those values.

## Components conform too

The package's own enums — ``PressureLevel``, ``ConnectionState``, ``CommonAction``,
``SignalQuality``, ``FrequencyBands``, and friends — formally conform to these
protocols, so they inherit the same free behaviour your own types do.

The `Network.framework` and system-state extensions (such as `NWPath.Status` and
`ProcessInfo.ThermalState`) don't declare conformance, but they expose the very same
`name` / `icon` / `color` / `details` surface directly. Either way, a value drops
straight into a styled `Label`:

```swift
Label(state.name, systemImage: state.icon)
    .foregroundStyle(state.color)
```

## See also

- <doc:GettingStarted>
- ``Nameable``
- ``Searchable``
- ``Staticable``

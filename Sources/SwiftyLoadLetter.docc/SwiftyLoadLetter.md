# ``SwiftyLoadLetter``

A utility package for Apple platforms that fills in the gaps left by the standard library and SwiftUI.

## Overview

SwiftyLoadLetter provides composable protocols, type-safe extensions on Foundation
and SwiftUI types, system-state enums with built-in UI properties, and SwiftUI view
helpers — all designed to reduce boilerplate across every Apple platform.

The package is built around a small set of **composable protocols** —
``Nameable``, ``Iconable``, ``Colorable``, ``Emojiable``, and friends. Conform a type
to one or several, and gain free behaviour: a case-insensitive `search()` on any
collection of ``Nameable`` values, an `emojiLabel` for Console-friendly logging, a
stable `customizationID` for `TabView` persistence, and more.

```swift
enum Tab: String, Staticable, Searchable, Iconable, Colorable, Emojiable, Listable {
    case home, library, settings

    var icon: String {
        switch self {
        case .home:     "house"
        case .library:  "books.vertical"
        case .settings: "gear"
        }
    }

    var name: String {
        switch self {
        case .home:     "Home"
        case .library:  "Library"
        case .settings: "Settings"
        }
    }

    // color, emoji omitted for brevity

    static let navigationTitle = "Tabs"
}

// Case-insensitive search comes for free via Nameable.
let results = Tab.allCases.search("lib")   // [.library]
```

On top of the protocols, the package ships ready-made **components** that model
common app and system concepts (``AppleOS``, ``ConnectionState``, ``PressureLevel``,
``CommonAction``), a large set of **extensions** that add `color` / `icon` / `name`
metadata to system enums such as `NWPath.Status` and `ProcessInfo.ThermalState`,
and a strongly-typed **logging** layer built on `os.Logger`.

> Note: SwiftyLoadLetter has no third-party dependencies and targets
> iOS, iPadOS, macOS, tvOS, visionOS, and watchOS 26.0+.

> Note: The package builds in Swift 6 language mode with default actor
> isolation set to `nil` (nonisolated by default) and strict memory safety
> enabled, and turns on the `ExistentialAny`, `ImmutableWeakCaptures`,
> `InferIsolatedConformances`, `MemberImportVisibility`, and
> `NonisolatedNonsendingByDefault` upcoming features.

## Topics

### Essentials

- <doc:GettingStarted>
- <doc:ComposingProtocols>

### Composable Protocols

- ``Nameable``
- ``Describable``
- ``Colorable``
- ``Iconable``
- ``Imageable``
- ``Emojiable``
- ``Searchable``
- ``Staticable``
- ``Listable``

### Protocol Companions

- ``IconableObject``
- ``DescribableObject``
- ``ImageableObject``
- ``DescribableCardView``

### System & App Concepts

- ``AppleOS``
- ``CommonAction``
- ``CompassPoint``
- ``ConnectionState``
- ``FrequencyBands``
- ``PersonNameComponent``
- ``PressureLevel``
- ``SignalQuality``

### Connection State Views

- ``ConnectionStateLabelView``
- ``ConnectionStateIconView``

### Views

- ``LiquidMeshBackground``

### Logging & Diagnostics

- ``LogCategory``
- ``logger(_:message:type:)``
- ``logger(_:error:type:)``
- ``printOnDebug(_:separator:terminator:)``
- ``printOnDebug(_:)``

### Bundle & Formatting Utilities

- ``MainBundle``
- ``Formatters``

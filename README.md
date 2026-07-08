# 🖨️ SwiftyLoadLetter

> 🤷‍♂️ The [func](https://en.wikipedia.org/wiki/PC_LOAD_LETTER) does that mean?

Inspired by the legendary printer error that drove Peter, Michael, and Samir to the field with a baseball bat — `🖨️ SwiftyLoadLetter` is a Swift utility package for Apple platforms that fills in the gaps left by the standard library and SwiftUI. It provides composable protocols, type-safe extensions on Foundation and SwiftUI types, system-state enums with built-in UI properties, and SwiftUI view helpers — all designed to reduce boilerplate across every Apple platform. No cover sheets required.

```
┌───────────────────────────────────────────────────────────────────┐
│                                                                   │
│   ╔═══════════════════════════════════════════════════════════╗   │
│   ║                                                           ║   │
│   ║     ███████╗██╗    ██╗██╗███████╗████████╗██╗   ██╗       ║   │
│   ║     ██╔════╝██║    ██║██║██╔════╝╚══██╔══╝╚██╗ ██╔╝       ║   │
│   ║     ███████╗██║ █╗ ██║██║█████╗     ██║    ╚████╔╝        ║   │
│   ║     ╚════██║██║███╗██║██║██╔══╝     ██║     ╚██╔╝         ║   │
│   ║     ███████║╚███╔███╔╝██║██║        ██║      ██║          ║   │
│   ║     ╚══════╝ ╚══╝╚══╝ ╚═╝╚═╝        ╚═╝      ╚═╝          ║   │
│   ║                                                           ║   │
│   ║            ╦  ┌─┐┌─┐┌┬┐  ╦  ┌─┐┌┬┐┌┬┐┌─┐┬─┐               ║   │
│   ║            ║  │ │├─┤ ││  ║  ├┤  │  │ ├┤ ├┬┘               ║   │
│   ║            ╩═╝└─┘┴ ┴─┴┘  ╩═╝└─┘ ┴  ┴ └─┘┴┴─               ║   │
│   ║                                                           ║   │
│   ╚═══════════════════════════════════════════════════════════╝   │
│                                                                   │
│            ___                                                    │
│           /   \                                                   │
│          | ( ) |   "Yeah, if you could just go ahead and use      │
│           \___/     this package that'd be greaaaat..."           │
│             |                                                     │
│         ____┴____                                                 │
│        |         |                                                │
│        |   ___   |                                                │
│        |  |TPS|  |                                                │
│        |  |RPT|  |                                                │
│        |__|___|__|                                                │
│           |   |                                                   │
│          _|   |_                                   "...yeah"      │
│                                                                   │
└───────────────────────────────────────────────────────────────────┘
```
---

## ⚙️ Compatibility

### Xcode

![Xcode](https://img.shields.io/badge/Xcode-26.0-blue?logo=xcode)

### Swift

[![Swift Versions](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FPianometal-Studios%2FSwiftyLoadLetter%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/Pianometal-Studios/SwiftyLoadLetter)
![Approachable Concurrency](https://img.shields.io/badge/Approachable_Concurrency-Yes-darkgreen?logo=swift)
![Strict Concurrency Checking](https://img.shields.io/badge/Strict_Concurrency_Checking-Complete-darkblue?logo=swift)
![Default Actor Isolation](https://img.shields.io/badge/Default_Actor_Isolation-nil-darkred?logo=swift)
![Strict Memory Safety](https://img.shields.io/badge/Strict_Memory_Safety-Yes-darkgreen?logo=swift)

Built in **Swift 6 language mode** with strict memory safety and these upcoming features enabled: `ExistentialAny`, `ImmutableWeakCaptures`, `InferIsolatedConformances`, `MemberImportVisibility`, and `NonisolatedNonsendingByDefault`.

### Platforms

[![Platforms](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FPianometal-Studios%2FSwiftyLoadLetter%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/Pianometal-Studios/SwiftyLoadLetter)

---

## 📥 Installation

![Swift Package Manager](https://img.shields.io/badge/SPM-Compatible-darkgreen.svg?logo=swift)

### Xcode

Add the package via **File → Add Package Dependencies** and enter — no memo from Lumbergh required:

```
https://github.com/Pianometal-Studios/SwiftyLoadLetter.git
```

### Package.swift

```swift
dependencies: [
    .package(
        url: "https://github.com/Pianometal-Studios/SwiftyLoadLetter.git",
        .upToNextMajor(from: .init(1, 0, 0))
    ),
],
targets: [
    .target(name: "MyTarget", dependencies: [.byName(name: "SwiftyLoadLetter")])
]
```

---

## 📚 Documentation

[![Documentation](https://img.shields.io/badge/Documentation-DocC-blue.svg?logo=swift)](https://swiftpackageindex.com/Pianometal-Studios/SwiftyLoadLetter/documentation)

Full, browsable API documentation — every public symbol, plus articles on getting started and composing the protocols — is hosted on the [Swift Package Index](https://swiftpackageindex.com/Pianometal-Studios/SwiftyLoadLetter/documentation) and kept up to date automatically as the package changes.

Prefer it offline? Build the [DocC](https://www.swift.org/documentation/docc/) catalog in Xcode via **Product → Build Documentation** (⌃⌘D).

The sections below are a quick tour.

---

## 🧩 Protocols

SwiftyLoadLetter's protocols are designed to be composed freely — kind of like pieces of flair, except you actually want these. Conform to one or several depending on what your type needs to express.

| Protocol | Requirements | Purpose |
|---|---|---|
| `Nameable` | `name: String` | Human-readable identity. Provides a default `Comparable` implementation and a case-insensitive `search()` method on any `Collection`. |
| `Describable` | `details: String` | A longer user-facing description, complementing `Nameable`'s short title. |
| `Colorable` | `color: Color` | An associated SwiftUI `Color` for theming, tinting, or visualization. |
| `Iconable` | `icon: String` | An SF Symbol name, ready for `Image(systemName:)`. |
| `Imageable` | `image: ImageResource` | An asset catalog image resource for types backed by named assets. |
| `Searchable` | `Nameable` + `Identifiable` + `Hashable` + `Comparable` | Full composition for models that appear in searchable lists and autocomplete UIs. |
| `Staticable` | `Identifiable` + `Codable` + `CaseIterable` + `Hashable` + `CodingKey` + `Sendable` + `Transferable` + `RawRepresentable<String>` | For string-backed enums used as stable identifiers, configuration keys, or routing constants. Provides `customizationID` for `TabView` persistence and default `Transferable` support for drag-and-drop/copy-paste. |
| `Listable` | `static navigationTitle: String` | Provides a navigation title for list-based presentation of a type's instances. |

### Example: Building a conforming type

```swift
enum Tab: String, Staticable, Searchable, Iconable, Colorable, Listable {

    case home
    case library
    case settings

    var color: Color {
        switch self {
        case .home:     .blue
        case .library:  .purple
        case .settings: .gray
        }
    }

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
    
    static let navigationTitle = "Tabs"
}

// Case-insensitive search comes for free via Nameable
let results = Tab.allCases.search("lib") // [.library]

// Sorting comes for free via Nameable's Comparable conformance
let sorted = Tab.allCases.sorted() // [.home, .library, .settings]
```

---

## 🗂️ Components

Ready-made enumerations that model common app and system concepts, all conforming to the relevant protocols above.

### `AppleOS`

An enumeration of Apple's OS families with `device` name, SF Symbol `icon`, `name`, and a `@MainActor`-isolated `isCurrent` property.

```swift
if AppleOS.visionOS.isCurrent {
    // show Vision Pro–specific UI
}
```

Cases: `.iOS` `.iPadOS` `.macOS` `.tvOS` `.watchOS` `.visionOS`

---

### `CommonAction`

A set of reusable UI actions, each with an SF Symbol `icon`, localized `name`, an optional `ButtonRole`, and a `TabPlacement`.

```swift
Button(role: CommonAction.delete.role) {
    deleteItem()
} label: {
    Label(CommonAction.delete.name, systemImage: CommonAction.delete.icon)
}
```

Cases: `.add` `.cancel` `.close` `.confirm` `.debug` `.delete` `.edit` `.filter` `.help` `.info` `.refresh` `.reset` `.restore` `.save` `.settings` `.sort` `.stop`

---

### `ConnectionState`

General-purpose network connection states, each with a `color`, `icon`, and `name`.

```swift
Label(state.name, systemImage: "circle.fill")
    .foregroundStyle(state.color)
```

Cases: `.disconnected` `.connecting` `.connected` `.disconnecting`

---

### `PersonNameComponent`

Type-safe access to individual fields of `PersonNameComponents`, with localized form field `placeholder`s and `value(from:)` extraction.

```swift
let first = PersonNameComponent.givenName.value(from: components) // "Michael"
let formatted = PersonNameComponent.string(components, style: .short) // "Michael B."
```

Cases: `.namePrefix` `.givenName` `.middleName` `.familyName` `.nameSuffix` `.nickname`

---

### `PressureLevel`

A `@frozen` enum representing system pressure levels for memory, CPU, or any hardware component. Conforms to `Staticable`, `Searchable`, `Iconable`, `Colorable`, `Describable`, and `Listable` — with `color`, `icon`, `name`, and `details`.

```swift
let level = memoryUsageFraction.pressureLevel // via Double.pressureLevel
label.foregroundStyle(level.color)
```

Cases: `.normal` `.warning` `.critical` `.unknown`

---

## 🔧 Extensions

### SwiftUI — View Modifiers

| Modifier | Description |
|---|---|
| `.magicReplace()` | Applies a content transition using the system symbol effect with a "magic replace" animation for SF Symbols. |
| `.glass(isRegular:shape:isInteractive:tint:)` | Cross-platform glass material effect. No-op on visionOS. |
| `.glassButton(or:)` | Platform-appropriate glass button style with visionOS fallback. |
| `.redacted(_:)` | Boolean-driven `.placeholder` redaction — pass `true` to redact, `false` to reveal. |
| `.darken(when:disable:)` | Desaturates and dims the view when `true`. Optionally disables the view when dimmed. |
| `.segmentedPicker()` | `.segmented` style on all platforms, `.automatic` on watchOS. |
| `.listRowSeparatorHidden()` | Hides list row separators on iOS, macOS, and visionOS. No-op elsewhere. |
| `.navigationSubtitle(subtitle:)` | Sets a navigation subtitle on iOS and macOS. No-op elsewhere. |
| `.fadeInOut(from:)` | Asymmetric push + fade transition; inserts from the given edge, removes toward its opposite. |

```swift
Text("Loading...")
    .redacted(isLoading)

Button("Submit") { submit() }
    .darken(when: isProcessing, disable: true)

Image(systemName: isLoading ? "hourglass" : "checkmark")
    .magicReplace()

VStack { ... }
    .glass(tint: .blue.opacity(0.2))
```

---

### SwiftUI — Layout

| API | Description |
|---|---|
| `GridItem.generate(_ count:)` | Creates `count` flexible `GridItem`s. Defaults to `3`. |
| `GridItem.list(_ sizeClass:)` | 1 column in compact, 2 in regular — adapts to `horizontalSizeClass`. |
| `Image.scaled(to:)` | `.resizable()` + `.aspectRatio(contentMode:)` in one call. |

```swift
LazyVGrid(columns: GridItem.list(horizontalSizeClass)) { ... }

Image(.hero)
    .scaled(to: .fill)
```

---

### Foundation — Double

| API | Description |
|---|---|
| `.asPercent(_ fractionLength:)` | Localized percent string. `0.25.asPercent()` → `"25%"`. |
| `.currency(_ identifier:)` | Localized currency string with locale-aware fallback. |
| `.percentage` | Divides by 100. `25.0.percentage` → `0.25`. |
| `.isValid` | `true` if finite, non-NaN, and non-signaling. |
| `.pressureLevel` | Maps `0...1` to `PressureLevel`. Returns `.unknown` for invalid values. |

```swift
Text(0.42.asPercent())          // "42%"
Text(1234.56.currency())        // "$1,234.56"
Text(75.0.percentage.asPercent()) // "75%"
```

---

### Foundation — Other

| API | Description |
|---|---|
| `UInt64.toByteCount` | Converts to `Int64` for use with `ByteCountFormatter`. |
| `URL.create(_:)` | Validates a string has both a parseable `URL` and a non-empty host. |
| `String.toURL` | Convenience wrapper for `URL.create(_:)`. |
| `Formatters.byteCount` | Shared `ByteCountFormatter` (`.useAll`, `.memory`), safe for off-main use. |
| `MainBundle.identifier` | Safe accessor for `Bundle.main.bundleIdentifier` with debug logging. |
| `MainBundle.infoDictionary` | Safe accessor for `Bundle.main.infoDictionary`. |
| `MainBundle.infoDictionary(_ key:)` | Typed `String` lookup for a specific Info.plist key. |
| `UTType.fromBundle` | App-scoped `UTType` from the bundle identifier. |
| `Staticable.customizationID` | Bundle-prefixed stable ID for `TabView` customization. |

---

### Network — `Network.framework`

| Type | Properties Added |
|---|---|
| `NWPath.Status` | `color`, `icon`, `name`, `details`, `isConnected`, `allCases` |
| `NWPath.LinkQuality` | `color`, `icon`, `name`, `allCases` |
| `NWPath.UnsatisfiedReason` | `icon`, `name`, `details`, `hasReason`, `allCases` |
| `NWInterface.InterfaceType` | `color`, `icon`, `name`, `allCases` |
| `NWInterface.RadioType` | `color`, `icon`, `name`, `is5G`, `isCellular`, `isWifi`, `allCases` |
| `NWInterface.RadioType.Cellular` | `color`, `icon`, `name`, `details`, `is5G`, `allCases` |
| `NWInterface.RadioType.WiFi` | `color`, `icon`, `name`, `adoptedYear`, `frequencyBands`, `generation`, `maxSpeed`, `allCases` |
| `NWInterface.RadioType.Cellular.NewRadio5GVariant` | `color`, `icon`, `name`, `details`, `isLowLatency`, `isHighSpeed`, `rangeQuality`, `penetrationLevel`, `allCases` |

```swift
Label(path.status.name, systemImage: path.status.icon)
    .foregroundStyle(path.status.color)
```

---

### System State

| Type | Properties Added |
|---|---|
| `ProcessInfo.ThermalState` | `color`, `icon`, `name`, `details`, `percentage`, `allCases` |
| `DispatchSource.MemoryPressureEvent` | `pressureLevel` → `PressureLevel` |
| `OSLogType` | `color`, `name`, `details`, `emoji`, `emojiLabel`, `severity`, `isPersistedInProduction`, `allCases` |

```swift
ProgressView(value: thermalState.percentage, total: 100)
    .tint(thermalState.color)

let level = memoryEvent.pressureLevel
```

---

### SwiftUI Types

| Type | Properties Added |
|---|---|
| `ColorScheme` / `ColorScheme?` | `color`, `icon`, `name`, `isDark` |
| `DynamicTypeSize` | `name`, `details` |
| `Font.Design` | `name`, `allCases` |
| `Edge` | `opposite` |
| `Edge` / `HorizontalEdge` / `VerticalEdge` | Bidirectional conversion helpers |
| `Edge.Orientation` | `.horizontal` / `.vertical` with `toEdge(_:)` |
| `UserInterfaceSizeClass` / `UserInterfaceSizeClass?` | `name`, `icon`, `isCompact`, `allCases` |
| `AccessibilityAdjustmentDirection` | `color`, `icon`, `name`, `details`, `allCases` |
| `Bool` | `color`, `emoji`, `emojiLabel`, `icon`, `name`, `labelView()`, `allCases` |
| `Color` | `name`, `allCases`, `random` |
| `PersonNameComponentsFormatter.Style` | `name`, `allCases` |

---

### Platform-Specific

| Type | Platform | Properties Added |
|---|---|---|
| `UIDevice.BatteryState` | iOS, visionOS | `icon`, `name`, `details`, `allCases` |
| `WKInterfaceDeviceBatteryState` | watchOS | `icon`, `name`, `details`, `allCases` |
| `GCDeviceBattery.State` | Not watchOS | `color`, `icon`, `name`, `details`, `allCases` |
| `GCControllerPlayerIndex` | Not watchOS | `icon`, `name`, `allCases` |

---

## 🖼️ Views

### `LiquidMeshBackground`

An animated dual-circle blurred background suitable for hero screens, onboarding, or any view that benefits from an organic ambient glow.

```swift
ContentView()
    .background {
        LiquidMeshBackground(
            color1: .blue,
            color2: .purple,
            isAnimating: $isAnimating)
    }
```

---

## 🛠️ Utilities

**Logging**
- `LogCategory` — Strongly-typed logging categories (`asc`, `auth`, `bluetooth`, `firebase`, `general`, `github`, `location`, `network`, `revenueCat`, `swift`, `swiftData`, `system`) bound to `os.Logger` with emoji prefixes for Console.app scanning. Conforms to `Staticable`, `Searchable`, `Describable`, and `Listable`.
- `logger(_:message:type:)` / `logger(_:error:type:)` — Free-function entry points with consistent formatting and debug-build mirroring to the console.

```swift
logger(.network, message: "Request started", type: .debug)
logger(.auth, error: someError, type: .error)
```

### `printOnDebug`

A debug-only `print` replacement that prefixes all output with `🖨️ Debug:` for easy filtering in Xcode's console. Compiles to a no-op in release builds. Milton would have had a lot fewer stapler incidents if he'd had better diagnostic logging.

```swift
printOnDebug("⚠️ Something unexpected happened")
// 🖨️ Debug: ⚠️ Something unexpected happened

printOnDebug(someError)
// 🖨️ Debug: The operation couldn't be completed.
```

---

## 📋 Releases

See the full [release history](https://github.com/Pianometal-Studios/SwiftyLoadLetter/releases) for changelogs and version notes. We went ahead and put them in there, so if you could just go ahead and read those, that'd be great. ☕️

---

## 🤝 Contributing

Contributions are welcome — bug reports, feature requests, documentation fixes, and pull requests of any size. Before getting started, please:

- Read the [Code of Conduct](CODE_OF_CONDUCT.md) — participation in this project is governed by it.
- Read the [Contributing Guide](CONTRIBUTING.md) for development setup, code style conventions, and the PR process.
- Use the issue templates when [filing a bug or requesting a feature](https://github.com/Pianometal-Studios/SwiftyLoadLetter/issues/new/choose).
- Report security issues **privately** per the [Security Policy](SECURITY.md) — please don't file them as public issues.

For questions or discussion that aren't bug reports, start a [Discussion](https://github.com/Pianometal-Studios/SwiftyLoadLetter/discussions) instead of an issue.

---

## 📄 License

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

SwiftyLoadLetter is available under the Apache License 2.0. See [LICENSE.txt](LICENSE.txt) for details.

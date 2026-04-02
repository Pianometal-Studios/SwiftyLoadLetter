# 🖨️ SwiftyLoadLetter

What the [func](https://en.wikipedia.org/wiki/PC_LOAD_LETTER) does that mean?

---

## 📦 What's Inside

SwiftyLoadLetter provides a focused set of battle-tested utilities across these categories:

**Extensions**
- `Bool` — `.name`, `.icon`, `.color`, `.labelView()`, `.allCases`
- `Color` — `.name`, `.allCases`, `.random`
- `ColorScheme` — `.isDark`, `.name`, `.icon`, `.color` (including `ColorScheme?` variants)
- `Double` — `.convert(_:to:)` for `UnitLength`, `UnitMass`, and `UnitTemperature`
- `Edge` — `.opposite`, `.toEdge(_:)`, `.vertical()`, `.horizontal()`
- `VerticalEdge` — `.toEdge()`
- `NWPath.Status` — `.name`, `.icon`, `.color`, `.details`, `.isConnected`, `.allCases`
- `NWPath.LinkQuality` — `.name`, `.icon`, `.color`, `.allCases`
- `URL` — `.create(_:)` (validates host, logs debug warnings on failure)
- `String` — `.toURL`
- `UTType` — `.fromBundle`
- `UserInterfaceSizeClass` — `.name` (including `UserInterfaceSizeClass?` variants)

**Protocols**
- `Nameable` — Provides a `name: String` and a default `search(_:)` implementation on collections
- `Staticable` — `String`-backed, `Codable`, `CaseIterable`, `CodingKey`, `Sendable` enum foundation
- `Listable` — For use in list-based UIs
- `Searchable` — Composition of `Nameable`, `Identifiable`, `Hashable`, `Comparable`
- `Imageable` — Provides a typed `ImageResource` for use with SwiftUI `Image`

---

## ⚙️ Compatibility

### Xcode

![Xcode](https://img.shields.io/badge/Xcode-26.0-blue?logo=xcode)

### Swift

![Language Version](https://img.shields.io/badge/Language_Version-6.2-orange?logo=swift)
![Approachable Concurrency](https://img.shields.io/badge/Approachable_Concurrency-Yes-darkgreen?logo=swift)
![Strict Concurrency Checking](https://img.shields.io/badge/Strict_Concurrency_Checking-Complete-darkblue?logo=swift)
![Default Actor Isolation](https://img.shields.io/badge/Default_Actor_Isolation-nil-darkred?logo=swift)

### Platforms

![iOS 26.0](https://img.shields.io/badge/iOS-26.0-blue.svg?logo=apple)
![iPadOS 26.0](https://img.shields.io/badge/iPadOS-26.0-blue.svg?logo=apple)
![macOS 26.0](https://img.shields.io/badge/macOS-26.0-blue.svg?logo=apple)
![tvOS 26.0](https://img.shields.io/badge/tvOS-26.0-blue.svg?logo=apple)
![visionOS 26.0](https://img.shields.io/badge/visionOS-26.0-blue.svg?logo=apple)
![watchOS 26.0](https://img.shields.io/badge/watchOS-26.0-blue.svg?logo=apple)

---

## 📥 Installation

![Swift Package Manager](https://img.shields.io/badge/SPM-Compatible-darkgreen.svg?logo=swift)

### Xcode

Add the package via **File → Add Package Dependencies** and enter:

```
https://github.com/Pianometal-Studios/SwiftyLoadLetter.git
```

### Package.swift

```swift
dependencies: [
    .package(
        url: "https://github.com/Pianometal-Studios/SwiftyLoadLetter.git",
        .upToNextMinor(from: .init(1, 0, 0))
    ),
],
```

```swift
targets: [
    .target(name: "MyTarget", dependencies: [.byName(name: "SwiftyLoadLetter")])
]
```

---

## 📋 Releases

See the full [release history](https://github.com/Pianometal-Studios/SwiftyLoadLetter/releases) for changelogs and version notes.

---

## 📄 License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?logo=mitlicense)](https://opensource.org/licenses/MIT)

SwiftyLoadLetter is available under the MIT license. See [LICENSE.txt](LICENSE.txt) for details.

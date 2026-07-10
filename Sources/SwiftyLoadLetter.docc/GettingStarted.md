# Getting Started

Add SwiftyLoadLetter to your project and reach for its building blocks.

## Installation

Add the package with Swift Package Manager.

### Xcode

Use **File → Add Package Dependencies** and enter:

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

> Important: SwiftyLoadLetter is built with the Swift 6 language mode and requires
> Swift 6.3 (Xcode 26) or later, with a minimum deployment target of iOS 26,
> macOS 26, Mac Catalyst 26, tvOS 26, visionOS 26, or watchOS 26.

## Your first conforming type

Most of the package's value comes from conforming your own types to its protocols.
A string-backed enum that drives a `TabView` is a common case:

```swift
import SwiftUI
import SwiftyLoadLetter

enum Tab: String, Staticable, Searchable, Iconable, Colorable, Listable {
    case home, library, settings

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
```

With that in place you immediately get free behaviour:

```swift
// Case-insensitive search across a collection — from Nameable.
let matches = Tab.allCases.search("lib")        // [.library]

// A stable, bundle-prefixed id for TabView customization — from Staticable.
let id = Tab.home.customizationID
```

## Reaching for the extensions

Beyond your own types, the package decorates common system values with UI metadata
so you don't have to write the same `switch` over and over:

```swift
import SwiftUI
import Network
import SwiftyLoadLetter

func statusLabel(for path: NWPath) -> some View {
    Label(path.status.name, systemImage: path.status.icon)
        .foregroundStyle(path.status.color)
}
```

```swift
// Localized formatting helpers on Double.
0.42.asPercent()      // "42%"
1234.56.currency()    // "$1,234.56"
```

## Next steps

- Learn how the protocols stack together in <doc:ComposingProtocols>.
- Browse the full API in the topic groups on the
  <doc:/documentation/SwiftyLoadLetter> landing page.

# Composing Protocols

Stack small, single-purpose protocols to describe exactly what a type can express.

## Overview

SwiftyLoadLetter's protocols are intentionally narrow. Each one adds a single
capability — a name, an icon, a color, an emoji — and they're designed to be mixed
freely. A type conforms to as many as it needs, and gains the corresponding default
behaviour without restating boilerplate.

## The building blocks

| Protocol | Requirement | What it adds |
|---|---|---|
| ``Nameable`` | `name: String` | A `Comparable` default and a case-insensitive `search()` on any `Collection`. |
| ``Describable`` | `details: String` | A longer user-facing description to complement the short `name`. |
| ``Colorable`` | `color: Color` | An associated SwiftUI `Color` for theming and tinting. |
| ``Iconable`` | `icon: String` | An SF Symbol name, ready for `Image(systemName:)`. |
| ``Imageable`` | `image: ImageResource` | An asset-catalog image for types backed by named assets. |
| ``Emojiable`` | `emoji: String` | A single-emoji representation, plus a free `emojiLabel` when combined with ``Nameable``. |
| ``Searchable`` | composition | ``Nameable`` + `Identifiable` + `Hashable` + `Comparable` for searchable lists. |
| ``Staticable`` | composition | For string-backed enums used as stable identifiers; provides `customizationID`. |
| ``Listable`` | `static navigationTitle` | A navigation title for list-based presentation. |

## How composition pays off

Because the protocols layer, conforming to a combination unlocks behaviour that
none of them provides alone. ``Emojiable`` gives you `emoji`; ``Nameable`` gives you
`name`; conform to **both** and you get `emojiLabel` for free:

```swift
enum LogArea: String, Nameable, Emojiable {
    case network, auth

    var name: String {
        switch self {
        case .network: "Network"
        case .auth:    "Authentication"
        }
    }

    var emoji: String {
        switch self {
        case .network: "🌐"
        case .auth:    "🔐"
        }
    }
}

print(LogArea.network.emojiLabel)   // "🌐 Network"
```

Similarly, ``Searchable`` is itself a composition — conforming to it means a type is
ready to back an autocomplete field or a filterable list, and `search()` works
across any collection of those values.

## Components conform too

The package's own ``PressureLevel``, ``ConnectionState``, ``CommonAction``, and the
`Network.framework` extensions all conform to these protocols. That's why you can
drop a `path.status` or a `pressureLevel` straight into a `Label` and style it:

```swift
Label(state.name, systemImage: state.icon)
    .foregroundStyle(state.color)
```

## See also

- <doc:GettingStarted>
- ``Nameable``
- ``Searchable``
- ``Staticable``

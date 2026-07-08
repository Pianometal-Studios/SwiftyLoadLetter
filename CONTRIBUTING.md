# Contributing to SwiftyLoadLetter

Thanks for taking an interest! SwiftyLoadLetter is a small utility package, and contributions of any size — typo fixes, new extensions, bug reports, documentation cleanup — are all welcome.

This document describes how to file issues, get the project running locally, and submit changes that have a good chance of being merged quickly.

## Code of Conduct

By participating in this project, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md). Please read it before engaging.

## Quick Links

- 🐛 Found a bug? [File an issue](https://github.com/Pianometal-Studios/SwiftyLoadLetter/issues/new/choose) using the bug report template.
- 💡 Have an idea? [Request a feature](https://github.com/Pianometal-Studios/SwiftyLoadLetter/issues/new/choose) using the feature request template.
- 🔐 Found a security issue? See [SECURITY.md](SECURITY.md) — please don't file it as a public issue.
- 💬 Have a question? Start a [Discussion](https://github.com/Pianometal-Studios/SwiftyLoadLetter/discussions).

## Reporting Bugs

Before filing a bug, please:

1. Search [open](https://github.com/Pianometal-Studios/SwiftyLoadLetter/issues) and [closed](https://github.com/Pianometal-Studios/SwiftyLoadLetter/issues?q=is%3Aissue+is%3Aclosed) issues to see if it's already been reported.
2. Make sure you're running the latest tagged release.
3. Use the bug report template — it asks for the version, platform, and a minimal reproduction.

The single most helpful thing you can include is a small, self-contained code sample that demonstrates the problem. "Doesn't work" is hard to act on; ten lines of code we can paste into a playground is gold.

## Suggesting Features

Use the feature request template and describe the problem you're trying to solve before describing the solution. SwiftyLoadLetter is intentionally a "fills in the gaps" utility package — additions are most likely to land if they:

- Solve a problem the standard library or SwiftUI doesn't already solve well.
- Work uniformly across all five Apple platforms (or have clear, narrow platform availability).
- Compose with the existing protocols (`Nameable`, `Iconable`, `Colorable`, etc.) where appropriate.
- Don't introduce new third-party dependencies.

If you're not sure whether something fits, open a Discussion first — saves everyone time.

## Development Setup

### Requirements

- **Xcode 26.0** or later
- **Swift 6.3** language mode with Approachable Concurrency (Complete strict concurrency checking)
- Targets: **iOS / iPadOS / macOS / tvOS / visionOS / watchOS 26.0+**

### Getting the project running

```bash
git clone https://github.com/Pianometal-Studios/SwiftyLoadLetter.git
cd SwiftyLoadLetter
open Package.swift
```

That should be enough to build and run tests. The package has no third-party dependencies.

### Running tests

From Xcode: ⌘U.

From the command line:

```bash
swift test
```

The test suite uses **Swift Testing** (`@Suite`, `@Test`, `#expect`) — not XCTest. New tests should follow that pattern.

### Building the documentation

The public API is documented with DocC. To read it locally, open the package in Xcode and choose **Product → Build Documentation** (⌃⌘D) — no extra tooling or dependencies required.

The version hosted on the [Swift Package Index](https://swiftpackageindex.com/Pianometal-Studios/SwiftyLoadLetter/documentation) is generated automatically from the [`.spi.yml`](.spi.yml) manifest whenever the package is updated.

## Project Structure

```
Sources/
├── AppLogger/             Logging system: LogCategory, OSLogType, free-function helpers
├── Components/            Concrete enums (PressureLevel, PersonNameComponent, etc.)
│   └── ConnectionState/   ConnectionState enum plus its icon/label SwiftUI views
├── Extensions/            Type extensions, organized by framework
│   ├── Battery/           UIDevice.BatteryState, WKInterfaceDeviceBatteryState
│   ├── Edge/              Edge, HorizontalEdge, VerticalEdge, EdgeOrientation
│   ├── GameController/    GCControllerPlayerIndex, GCDeviceBatteryState
│   └── Network/           NWPath.Status, NWPath.LinkQuality, RadioType/, etc.
├── Protocols/             Composable protocols (Nameable, Iconable, Colorable, ...)
│   ├── Colorable/         Colorable protocol
│   ├── Describable/       Describable protocol, DescribableObject, DescribableCardView
│   ├── Iconable/          Iconable protocol, IconableObject
│   └── Imageable/         Imageable protocol, ImageableObject
├── Views/                 SwiftUI views (LiquidMeshBackground)
└── SwiftyLoadLetter.docc/ DocC catalog: landing page and articles

Tests/SwiftyLoadLetterTests/
└── (mirrors Sources/ structure where practical)
```

When adding a new file, place it where readers will expect to find it. New protocols go in `Protocols/`, new concrete types go in `Components/`, type extensions go in `Extensions/` (in a framework subfolder if applicable).

## Code Style

The project follows a few conventions consistently. Please match them in PRs.

### One type per file

Each `struct`, `class`, `enum`, `protocol`, or top-level `extension` lives in its own file, named after the type. The exception is small companion types (e.g. `Edge.Orientation` lives in `EdgeOrientation.swift` next to the related `Edge` extension).

### No `// MARK:` comments

The project deliberately avoids `// MARK:` section dividers. Files should be small enough that they don't need internal navigation aids — if a file feels like it needs MARKs, that's a signal to split it. The one place MARKs are accepted is around `#if DEBUG` preview blocks at the bottom of non-View files.

### Documentation comments

All `public` declarations should have DocC-style documentation comments using Swift-flavored markdown. Use the standard callout names:

```swift
/// A short summary on the first line.
///
/// A longer explanation if needed, in complete sentences.
///
/// ## Example
/// ```swift
/// let result = thing.doSomething(with: input)
/// ```
///
/// - Parameters:
///    - input: What the parameter is for.
///    - bool: If it's true
///
/// - Returns: What the function returns.
///
/// - Throws: Any errors the function can throw.
///
/// - Note: Anything noteworthy.
///
/// - Important: Anything that could trip readers up.
///
/// - Warning: Something very consequential
///
/// - Complexity: If appropriate
///
/// - Authors: [@yourHandle](https://github.com/yourHandle)
public func doSomething(with input: String, isTrue: Bool) throws -> Result {
    ...
}
```

A runnable usage example in the doc comment is strongly preferred — it makes the documentation immediately useful and acts as a smoke test for the API shape.

### Concurrency

- The package uses Swift 6.3 language mode with Approachable Concurrency and **Complete** strict concurrency checking. 
- Default actor isolation is `nonisolated`.
- Don't add `@MainActor` annotations unless the type or member genuinely needs to be main-isolated.

### Tests

- Test names should describe the behavior being verified, not the function being called.
- New types and extensions should ship with tests. The test suite uses Swift Testing:

```swift
import Testing
@testable import SwiftyLoadLetter

@Suite("MyType") struct MyTypeTests {

    @Test("a descriptive name for what's being verified")
    func someBehavior() {
        #expect(MyType.something == expected)
    }
}
```

## Pull Request Process

1. **Open an issue first** for non-trivial changes. This avoids surprises when a PR shows up implementing something we don't plan to merge.
2. **Fork the repository** and create a topic branch off `main`. Suggested branch naming: `fix/short-description`, `feat/short-description`, or `docs/short-description`.
3. **Make your changes** in small, logical commits. We don't enforce a strict commit message format, but please write meaningful subjects.
4. **Add or update tests** that exercise the new behavior.
5. **Update documentation** — the README, in-line DocC comments, and any relevant guides.
6. **Run the test suite** locally before opening the PR.
7. **Open the PR** against `main`. Describe what changed and why, and link the issue it resolves.
8. **Respond to review feedback.** We'll try to be prompt; please be patient if there's a gap.

By submitting a PR, you agree that your contribution is licensed under the project's [Apache License 2.0](LICENSE.txt).

## Release Process

Releases are cut by Pianometal Studios and follow [Semantic Versioning](https://semver.org/). Contributors don't need to update the version themselves — that happens at tag time.

## Recognition

Significant contributions are credited in release notes and in the relevant DocC comments via `- Authors:` tags.

## Questions

Anything unclear? Open a Discussion or email **team@pianometalstudios.com**. We're a small team, so expect human-reasonable response times rather than enterprise SLAs.

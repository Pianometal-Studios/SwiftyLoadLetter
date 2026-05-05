# Security Policy

## Supported Versions

Security fixes are applied to the **latest minor release** of SwiftyLoadLetter. Older versions are not patched.

| Version | Supported          |
|---------|--------------------|
| Latest  | ✅                  |
| Older   | ❌                  |

Please update to the latest tagged release before reporting an issue.

## Reporting a Vulnerability

**Please do not file security issues as public GitHub issues, discussions, or pull requests.** Public disclosure before a fix is available puts users at risk.

You have two options for reporting privately:

### Option 1: GitHub Private Vulnerability Reporting (preferred)

1. Go to the [Security tab](https://github.com/Pianometal-Studios/SwiftyLoadLetter/security) of this repository.
2. Click **Report a vulnerability**.
3. Fill in the form with as much detail as you can.

This routes the report directly to the maintainers and keeps the discussion private until disclosure.

### Option 2: Email

Email **team@pianometalstudios.com** with:

- A description of the vulnerability and its potential impact.
- Steps to reproduce, ideally with a minimal code sample.
- The version of SwiftyLoadLetter affected.
- Any suggested mitigations, if you have them.

If you'd like to encrypt the report, mention that in your initial email and we'll exchange a public key.

## What to Expect

- **Acknowledgment** within 5 business days that we received the report.
- **Initial assessment** within 10 business days, including whether we consider it a security issue and a rough timeline.
- **Coordinated disclosure** once a fix is available. We'll work with you on timing and credit, and will publish a [GitHub Security Advisory](https://github.com/Pianometal-Studios/SwiftyLoadLetter/security/advisories) describing the issue and the fix.

We're a small team, so timelines are best-effort rather than contractual. We will keep you informed throughout.

## Scope

SwiftyLoadLetter is a utility package — it doesn't perform networking, persist user data, or handle credentials. The most realistic security concerns for a package like this are:

- Logic flaws in `URL.create(_:)` or other input-validating helpers that could be exploited by callers passing untrusted input.
- Information leakage through the logging helpers (e.g. accidentally bypassing `os.Logger`'s `.auto` privacy).
- Issues that cause crashes or undefined behavior when called from a security-sensitive context.

Reports of issues outside this scope (for example, vulnerabilities in Apple's frameworks themselves) should be directed to the appropriate vendor.

## Recognition

With your permission, we'll credit you in the security advisory and in the release notes for the fix. If you'd prefer to remain anonymous, just say so in the report.

Thanks for helping keep SwiftyLoadLetter and its users safe.

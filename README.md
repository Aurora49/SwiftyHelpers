# SwiftyHelpers

A small collection of Swift extensions for string validation, translation and bundle information.

**Requirements:** iOS 15 · macOS 12 · tvOS 15 · watchOS 8 · Swift 5.9

## Installation

With Swift Package Manager, add the package to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Aurora49/SwiftyHelpers.git", branch: "main")
]
```

Or in Xcode: **File › Add Package Dependencies…** and paste the URL above.

## Usage

```swift
import SwiftyHelpers
```

### Email and phone number validation

Both functions throw a `StringFormatErrors` when the format is invalid.

```swift
do {
    try "name@domain.com".validateEmail()
    try "+33600000000".validatePhoneNumber()
} catch let error as StringFormatErrors {
    print(error.errorCode)            // "SFE001"
    print(error.localizedDescription) // "Invalid email format!"
}
```

- **Email:** accepts the usual `local@domain.tld` addresses (letters, digits, `.`, `_`, `%`, `+`, `-`).
- **Phone number:** only international numbers without spaces, starting with `+` or `00` (e.g. `+33600000000`).

You can pass your own rule:

```swift
let frenchMobile = NSPredicate(format: "SELF MATCHES %@", "^0[67][0-9]{8}$")
try "0600000000".validatePhoneNumber(rule: frenchMobile)
```

### Translation

```swift
"string.error.format.invalidEmailFormat".translate()   // uses SwiftyHelpers translations
"my.app.key".translate(bundle: .main)                    // uses your app's translations
```

### Bundle information

```swift
Bundle.main.appVersion    // CFBundleShortVersionString, e.g. "1.2.0"
Bundle.main.buildVersion  // CFBundleVersion, e.g. "42"
```

## Error codes

| Code | Error | Message |
|---|---|---|
| `SFE001` | `invalidEmailFormat` | Invalid email format! |
| `SFE002` | `invalidPhoneNumberFormat` | Invalid phone number format! |

Use `errorDescriptionNotTranslated` to get the translation key and provide your own translation.

## Contributing

The package is linted by [SwiftLint](https://github.com/realm/SwiftLint) on every build, with the rules in `.swiftlint.yml`: **any warning fails the build**.

- In Xcode, the first build asks to **Trust & Enable** the SwiftLint plugin.
- On the command line, `swift build` / `swift test` work as is; with `xcodebuild`, add `-skipPackagePluginValidation`.

Translations live in `Sources/SwiftyHelpers/Translations/<language>.lproj/Localizable.strings`.
They are plain `.strings` files rather than a String Catalog, because some SwiftPM command-line
toolchains copy `.xcstrings` without compiling it.

## License

MIT, see [LICENSE](LICENSE).

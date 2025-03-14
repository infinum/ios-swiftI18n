# SwiftI18n

[![Version](https://img.shields.io/cocoapods/v/SwiftI18n.svg?style=flat)](http://cocoapods.org/pods/SwiftI18n)
[![License](https://img.shields.io/cocoapods/l/SwiftI18n.svg?style=flat)](http://cocoapods.org/pods/SwiftI18n)
[![Platform](https://img.shields.io/cocoapods/p/SwiftI18n.svg?style=flat)](http://cocoapods.org/pods/SwiftI18n)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* Xcode 8.0
* Swift 5.0
* iOS 9.0+

## Installation

### Cocoapods

SwiftI18n is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftI18n/I18n'
pod 'SwiftI18n/I18n+Case'
```

### Swift Package Manager

SwiftI18n is also available through SPM. To install
it, simply add the following line to your Package.swift file:

```ruby
.package(url: "git@github.com:infinum/ios-swiftI18n.git", .upToNextMajor(from: "1.3.0"))

```

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Add:

```swift
import SwiftI18n
```

Set or get currently selected language from:

```swift
I18nManager.instance.language
```

Set available languages and default language:

```swift
I18nManager.instance.availableLanguages = ["en_US", "hr"]
I18nManager.instance.defaultLanguage = "hr"
```

If `availableLanguages` are present, and `defaultLanguage` isn't, `language` is initialy set to language most preferable by the user from `availableLanguages`.

Handling language change:
Subscribe to `I18nManager.subscribeForLocaleDidChange(block: { ... } -> -> NSObjectProtocol`
or if you prefer notifications, you can use:

    NSNotification.Name.loc_LanguageDidChangeNotification

### UIKit Support

```swift
someLabel.locTitleKey = "some_key"
someButton.locAccessibilityLabelKey = "button_accessibility_label_key"
someButton.locAccessibilityHintKey = "button_accessibility_hint_key"
```

Now when language changes, your `someLabel`'s title, accessibility label and hint, automaticaly change. Isn't that great!?

Supported elements:
```UILabel```
```UIButton```
```UITextFiled```
```UITextView```
```UIViewController```
```UIBarButtonItem```
```UITabBarItem```
```UINavigationItem```

**And the most important thing, all of those `locTitleKey`s, `locAccessibilityLabelKey`s, `locAccessibilityHintKey`s are supported in ```Storyboards ``` as ```@IBInspectable ```.**

### SwiftUI Support

Using constructor where key is of String type:

```swift
LocText("some_key")
```

#### Integration with Polyglot

Just cp this extension somewhere in your project

```swift
extension LocText {
    
    init(key: Strings) {
        self.init(key.rawValue)
    }
}
```

### Handling cases

Sometimes you have to work with translations that are all lowercased, but you want them to be uppercased or maybe capitalized.
To handle this use:

```ruby
pod 'SwiftI18n/I18n+Case'
```

Now you have an enum:

```swift
enum I18nCaseTransform: String {
    case uppercased = "up"
    case lowercased = "low"
    case capitalized = "cap"
}
```

which you can use like this:

```swift
someButton.setCaseTransform(.uppercased, for: .normal)
```

You can also set case transform in ```Storyboards ```.


### Fallback Language

In some scenarios, a requested localization may not be available for a given language. To ensure a consistent user experience, the app provides a **fallback language** mechanism. This feature guarantees that if a translation is missing in the preferred language, a predefined fallback language will be used to retrieve the localization instead.

#### Setting the Fallback Language

You can configure the fallback language by setting the `fallbackLanguage` property in your localization manager.

For example in your LanguageInitializer class, initialize method, add the following line:

```swift
I18nManager.instance.fallbackLanguage = "en_gb"
```


### Working with Polyglot client Strings enum

For SwiftI18n to work beautifly with polyglot client created `Strings` enum you will need to copy:
`SwiftI18n/Polyglot/PolyglotSwiftI18Extensions.swift`
into your project.

By doing this you can now set translations to your UI elements with ease:

```swift
someLabel.loc.titleKey = .somePolygotKey
someButton.loc.accessibilityLabelKey = .somePolyglotKey
someButton.loc.accessibilityLabelHint = .somePolyglotKey
```

## Not supported 

```
Attributed strings
```

## Privacy

SwiftI18n does not collect any user data. We have provided a [privacy manifest](https://github.com/infinum/ios-swiftI18n/blob/master/SwiftI18n/SupportingFiles/PrivacyInfo.xcprivacy) file that can be included in your app.

## Author

Vlaho Poluta, vlaho.poluta@infinum.hr

## License

SwiftI18n is available under the MIT license. See the LICENSE file for more info.

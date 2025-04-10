# SwiftI18n

[![Version](https://img.shields.io/cocoapods/v/SwiftI18n.svg?style=flat)](http://cocoapods.org/pods/SwiftI18n)
[![License](https://img.shields.io/cocoapods/l/SwiftI18n.svg?style=flat)](http://cocoapods.org/pods/SwiftI18n)
[![Platform](https://img.shields.io/cocoapods/p/SwiftI18n.svg?style=flat)](http://cocoapods.org/pods/SwiftI18n)

## Description

With Swift-I18n, you can give users the possibility to make your app's language different from the system's. Language can be changed from inside the app, and if you use `locTitleKey` in UIKit or `LocText` in SwiftUI, language change will be automatically reflected on all the UI elements that are already loaded and rendered on the screen.

## Table of contents

* [Requirements](#requirements)
* [Getting started](#getting-started)
* [Usage](#usage)
* [Privacy](#privacy)
* [Contributing](#contributing)
* [License](#license)
* [Credits](#credits)

## Requirements

* Xcode 8.0
* Swift 5.0
* iOS 9.0+

## Getting started

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
- ```UILabel```
- ```UIButton```
- ```UITextFiled```
- ```UITextView```
- ```UIViewController```
- ```UIBarButtonItem```
- ```UITabBarItem```
- ```UINavigationItem```

**And another important thing, all of those `locTitleKey`s, `locAccessibilityLabelKey`s, `locAccessibilityHintKey`s are supported in ```Storyboards ``` as ```@IBInspectable ```.**

### SwiftUI Support

Using constructor where key is of String type:

```swift
LocText("some_key")
```

#### Integration with Polyglot

Just copy/paste this extension somewhere in your project

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

You can also set case transform in ```Storyboards ```

### Fallback Language

In some scenarios, a requested localization may not be available for a given language. To ensure a consistent user experience, the app provides a **fallback language** mechanism. This feature guarantees that if a translation is missing in the preferred language, a predefined fallback language will be used to retrieve the localization instead.

You can configure the fallback language by setting the `fallbackLanguage` property in your localization manager.

Simply use the following line:

```swift
I18nManager.instance.fallbackLanguage = "en_gb"
```

### Working with Polyglot's `Strings` enum

For SwiftI18n to work beautifully with `Strings` enum from [Polyglot](https://github.com/infinum/ios-polyglot-cli), you will need to copy [PolyglotSwiftI18Extensions.swift](SwiftI18n/Polyglot/PolyglotSwiftI18Extensions.swift) into your project.

By doing this you can now set translations to your UI elements with ease:

```swift
someLabel.loc.titleKey = .somePolygotKey
someButton.loc.accessibilityLabelKey = .somePolyglotKey
someButton.loc.accessibilityLabelHint = .somePolyglotKey
```

### Not supported 

```
Attributed strings
```

## Privacy

SwiftI18n does not collect any user data. We have provided a [privacy manifest](https://github.com/infinum/ios-swiftI18n/blob/master/SwiftI18n/SupportingFiles/PrivacyInfo.xcprivacy) file that can be included in your app.

## Contributing

We believe that the community can help us improve and build better a product.
Please refer to our [contributing guide](CONTRIBUTING.md) to learn about the types of contributions we accept and the process for submitting them.

To ensure that our community remains respectful and professional, we defined a [code of conduct](CODE_OF_CONDUCT.md) <!-- and [coding standards](<link>) --> that we expect all contributors to follow.

We appreciate your interest and look forward to your contributions.

## License

```text
Copyright 2024 Infinum

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

## Credits

Maintained and sponsored by [Infinum](https://infinum.com).

<div align="center">
    <a href='https://infinum.com'>
    <picture>
        <source srcset="https://assets.infinum.com/brand/logo/static/white.svg" media="(prefers-color-scheme: dark)">
        <img src="https://assets.infinum.com/brand/logo/static/default.svg">
    </picture>
    </a>
</div>

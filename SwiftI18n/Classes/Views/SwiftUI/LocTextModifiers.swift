//
//  LocTextModifiers.swift
//
//
//  Created by Martin Čolja on 03.02.2024..
//

import SwiftUI

// MARK: - Applying a custom Text modifier
extension LocTextContent {

    func modifier(_ modifier: @escaping (Text) -> Text) -> Self {
        switch self {
        case .key(let string, let modifiers):
            return .key(string, modifiers: modifiers + [modifier])
        case .text(let text):
            return .text(modifier(text))
        }
    }
}

public extension LocText {

    func modifier(_ modifier: @escaping (Text) -> Text) -> Self {
        LocText(content: content.map { $0.modifier(modifier) })
    }
}

// MARK: - Choosing a font
public extension LocText {

    func font(_ font: Font?) -> LocText {
        modifier { $0.font(font) }
    }

    func fontWeight(_ weight: Font.Weight?) -> LocText {
        modifier { $0.fontWeight(weight) }
    }

    @available(iOS 16.1, *)
    func fontDesign(_ design: Font.Design?) -> LocText {
        modifier { $0.fontDesign(design) }
    }

    @available(iOS 16.0, *)
    func fontWidth(_ width: Font.Width?) -> LocText {
        modifier { $0.fontWidth(width) }
    }
}

// MARK: - Styling the view’s text
public extension LocText {

    @available(iOS 17.0, *)
    func foregroundStyle<S>(_ style: S) -> LocText where S : ShapeStyle {
        modifier { $0.foregroundStyle(style) }
    }

    func bold() -> LocText {
        modifier { $0.bold() }
    }

    @available(iOS 16.0, *)
    func bold(_ isActive: Bool) -> LocText {
        modifier { $0.bold(isActive) }
    }

    func italic() -> LocText {
        modifier { $0.italic() }
    }

    @available(iOS 16.0, *)
    func italic(_ isActive: Bool) -> LocText {
        modifier { $0.italic(isActive) }
    }

    func strikethrough(
        _ isActive: Bool = true,
        color: Color? = nil
    ) -> LocText {
        modifier {
            $0.strikethrough(
                isActive,
                color: color
            )
        }
    }

    @available(iOS 16.0, *)
    func strikethrough(
        _ isActive: Bool = true,
        pattern: Text.LineStyle.Pattern,
        color: Color? = nil
    ) -> LocText {
        modifier {
            $0.strikethrough(
                isActive,
                pattern: pattern,
                color: color
            )
        }
    }

    func underline(
        _ isActive: Bool = true,
        color: Color? = nil
    ) -> LocText {
        modifier {
            $0.underline(
                isActive,
                color: color
            )
        }
    }

    @available(iOS 16.0, *)
    func underline(
        _ isActive: Bool = true,
        pattern: Text.LineStyle.Pattern,
        color: Color? = nil
    ) -> LocText {
        modifier {
            $0.underline(
                isActive,
                pattern: pattern,
                color: color
            )
        }
    }

    @available(iOS 16.4, *)
    func monospaced(_ isActive: Bool = true) -> LocText {
        modifier { $0.monospaced(isActive) }
    }

    @available(iOS 15.0, *)
    func monospacedDigit() -> LocText {
        modifier { $0.monospacedDigit() }
    }


    func kerning(_ kerning: CGFloat) -> LocText {
        modifier { $0.kerning(kerning) }
    }

    func tracking(_ tracking: CGFloat) -> LocText {
        modifier { $0.tracking(tracking) }
    }

    func baselineOffset(_ baselineOffset: CGFloat) -> LocText {
        modifier { $0.baselineOffset(baselineOffset) }
    }
}

// MARK: - Fitting text into available space
public extension LocText {

    @available(iOS 17.0, *)
    func textScale(
        _ scale: Text.Scale,
        isEnabled: Bool = true
    ) -> LocText {
        modifier {
            $0.textScale(
                scale,
                isEnabled: isEnabled
            )
        }
    }
}

// MARK: - Localizing text
public extension LocText {

    @available(iOS 17.0, *)
    func typesettingLanguage(
        _ language: TypesettingLanguage,
        isEnabled: Bool = true
    ) -> LocText {
        modifier {
            $0.typesettingLanguage(
                language,
                isEnabled: isEnabled
            )
        }
    }

    @available(iOS 17, *)
    func typesettingLanguage(
        _ language: Locale.Language,
        isEnabled: Bool = true
    ) -> LocText {
        modifier {
            $0.typesettingLanguage(
                language,
                isEnabled: isEnabled
            )
        }
    }
}

// MARK: - Configuring voiceover
public extension LocText {

    @available(iOS 15.0, *)
    func speechAdjustedPitch(_ value: Double) -> LocText {
        modifier { $0.speechAdjustedPitch(value) }
    }

    @available(iOS 15.0, *)
    func speechAlwaysIncludesPunctuation(_ value: Bool = true) -> LocText {
        modifier { $0.speechAlwaysIncludesPunctuation(value) }
    }

    @available(iOS 15.0, *)
    func speechAnnouncementsQueued(_ value: Bool = true) -> LocText {
        modifier { $0.speechAnnouncementsQueued(value) }
    }

    @available(iOS 15.0, *)
    func speechSpellsOutCharacters(_ value: Bool = true) -> LocText {
        modifier { $0.speechSpellsOutCharacters(value) }
    }
}

// MARK: - Providing accessibility information
public extension LocText {

    @available(iOS 15.0, *)
    func accessibilityHeading(_ level: AccessibilityHeadingLevel) -> LocText {
        modifier { $0.accessibilityHeading(level) }
    }

    @available(iOS 15.0, *)
    func accessibilityLabel<S>(_ label: S) -> LocText where S : StringProtocol {
        modifier { $0.accessibilityLabel(label) }
    }

    @available(iOS 15.0, *)
    func accessibilityLabel(_ label: Text) -> LocText {
        modifier { $0.accessibilityLabel(label) }
    }

    @available(iOS 15.0, *)
    func accessibilityLabel(_ labelKey: LocalizedStringKey) -> LocText {
        modifier { $0.accessibilityLabel(labelKey) }
    }

    @available(iOS 15.0, *)
    func accessibilityTextContentType(_ value: AccessibilityTextContentType) -> LocText {
        modifier { $0.accessibilityTextContentType(value) }
    }
}

// MARK: - Combining text views
public extension LocText {

    static func + (lhs: LocText, rhs: LocText) -> LocText {
        LocText(content: lhs.content + rhs.content)
    }

    static func + (lhs: Text, rhs: LocText) -> LocText {
        LocText(content: [.text(lhs)] + rhs.content)
    }

    static func + (lhs: LocText, rhs: Text) -> LocText {
        LocText(content: lhs.content + [.text(rhs)])
    }
}


// MARK: - Deprecated symbols
public extension LocText {

    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "foregroundStyle(_:)")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "foregroundStyle(_:)")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "foregroundStyle(_:)")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, renamed: "foregroundStyle(_:)")
    @available(visionOS, introduced: 1.0, deprecated: 100000.0, renamed: "foregroundStyle(_:)")
    func foregroundColor(_ color: Color?) -> LocText {
        modifier { $0.foregroundColor(color) }
    }
}
